/*
=================================================
Milestone 1

Nama  : Anis Ahmad Zou
Batch : CODA-RMT-010

Program ini dibuat untuk membuat database dari data yang sudah diambil melalui web scraping.
=================================================
*/

--======================================================--
--					Membuat Database		            --
--======================================================--

-- Query dibawah ini digunakan untuk membuat sebuah database baru
Create Database 
	coda_P0M1_aniszou;


--======================================================--
--					Membuat Table Staging				--
--======================================================--

-- Query dibawah digunakan untuk membuat tabel staging yang digunakan untuk menyimpan data sementara
-- dan menggunakan serial pada id untuk menambahkan id secara otomatis
Create Table staging(
	id Serial Primary Key,
	nama_toko Text,
	nama_produk Text,
	harga_produk Int,
	jumlah_review Int,
	banyak_ukuran Int
);

-- Query dibawah digunakan untuk mengambil data dari file csv dengan delimiter ','
Copy staging(
	nama_toko,
	nama_produk,
	harga_produk,
	jumlah_review,
	banyak_ukuran
)
From
	'C:\temp\coda_P0M1_aniszou.csv'
Delimiter
	','
Csv Header;


--======================================================--
--					Membuat Table 3NF					--
--======================================================--

-- Query dibawah digunakan untuk membuat tabel baru yang dinamakan toko setelah dilakukan normalisasi 3nf
Create Table toko(
	id Serial Primary Key,
	nama_toko Text
);

-- Query dibawah digunakan untuk membuat tabel baru yang dinamakan produk setelah dilakukan normalisasi 3nf
-- menambahkan constraint, dan foreign key yang diambil dari tabel toko menggunakan references
Create Table produk(
	id Serial Primary Key,
	nama_produk Text,
	harga_produk Int,
	jumlah_review Int,
	banyak_ukuran Int,
	toko_id Int,
	Constraint 
		fk_toko 
	Foreign Key 
		(toko_id) 
	References
		toko(id)
);


--======================================================--
--					Memasukan Data ke 3NF				--
--======================================================--

-- Query dibawah digunakan untuk memasukkan data unik ke tabel toko menggunakan insert into, select distinct dan from tabel yang diinginkan
-- menggunakan distinct agar tidak terdapat data yang double
Insert Into 
	toko (nama_toko)
Select Distinct 
	nama_toko
From 
	staging;

-- Query dibawah digunakan untuk memasukkan data ke tabel produk
-- menggunakan join untuk menghubungkan data produk di tabel staging dengan data toko di tabel toko berdasarkan kesamaan nama toko
Insert Into
	produk (nama_produk, harga_produk, jumlah_review, banyak_ukuran, toko_id)
Select 
	s.nama_produk, s.harga_produk, s.jumlah_review, s.banyak_ukuran, t.id
From 
	staging s
Join 
	toko t 
On 
	s.nama_toko = t.nama_toko
