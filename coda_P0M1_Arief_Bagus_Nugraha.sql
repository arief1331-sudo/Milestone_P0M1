-- Staging

CREATE TABLE staging_astro (
    nama_produk VARCHAR(255),
    harga INTEGER,
    pengiriman VARCHAR(50),
    diskon FLOAT
);

--Load Data CSV
COPY staging_astro(nama_produk, harga, pengiriman, diskon)
FROM 'C:\tmp\coda_P0M1_Arief_Bagus_Nugraha.csv'
DELIMITER ','
CSV HEADER;

-- Membuat Tabel Normalisasi
CREATE TABLE master_pengiriman (
    id_pengiriman SERIAL PRIMARY KEY,
    jenis_pengiriman VARCHAR(50) UNIQUE -- Unique agar data tidak duplikat
);

-- Tabel inilah yang menampung FK dari tabel lain.
CREATE TABLE barang_final (
    id_barang SERIAL PRIMARY KEY,
    nama_produk VARCHAR(255),
    harga INTEGER,
    diskon FLOAT,
    id_pengiriman INTEGER, -- Foreign Key
    
    -- Definisi Relasi
    CONSTRAINT fk_pengiriman_astro
        FOREIGN KEY (id_pengiriman)
        REFERENCES master_pengiriman(id_pengiriman)
);

--Memindahkan Data
INSERT INTO master_pengiriman (jenis_pengiriman)
SELECT DISTINCT pengiriman 
FROM staging_astro;


INSERT INTO barang_final (nama_produk, harga, diskon, id_pengiriman)
SELECT 
    s.nama_produk, 
    s.harga, 
    s.diskon, 
    mp.id_pengiriman
FROM staging_astro AS s
JOIN master_pengiriman AS mp 
    ON s.pengiriman = mp.jenis_pengiriman; 

-- Cek Hasil


SELECT * FROM master_pengiriman;


SELECT * FROM barang_final LIMIT 5;


SELECT 
    b.nama_produk,
    b.harga,
    p.jenis_pengiriman
FROM barang_final b
JOIN master_pengiriman p ON b.id_pengiriman = p.id_pengiriman;