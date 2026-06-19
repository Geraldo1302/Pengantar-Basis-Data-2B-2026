SELECT kode_mk, AVG(nilai_angka) AS rata_rata
FROM (
    SELECT kode_mk, nilai_angka
    FROM nilai
    WHERE kode_mk IN ('MK01', 'MK02')
) AS temp
GROUP BY kode_mk;
