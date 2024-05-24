-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 24, 2024 lúc 12:25 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dblinhkien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MAHD` int(11) NOT NULL,
  `MALINHKIEN` int(11) NOT NULL,
  `DONGIA` bigint(20) DEFAULT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  `TONGITEN` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MAHD`, `MALINHKIEN`, `DONGIA`, `SOLUONG`, `TONGITEN`) VALUES
(65, 91, 13750, 10, 137500),
(66, 91, 13750, 1, 13750),
(66, 92, 13750, 1, 13750),
(67, 91, 13750, 4, 55000),
(67, 94, 11500, 4, 46000),
(67, 95, 15000, 5, 75000);

--
-- Bẫy `chitiethoadon`
--
DELIMITER $$
CREATE TRIGGER `trg_chitiethoadon` BEFORE INSERT ON `chitiethoadon` FOR EACH ROW UPDATE linhkien SET SOLUONG = SOLUONG - new.SOLUONG 
    WHERE MALINHKIEN = new.MALINHKIEN
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MAHD` int(11) NOT NULL,
  `MAKH` varchar(10) DEFAULT NULL,
  `TONGTIEN` bigint(20) DEFAULT NULL,
  `NGAYLAPHOADON` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MAHD`, `MAKH`, `TONGTIEN`, `NGAYLAPHOADON`) VALUES
(65, 'huypham', 151250, '2024-05-24'),
(66, 'huypham', 27500, '2024-05-24'),
(67, 'huypham', 176000, '2024-05-24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `USERNAME` varchar(10) NOT NULL,
  `TENKH` varchar(100) DEFAULT NULL,
  `MATKHAU` varchar(100) DEFAULT NULL,
  `DIACHI` varchar(100) DEFAULT NULL,
  `SODT` int(11) DEFAULT NULL,
  `HINHANH` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`USERNAME`, `TENKH`, `MATKHAU`, `DIACHI`, `SODT`, `HINHANH`) VALUES
('dongduy', 'Dương Đông Duy', '5dc6da3adfe8ccf1287a98c0a8f74496', 'Tiền Giangss', 376880903, 'BIDV_16516429093691653802724023.jpg'),
('ducduy', 'Hồ Đức Duy', '827ccb0eea8a706c4c34a16891f84e7b', 'Cần Thơ', 703337662, 'staff.png'),
('duy', 'Dương Đông Duy', '827ccb0eea8a706c4c34a16891f84e7b', 'Tiền Giang', 376880903, 'FB_IMG_16534432551141653744012257.jpg'),
('duynghia', 'Dương Duy Nghĩa', '211b461416eaa21318ac809d050ce371', 'Tiền Giang province ', 988322241, 'staff.png'),
('haha', 'a', 'f3c2cefc1f3b082a56f52902484ca511', 'a', 0, ''),
('hi', 'dương đông duy', '49f68a5c8493ec2c0bf489821c21fc3b', 'tiền giang', 0, 'received_4614633723120461653755013471.jpeg'),
('huypham', 'Phạm Thành Huy', '62e1d375751b38136352ffc480c0787d', 'p25k5', 838129818, 'huy.png'),
('limminh', 'Lim Bảo Minh', '827ccb0eea8a706c4c34a16891f84e7b', 'TP.HCM', 703337662, 'staff.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `linhkien`
--

CREATE TABLE `linhkien` (
  `MALINHKIEN` int(11) NOT NULL,
  `TENLINHKIEN` varchar(200) DEFAULT NULL,
  `GIATIEN` bigint(20) DEFAULT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  `GIATIENKHUYENMAI` bigint(20) DEFAULT NULL,
  `MOTA` varchar(500) DEFAULT NULL,
  `HINHANH` varchar(100) DEFAULT NULL,
  `NGAYCAPNHAT` date DEFAULT NULL,
  `MALLINHKIEN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `linhkien`
--

INSERT INTO `linhkien` (`MALINHKIEN`, `TENLINHKIEN`, `GIATIEN`, `SOLUONG`, `GIATIENKHUYENMAI`, `MOTA`, `HINHANH`, `NGAYCAPNHAT`, `MALLINHKIEN`) VALUES
(91, 'Rau cải xanh', 15000, 44, 13750, 'Rau sạch', 'rau cải xanh.jpg', '2024-05-24', 74),
(92, 'Cải cúc', 17500, 19, 13750, 'Rau ngon', 'cải cúc.jpg', '2024-05-24', 74),
(93, 'Chuối tiêu', 18200, 200, 17900, 'Quả ngon', 'quả chuối.jpg', '2024-05-24', 71),
(94, 'Quả táo', 12000, 68, 11500, 'Táo dai', 'quả táo.jpg', '2024-05-24', 75),
(95, 'Quả bí', 20000, 82, 15000, 'Bí ngon ăn ngon nhất cái trái đất này luôn', 'quả bí.jpg', '2024-05-24', 75),
(96, 'Quả cam', 25000, 2, 17900, 'Cam sạch ngon nhập từ úc ', 'quả cam.jpg', '2024-05-24', 75);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loailinhkien`
--

CREATE TABLE `loailinhkien` (
  `MALLINHKIEN` int(11) NOT NULL,
  `TENLLINHKIEN` varchar(20) DEFAULT NULL,
  `HINHANH` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loailinhkien`
--

INSERT INTO `loailinhkien` (`MALLINHKIEN`, `TENLLINHKIEN`, `HINHANH`) VALUES
(71, 'Trái cây', 'trái cây.jpg'),
(74, 'Rau ', 'rau.jpg'),
(75, 'Hoa Quả', 'hoa quả.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MANV` varchar(100) NOT NULL,
  `MATKHAU` varchar(100) DEFAULT NULL,
  `HOTEN` varchar(20) DEFAULT NULL,
  `GIOITINH` varchar(3) DEFAULT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `DIACHI` varchar(30) DEFAULT NULL,
  `SODT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MANV`, `MATKHAU`, `HOTEN`, `GIOITINH`, `NGAYSINH`, `DIACHI`, `SODT`) VALUES
('', '62e1d375751b38136352ffc480c0787d', 'HuyPham', 'nam', '2024-02-15', 'p25k5', 838129818);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`MAHD`,`MALINHKIEN`),
  ADD KEY `FK_CHITIETHOADON_SANPHAM` (`MALINHKIEN`),
  ADD KEY `FK_CHITIETHOADON_HD` (`MAHD`) USING BTREE;

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MAHD`),
  ADD KEY `FK_HOADON_KHACHHANG` (`MAKH`) USING BTREE;

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Chỉ mục cho bảng `linhkien`
--
ALTER TABLE `linhkien`
  ADD PRIMARY KEY (`MALINHKIEN`),
  ADD KEY `FK_LINHKIEN_LOAILINHKIEN` (`MALLINHKIEN`);

--
-- Chỉ mục cho bảng `loailinhkien`
--
ALTER TABLE `loailinhkien`
  ADD PRIMARY KEY (`MALLINHKIEN`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANV`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MAHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `linhkien`
--
ALTER TABLE `linhkien`
  MODIFY `MALINHKIEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT cho bảng `loailinhkien`
--
ALTER TABLE `loailinhkien`
  MODIFY `MALLINHKIEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `FK_CHITIETHOADON_SANPHAM` FOREIGN KEY (`MALINHKIEN`) REFERENCES `linhkien` (`MALINHKIEN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CTHD_HOADON` FOREIGN KEY (`MAHD`) REFERENCES `hoadon` (`MAHD`),
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MAHD`) REFERENCES `hoadon` (`MAHD`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FK_HOADON_KHACHHANG` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`USERNAME`);

--
-- Các ràng buộc cho bảng `linhkien`
--
ALTER TABLE `linhkien`
  ADD CONSTRAINT `FK_LINHKIEN_LOAILINHKIEN` FOREIGN KEY (`MALLINHKIEN`) REFERENCES `loailinhkien` (`MALLINHKIEN`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
