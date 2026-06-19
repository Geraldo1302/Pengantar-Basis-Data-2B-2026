CREATE DATABASE sistem_apotek;
USE sistem_apotek;

CREATE TABLE manajer (
    id_manajer VARCHAR(10) PRIMARY KEY,
    nama_manajer VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15)
);

CREATE TABLE pegawai (
    id_pegawai VARCHAR(10) PRIMARY KEY,
    nama_pegawai VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15),
    shift ENUM('Pagi', 'Siang', 'Malam') NOT NULL,
    jabatan ENUM('Kasir', 'Apoteker', 'Petugas Gudang') NOT NULL,
    id_manajer VARCHAR(10),
    FOREIGN KEY (id_manajer) REFERENCES manajer(id_manajer) ON DELETE SET NULL
);

CREATE TABLE pelanggan (
    id_pelanggan VARCHAR(10) PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15),
    total_poin_member INT DEFAULT 0
);

CREATE TABLE supplier (
    id_supplier VARCHAR(10) PRIMARY KEY,
    nama_supplier VARCHAR(100) NOT NULL,
    alamat TEXT,
    no_telepon VARCHAR(15)
);

CREATE TABLE kategori_obat (
    id_kategori VARCHAR(5) PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL
);

CREATE TABLE obat (
    id_obat VARCHAR(10) PRIMARY KEY,
    nama_obat VARCHAR(100) NOT NULL,
    id_kategori VARCHAR(5),
    harga_jual INT NOT NULL,
    FOREIGN KEY (id_kategori) REFERENCES kategori_obat(id_kategori) ON DELETE SET NULL
);

CREATE TABLE detail_obat (
    id_detail VARCHAR(10) PRIMARY KEY,
    id_obat VARCHAR(10),
    id_supplier VARCHAR(10),
    stok INT DEFAULT 0,
    tgl_masuk DATE NOT NULL,
    tgl_expired DATE NOT NULL,
    FOREIGN KEY (id_obat) REFERENCES obat(id_obat) ON DELETE CASCADE,
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier) ON DELETE SET NULL
);

CREATE TABLE pembelian (
    id_pembelian VARCHAR(10) PRIMARY KEY,
    tgl_pembelian DATE NOT NULL,
    id_petugas VARCHAR(10),
    id_manajer VARCHAR(10),
    id_supplier VARCHAR(10),
    total_harga_pembelian INT DEFAULT 0,
    FOREIGN KEY (id_petugas) REFERENCES pegawai(id_pegawai),
    FOREIGN KEY (id_manajer) REFERENCES manajer(id_manajer),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);

CREATE TABLE detail_pembelian (
    id_detail_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    id_pembelian VARCHAR(10),
    id_obat VARCHAR(10),
    jumlah_beli INT NOT NULL,
    harga_beli_satuan INT NOT NULL,
    subtotal INT NOT NULL,
    FOREIGN KEY (id_pembelian) REFERENCES pembelian(id_pembelian) ON DELETE CASCADE,
    FOREIGN KEY (id_obat) REFERENCES obat(id_obat)
);

CREATE TABLE penjualan (
    id_penjualan VARCHAR(10) PRIMARY KEY,
    tgl_penjualan DATE NOT NULL,
    id_kasir VARCHAR(10), 
    id_pelanggan VARCHAR(10), 
    total_harga_penjualan INT DEFAULT 0,
    FOREIGN KEY (id_kasir) REFERENCES pegawai(id_pegawai),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan) ON DELETE SET NULL
);

CREATE TABLE detail_penjualan (
    id_detail_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_detail_obat VARCHAR(10),
    id_penjualan VARCHAR(10),
    jumlah_jual INT NOT NULL,
    harga_jual_satuan INT NOT NULL,
    subtotal INT NOT NULL,
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan) ON DELETE CASCADE,
    FOREIGN KEY (id_detail_obat) REFERENCES detail_obat(id_detail)
);


INSERT INTO kategori_obat (id_kategori, nama_kategori) VALUES 
('K01', 'Antibiotik'), 
('K02', 'Analgesik & Antipiretik'), 
('K03', 'Vitamin & Suplemen'),
('K04', 'Antasida & Obat Lambung'), 
('K05', 'Antihistamin (Obat Alergi)'), 
('K06', 'Obat Batuk & Pilek'),
('K07', 'Salep Kulit & Topikal'), 
('K08', 'Tetes Mata'), 
('K09', 'Tetes Telinga'),
('K10', 'Antihipertensi (Tekanan Darah)'), 
('K11', 'Antidiabetes'), 
('K12', 'Antikolesterol'),
('K13', 'Antijamur'), 
('K14', 'Antivirus'), 
('K15', 'Kortikosteroid (Antiinflamasi)'),
('K16', 'Suplemen & Vitamin Anak'), 
('K17', 'Obat Asma & Pernapasan'), 
('K18', 'Peralatan & Cairan P3K'),
('K19', 'Obat Herbal & Tradisional'), 
('K20', 'Alat Kesehatan Dasar');

INSERT INTO obat (id_obat, nama_obat, id_kategori, harga_jual) VALUES 
('OB001', 'Amoxicillin 500mg', 'K01', 15000), 
('OB002', 'Paracetamol 500mg', 'K02', 5000),
('OB003', 'Ibuprofen 400mg', 'K02', 8000), 
('OB004', 'Vitamin C 1000mg', 'K03', 12000),
('OB005', 'Promag Tablet', 'K04', 9000), 
('OB006', 'Cetirizine 10mg', 'K05', 10000),
('OB007', 'OBH Combi Sirup', 'K06', 18000), 
('OB008', 'Kalpanax Krim', 'K07', 14000),
('OB009', 'Insto Tetes Mata', 'K08', 16000), 
('OB010', 'Erlamycetin Telinga', 'K09', 20000),
('OB011', 'Amlodipine 5mg', 'K10', 15000), 
('OB012', 'Metformin 500mg', 'K11', 12000),
('OB013', 'Simvastatin 10mg', 'K12', 17000), 
('OB014', 'Ketoconazole Tablet', 'K13', 25000),
('OB015', 'Acyclovir 400mg', 'K14', 30000), 
('OB016', 'Dexamethasone 0.5mg', 'K15', 7000),
('OB017', 'Sakatonik ABC', 'K16', 22000), 
('OB018', 'Ventolin Inhaler', 'K17', 125000),
('OB019', 'Betadine Antiseptik', 'K18', 11000), 
('OB020', 'Tolak Angin Cair', 'K19', 35000);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, no_telepon) VALUES 
('SP01', 'PT Kimia Farma Trading', 'Surabaya', '031-55501'),
('SP02', 'CV Medika Utama', 'Sidoarjo', '031-55502'),
('SP03', 'PT Dexa Medica', 'Jakarta', '021-55503'),
('SP04', 'PT Sanbe Farma', 'Bandung', '022-55504'),
('SP05', 'PT Kalbe Farma', 'Bekasi', '021-55505'),
('SP06', 'PT Bina San Prima', 'Surabaya', '031-55506'),
('SP07', 'PT Enseval Putera', 'Jakarta Timur', '021-55507'),
('SP08', 'PT Mensa Binasukses', 'Semarang', '024-55508'),
('SP09', 'PT Parit Padang Global', 'Malang', '0341-55509'),
('SP10', 'PT Anugerah Pharmindo', 'Gresik', '031-55510'),
('SP11', 'PT Rajawali Nusindo', 'Jakarta', '021-55511'),
('SP12', 'PT Dos Ni Roha', 'Denpasar', '0361-55512'),
('SP13', 'PT Millenium Pharmacon', 'Yogyakarta', '0274-55513'),
('SP14', 'PT Kebayoran Pharma', 'Jakarta', '021-55514'),
('SP15', 'PT Sinar Medica', 'Medan', '061-55515'),
('SP16', 'PT Penta Valent', 'Surabaya', '031-55516'),
('SP17', 'PT Sawah Besar Farma', 'Jakarta Pusat', '021-55517'),
('SP18', 'PT Indofarma Global', 'Bekasi', '021-55518'),
('SP19', 'PT Pharos Indonesia', 'Jakarta Selatan', '021-55519'),
('SP20', 'PT Tempo Scan Pacific', 'Jakarta', '021-55520');

INSERT INTO manajer (id_manajer, nama_manajer, no_telepon) VALUES
('MN001', 'Hendra Wijaya', '08123456001');

INSERT INTO pegawai (id_pegawai, nama_pegawai, no_telepon, shift, jabatan, id_manajer) VALUES 
('PG002', 'Siti Aminah', '08123456002', 'Pagi', 'Apoteker', 'MN001'),
('PG007', 'Cici Permata', '08123456007', 'Pagi', 'Kasir', 'MN001'),
('PG008', 'Eko Purnomo', '08123456008', 'Siang', 'Kasir', 'MN001'),
('PG014', 'Kiki Fatmala', '08123456014', 'Pagi', 'Petugas Gudang', 'MN001'),
('PG015', 'Lukman Hakim', '08123456015', 'Siang', 'Petugas Gudang', 'MN001');

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, no_telepon, total_poin_member) VALUES 
('PL001', 'Aris Setiawan', '089900001', 10),
('PL002', 'Bambang P', '089900002', 25),
('PL003', 'Citra Kirana', '089900003', 5),
('PL004', 'Dedi Mizwar', '089900004', 40),
('PL005', 'Endang Sri', '089900005', 0),
('PL006', 'Ferry Salim', '089900006', 15),
('PL007', 'Gita Gutawa', '089900007', 30),
('PL008', 'Hesti P', '089900008', 50),
('PL009', 'Irfan Hakim', '089900009', 8),
('PL010', 'Jamal Mirdad', '089900010', 12),
('PL011', 'Kevin Julio', '089900011', 20),
('PL012', 'Luna Maya', '089900012', 35),
('PL013', 'Maudy Ayunda', '089900013', 45),
('PL014', 'Naysila M', '089900014', 18),
('PL015', 'Oka Antara', '089900015', 7),
('PL016', 'Prilly L', '089900016', 60),
('PL017', 'Reza Rahadian', '089900017', 22),
('PL018', 'Sule Prikitiw', '089900018', 0),
('PL019', 'Tora Sudiro', '089900019', 14),
('PL020', 'Ussy Sulistia', '089900020', 85);

-- Diperbaiki: id_petugas hanya menggunakan PG014 dan PG015 yang sudah ada
INSERT INTO pembelian (id_pembelian, tgl_pembelian, id_petugas, id_manajer, id_supplier, total_harga_pembelian) VALUES 
('PB001', '2026-05-01', 'PG014', 'MN001', 'SP01', 1800000),
('PB002', '2026-05-02', 'PG015', 'MN001', 'SP02', 4200000),
('PB003', '2026-05-03', 'PG014', 'MN001', 'SP05', 1500000),
('PB004', '2026-05-04', 'PG015', 'MN001', 'SP01', 800000),
('PB005', '2026-05-05', 'PG014', 'MN001', 'SP07', 1800000),
('PB006', '2026-05-06', 'PG015', 'MN001', 'SP11', 3500000),
('PB007', '2026-05-07', 'PG014', 'MN001', 'SP05', 2000000),
('PB008', '2026-05-08', 'PG014', 'MN001', 'SP08', 1600000),
('PB009', '2026-05-09', 'PG015', 'MN001', 'SP09', 1500000),
('PB010', '2026-05-10', 'PG015', 'MN001', 'SP10', 2800000),
('PB011', '2026-05-11', 'PG014', 'MN001', 'SP11', 1000000),
('PB012', '2026-05-12', 'PG015', 'MN001', 'SP12', 2800000),
('PB013', '2026-05-13', 'PG014', 'MN001', 'SP13', 2000000),
('PB014', '2026-05-14', 'PG015', 'MN001', 'SP14', 1200000),
('PB015', '2026-05-15', 'PG014', 'MN001', 'SP15', 1800000),
('PB016', '2026-05-16', 'PG015', 'MN001', 'SP16', 2500000),
('PB017', '2026-05-17', 'PG014', 'MN001', 'SP17', 1400000),
('PB018', '2026-05-18', 'PG015', 'MN001', 'SP18', 3200000),
('PB019', '2026-05-19', 'PG014', 'MN001', 'SP19', 2100000),
('PB020', '2026-05-20', 'PG015', 'MN001', 'SP20', 1750000); 

INSERT INTO detail_pembelian (id_pembelian, id_obat, jumlah_beli, harga_beli_satuan, subtotal) VALUES 
('PB001', 'OB001', 100, 10000, 1000000),
('PB001', 'OB002', 200, 4000, 800000),
('PB002', 'OB003', 150, 8000, 1200000),
('PB002', 'OB004', 300, 10000, 3000000),
('PB003', 'OB005', 100, 7000, 700000),
('PB003', 'OB006', 100, 8000, 800000),
('PB004', 'OB019', 100, 8000, 800000),
('PB005', 'OB007', 120, 15000, 1800000),
('PB006', 'OB011', 200, 10000, 2000000),
('PB006', 'OB012', 150, 10000, 1500000),
('PB006', 'OB014', 50, 20000, 1000000),
('PB007', 'OB020', 100, 20000, 2000000);

INSERT INTO detail_obat (id_detail, id_obat, id_supplier, stok, tgl_masuk, tgl_expired) VALUES 
('BT001', 'OB001', 'SP01', 85,  '2026-05-01', '2028-05-01'), 
('BT002', 'OB002', 'SP01', 165, '2026-05-01', '2029-01-01'), 
('BT003', 'OB003', 'SP02', 140, '2026-05-03', '2027-12-01'), 
('BT004', 'OB004', 'SP02', 250, '2026-05-03', '2028-06-01'), 
('BT005', 'OB005', 'SP05', 70,  '2024-01-15', '2026-01-15'), 
('BT006', 'OB006', 'SP05', 100, '2026-05-05', '2029-05-05'), 
('BT007', 'OB007', 'SP07', 105, '2026-05-12', '2028-08-01'), 
('BT008', 'OB008', 'SP08', 85,  '2026-05-20', '2028-05-20'), 
('BT009', 'OB009', 'SP08', 45,  '2025-05-20', '2026-05-20'), 
('BT010', 'OB010', 'SP09', 90,  '2026-05-22', '2029-01-01'), 
('BT011', 'OB011', 'SP11', 170, '2026-05-15', '2029-11-11'), 
('BT012', 'OB012', 'SP11', 130, '2026-05-15', '2028-02-12'), 
('BT013', 'OB013', 'SP10', 130, '2026-05-25', '2028-12-12'), 
('BT014', 'OB014', 'SP11', 50,  '2024-04-14', '2026-04-14'), 
('BT015', 'OB015', 'SP10', 45,  '2026-05-25', '2027-10-10'), 
('BT016', 'OB016', 'SP12', 150, '2026-05-28', '2029-06-06'), -- Aman
('BT017', 'OB017', 'SP12', 90,  '2026-05-28', '2028-08-08'), 
('BT018', 'OB018', 'SP13', 18,  '2024-02-10', '2026-02-10'), 
('BT019', 'OB019', 'SP01', 80,  '2026-05-10', '2029-09-19'), 
('BT020', 'OB020', 'SP05', 90,  '2026-05-18', '2027-10-20'); 

INSERT INTO penjualan (id_penjualan, tgl_penjualan, id_kasir, id_pelanggan, total_harga_penjualan) VALUES 
('PJ001', '2026-06-01', 'PG007', 'PL001', 50000),
('PJ002', '2026-06-02', 'PG008', 'PL002', 40000),
('PJ003', '2026-06-03', 'PG007', NULL,    24000),
('PJ004', '2026-06-04', 'PG008', 'PL004', 27000),
('PJ005', '2026-06-05', 'PG007', 'PL005', 36000),
('PJ006', '2026-06-06', 'PG008', NULL,    14000),
('PJ007', '2026-06-07', 'PG007', 'PL007', 32000),
('PJ008', '2026-06-08', 'PG007', 'PL008', 20000),
('PJ009', '2026-06-09', 'PG008', NULL,    45000),
('PJ010', '2026-06-10', 'PG008', 'PL010', 24000),
('PJ011', '2026-06-11', 'PG007', 'PL011', 34000),
('PJ012', '2026-06-12', 'PG008', 'PL012', 30000),
('PJ013', '2026-06-13', 'PG007', NULL,    35000),
('PJ014', '2026-06-14', 'PG008', 'PL014', 44000),
('PJ015', '2026-06-15', 'PG007', 'PL015', 125000),
('PJ016', '2026-06-16', 'PG008', NULL,    22000),
('PJ017', '2026-06-17', 'PG007', 'PL017', 70000),
('PJ018', '2026-06-18', 'PG008', 'PL018', 27000),
('PJ019', '2026-06-19', 'PG007', NULL,    15000),
('PJ020', '2026-06-20', 'PG008', 'PL020', 30000);

INSERT INTO detail_penjualan (id_detail_obat, id_penjualan, jumlah_jual, harga_jual_satuan, subtotal) VALUES 
('BT001', 'PJ001', 2, 15000, 30000),
('BT002', 'PJ001', 4, 5000, 20000),
('BT003', 'PJ002', 5, 8000, 40000),
('BT004', 'PJ003', 2, 12000, 24000),
('BT005', 'PJ004', 3, 9000, 27000),
('BT007', 'PJ005', 2, 18000, 36000),
('BT008', 'PJ006', 1, 14000, 14000),
('BT009', 'PJ007', 2, 16000, 32000),
('BT010', 'PJ008', 1, 20000, 20000),
('BT011', 'PJ009', 3, 15000, 45000),
('BT012', 'PJ010', 2, 12000, 24000),
('BT013', 'PJ011', 2, 17000, 34000),
('BT015', 'PJ012', 1, 30000, 30000),
('BT016', 'PJ013', 5, 7000, 35000),
('BT017', 'PJ014', 2, 22000, 44000),
('BT018', 'PJ015', 1, 125000, 125000),
('BT019', 'PJ016', 2, 11000, 22000),
('BT020', 'PJ017', 2, 35000, 70000),
('BT001', 'PJ018', 1, 15000, 15000),
('BT004', 'PJ018', 1, 12000, 12000),
('BT002', 'PJ019', 3, 5000, 15000),
('BT011', 'PJ020', 2, 15000, 30000);

CREATE VIEW v_obat_terlaris AS
SELECT
    o.id_obat,
    o.nama_obat,
    SUM(dp.jumlah_jual) AS total_terjual
FROM detail_penjualan dp
JOIN detail_obat dobt ON dp.id_detail_obat = dobt.id_detail
JOIN obat o ON dobt.id_obat = o.id_obat
GROUP BY o.id_obat, o.nama_obat
ORDER BY total_terjual DESC;

CREATE VIEW v_obat_expired AS
SELECT 
    detail_obat.id_detail,
    obat.nama_obat,
    detail_obat.stok,
    detail_obat.tgl_expired
FROM detail_obat
JOIN obat ON detail_obat.id_obat = obat.id_obat
WHERE detail_obat.tgl_expired < CURDATE();

CREATE VIEW v_stok_menipis AS
SELECT
    dobt.id_detail,
    o.nama_obat,
    dobt.stok,
    dobt.tgl_expired
FROM detail_obat dobt
JOIN obat o ON dobt.id_obat = o.id_obat
WHERE dobt.stok < 50;

CREATE VIEW v_poin_member_terbanyak AS
SELECT
    id_pelanggan,
    nama_pelanggan,
    total_poin_member
FROM pelanggan
ORDER BY total_poin_member DESC;

SELECT * FROM v_obat_terlaris;
SELECT * FROM v_obat_expired;
SELECT * FROM v_stok_menipis;
SELECT * FROM v_poin_member_terbanyak;

-- Sub Query
-- harga obat diatas rata - rata
SELECT *
FROM obat
WHERE harga_jual >
(
    SELECT AVG(harga_jual)
    FROM obat
);

-- stok menipis
SELECT *
FROM detail_obat
WHERE stok =
(
    SELECT MIN(stok)
    FROM detail_obat
);

-- obat yang pernah terjual
SELECT *
FROM obat
WHERE id_obat NOT IN
(
    SELECT DISTINCT do.id_obat
    FROM detail_obat DO
    JOIN detail_penjualan dp
    ON do.id_detail = dp.id_detail_obat
);


-- menampilkan nama_kategori obat dan total_jumlah obat yang terjual
SELECT k.nama_kategori, SUM(dp.jumlah_jual) AS total_harga_jual
FROM kategori_obat k
JOIN obat o ON k.id_kategori = o.id_kategori
JOIN detail_obat de ON o.id_obat = de.id_obat
JOIN detail_penjualan dp ON de.id_detail = dp.id_detail_obat
GROUP BY k.nama_kategori
ORDER BY total_harga_jual DESC;

-- nampilin kolom nama pegawai,jabatan kasir, nommor telephone sharing datanya aar hanya mmenampilkan pegawai yang belajar shift siang
SELECT nama_pegawai, jabatan, no_telepon, shift FROM pegawai
WHERE jabatan = 'kasir' AND shift = 'siang';

-- tampilin kolom nama kategori, hargga jual yang yang tertinggi dalam nama kategori tersebut
SELECT k.nama_kategori, MAX(o.harga_jual) FROM kategori_obat k
JOIN obat o ON k.id_kategori = o.id_kategori
GROUP BY k.nama_kategori;

-- pelanggan yang paling banyak beli
SELECT p.id_pelanggan, p.nama_pelanggan, sum(d.jumlah_jual) AS total_keping_obat_dibeli
FROM pelanggan p
JOIN penjualan j ON p.id_pelanggan = j.id_pelanggan
JOIN detail_penjualan d ON j.id_penjualan = d.id_penjualan
GROUP BY p.id_pelanggan, p.nama_pelanggan;

