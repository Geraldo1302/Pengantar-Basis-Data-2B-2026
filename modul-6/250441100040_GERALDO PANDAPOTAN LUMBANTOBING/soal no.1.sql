SELECT m.nim, m.nama, n.nilai_angka
FROM mahasiswa m
JOIN nilai n ON m.nim = n.nim
WHERE n.nilai_angka > (
    SELECT AVG(nilai_angka)
    FROM nilai
);
