SELECT m.nama_mahasiswa, mk.nama_mk, mk.sks
FROM krs k
JOIN mahasiswa m ON k.id_mahasiswa = m.id_mahasiswa
JOIN mata_kuliah mk ON k.id_mk = mk.id_mk
WHERE m.prodi = 'Sistem Informasi'
  AND mk.sks > 2
ORDER BY mk.sks DESC, m.nama_mahasiswa ASC;