CREATE VIEW v_transkrip_lengkap AS
SELECT
    m.nim,
    m.nama AS nama_mahasiswa,
    mk.nama_mk,
    n.nilai_huruf
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim
JOIN mata_kuliah mk ON n.kode_mk = mk.kode_mk;

SELECT *
FROM v_transkrip_lengkap
WHERE nilai_huruf = 'A'
