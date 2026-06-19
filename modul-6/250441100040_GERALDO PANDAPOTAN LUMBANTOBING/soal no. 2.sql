SELECT mk.kode_mk, mk.nama_mk
FROM mata_kuliah mk
WHERE mk.kode_mk IN (
    SELECT k.kode_mk
    FROM krs k
    WHERE k.nim = (
        SELECT nim
        FROM mahasiswa
        WHERE nama = 'Budi Santoso'
    )
);
