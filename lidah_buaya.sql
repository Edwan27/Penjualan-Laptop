-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Okt 2021 pada 13.34
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lidah_buaya`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `client`
--

CREATE TABLE `client` (
  `id_pembeli` int(10) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `nik` int(16) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `client`
--

INSERT INTO `client` (`id_pembeli`, `nama_pembeli`, `nik`, `alamat`) VALUES
(1, 'Ahmad', 281731837, 'Kapuas Hulu'),
(2, 'Silvya', 281731832, 'Kapuas Hulu'),
(3, 'Edwan', 28173184, 'Pontianak'),
(5, 'Leti', 33817817, 'Kapuas Hulu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `formulir_pemesanan`
--

CREATE TABLE `formulir_pemesanan` (
  `id_pemesanan` int(10) NOT NULL,
  `id_harga` int(10) NOT NULL,
  `id_pembeli` int(10) NOT NULL,
  `id_produk` int(10) NOT NULL,
  `id_formulir` int(10) NOT NULL,
  `jenis` int(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasok`
--

CREATE TABLE `pemasok` (
  `nama_pemasok` varchar(30) DEFAULT NULL,
  `nik_pemasok` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemasok`
--

INSERT INTO `pemasok` (`nama_pemasok`, `nik_pemasok`) VALUES
('Dhamie', 1278139132),
('Sigit', 1278139137);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(10) NOT NULL,
  `id_produk` int(10) NOT NULL,
  `id_harga` int(10) NOT NULL,
  `id_pembeli` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_produk`, `id_harga`, `id_pembeli`) VALUES
(432, 22, 30000, 2),
(433, 21, 25000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `jenis` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nik_pemasok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`jenis`, `id_produk`, `nik_pemasok`) VALUES
(321, 21, 1278139132),
(322, 22, 1278139137);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_harga` int(11) NOT NULL,
  `jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_harga`, `jenis`) VALUES
(21, 25000, 322),
(22, 45000, 321);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(11) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbluser`
--

INSERT INTO `tbluser` (`ID`, `Firstname`, `Lastname`, `Gender`, `Email`, `Password`) VALUES
(1, 'Edwan', 'Damiyanto', 'Male', 'edwanduatujuh@gmail.com', 'caf1a3dfb505ffed0d024130f58c5cfa'),
(2, 'Aku', 'Ganteng', 'Male', 'aku@gmail.com', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `formulir_pemesanan`
--
ALTER TABLE `formulir_pemesanan`
  ADD PRIMARY KEY (`id_formulir`),
  ADD KEY `id_pemesanan` (`id_pemesanan`),
  ADD KEY `jenis` (`jenis`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`nik_pemasok`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`jenis`),
  ADD KEY `nik_pemasok` (`nik_pemasok`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `jenis` (`jenis`);

--
-- Indeks untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `formulir_pemesanan`
--
ALTER TABLE `formulir_pemesanan`
  ADD CONSTRAINT `formulir_pemesanan_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`),
  ADD CONSTRAINT `formulir_pemesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `client` (`id_pembeli`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`nik_pemasok`) REFERENCES `pemasok` (`nik_pemasok`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`jenis`) REFERENCES `penjualan` (`jenis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
