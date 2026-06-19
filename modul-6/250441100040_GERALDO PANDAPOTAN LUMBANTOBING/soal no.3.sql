SELECT m.nim, m.nama
FROM mahasiswa m
WHERE EXISTS (
    SELECT 1
    FROM nilai n
    WHERE n.nim = m.nim
);
