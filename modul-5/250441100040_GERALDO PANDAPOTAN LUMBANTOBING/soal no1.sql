Bagian akademik ingin mengetahui rata-rata nilai angka yang diperoleh setiap mahasiswa. 
Laporan hanya menampilkan mahasiswa yang memiliki rata-rata nilai lebih dari 80. 
Namun, query yang dibuat masih salah dan perlu diperbaiki.


SELECT 
    m.nim,
    m.nama,
    AVG(n.nilai_angka) AS Rata_Rata_Nilai
FROM mahasiswa m
JOIN nilai n
    ON m.nim = n.nim
WHERE AVG(n.nilai_angka) > 80
GROUP BY m.nim
ORDER BY Rata_Rata_Nilai ;