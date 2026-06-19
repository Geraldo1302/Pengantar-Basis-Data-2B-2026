SELECT nama_barang, harga_satuan, stastus_qc
FROM investasi_gudang_pusat
WHERE kategori <> 'Furniture'
AND stastus_qc = 'Lulus'
ORDER BY harga_satuan DESC
LIMIT 3;

