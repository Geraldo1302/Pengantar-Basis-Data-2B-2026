# nomor 4
SELECT *
FROM investasi_gudang_pusat
WHERE lokasi_rak LIKE 'B%'
AND NOT (harga_satuan BETWEEN 1000000 AND 5000000)
AND kategori <> 'Monitor';


DESCRIBE investasi_gudang_pusat;
SELECT * FROM investasi_gudang_pusat;