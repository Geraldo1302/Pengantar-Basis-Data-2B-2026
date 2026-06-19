# nomor 2
SELECT DISTINCT kategori
FROM investasi_gudang_pusat
WHERE kode_sku LIKE 'ELEC%X'
AND harga_satuan > 5000000;

DESCRIBE investasi_gudang_pusat;
SELECT * FROM investasi_gudang_pusat;