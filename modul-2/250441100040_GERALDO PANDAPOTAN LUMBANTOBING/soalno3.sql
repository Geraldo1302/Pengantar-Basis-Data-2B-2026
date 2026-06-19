UPDATE pasien 
SET no_telp = 086745312871
WHERE id_pasien = 2;

UPDATE dokter 
SET spesialis = "dokter kandungan"
WHERE id_dokter = 2;

DELETE FROM rekam_medis
WHERE id_rekam = 2;

SELECT * FROM dokter;
SELECT * FROM pasien;
SELECT * FROM rekam_medis;