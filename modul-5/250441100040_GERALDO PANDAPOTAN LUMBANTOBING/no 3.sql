SELECT m.nim, m.nama, SUM(mk.sks) AS Total_SKS
FROM mahasiswa AS m
JOIN krs AS k ON m.nim = k.nim
JOIN mata_kuliah  AS mk 
ON k.kode_mk = mk.kode_mk
WHERE k.semester IN (1, 3)
GROUP BY m.nim, m.nama;

SELECT * FROM mahasiswa;
SELECT * FROM krs;
SELECT * FROM mata_kuliah;