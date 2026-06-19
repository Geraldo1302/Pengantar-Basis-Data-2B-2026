CREATE TABLE dokter(
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(50),
spesialis VARCHAR (50)
);

CREATE TABLE pasien(
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(50),
tgl_lahir DATE,
no_telp CHAR (13)
)

CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
 id_pasien INT,
 id_dokter INT,
 tanggal_periksa DATE,
 diagnosis VARCHAR (250),
 FOREIGN KEY (id_pasien)
 REFERENCES pasien (id_pasien),
 FOREIGN KEY (id_dokter)
 REFERENCES dokter(id_dokter)
 ON DELETE RESTRICT
 )

