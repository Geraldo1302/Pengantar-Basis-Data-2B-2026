DROP TABLE rekam_medis;
CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR (250);
	     
FOREIGN KEY (id_pasien)
REFERENCES pasien(id_pasien)
ON DELETE RESTRICT, 
FOREIGN KEY (id_dokter)
REFERENCES dokter(id_dokter)
ON DELETE CASCADE
);

INSERT INTO rekam_medis VALUES 
(1,2,1,"2026-11-12","penyakit mata"),
(2,1,1,"2026-11-13","mata kabur"),
(3,1,2,"2026-11-14","periksa kandungan");

DELETE FROM dokter
WHERE id_dokter = 1;
SELECT * FROM rekam_medis;


