CREATE DATABASE QuanLyDichVu;
USE QuanLyDichVu;

-- Bảng vị trí
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);

-- Bảng trình độ
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);

-- Bảng bộ phận
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);

-- Bảng nhân viên
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

-- Bảng loại khách
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);

-- Bảng khách hàng
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

-- Bảng kiểu thuê
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45)
);

-- Bảng loại dịch vụ
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);

-- Bảng dịch vụ
CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac TEXT,
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

-- Bảng hợp đồng
CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

-- Bảng dịch vụ đi kèm
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(45),
    trang_thai VARCHAR(45)
);

-- Bảng hợp đồng chi tiết
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);


-- =========================
-- TẠO DATABASE & SỬ DỤNG
-- =========================
CREATE DATABASE QuanLyDichVu;
USE QuanLyDichVu;

-- =========================
-- TẠO BẢNG DANH MỤC
-- =========================
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

-- =========================
-- TẠO BẢNG CHÍNH
-- =========================
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(100),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac TEXT,
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem VARCHAR(100),
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(45),
    trang_thai VARCHAR(100)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    so_luong INT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- =========================
-- TẠO DATABASE & SỬ DỤNG
-- =========================
CREATE DATABASE QuanLyDichVu;
USE QuanLyDichVu;

-- =========================
-- TẠO BẢNG DANH MỤC
-- =========================
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

-- =========================
-- TẠO BẢNG CHÍNH
-- =========================
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(100),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac TEXT,
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem VARCHAR(100),
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(45),
    trang_thai VARCHAR(100)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    so_luong INT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);
ALTER TABLE dich_vu ADD COLUMN dich_vu_mien_phi_di_kem VARCHAR(100);

INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
VALUES 
(1,'Villa'),
(2,'House'),
(3,'Room')
ON DUPLICATE KEY UPDATE ten_loai_dich_vu = VALUES(ten_loai_dich_vu);

-- CHÈN DỮ LIỆU

-- Bảng vi_tri
INSERT INTO vi_tri VALUES 
(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Chuyên viên'),
(4, 'Giám sát'),
(5, 'Quản lý'),
(6, 'Giám đốc');

-- Bảng trinh_do
INSERT INTO trinh_do VALUES 
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

-- Bảng bo_phan
INSERT INTO bo_phan VALUES 
(1, 'Sale – Marketing'),
(2, 'Hành Chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

-- Bảng loai_khach
INSERT INTO loai_khach VALUES 
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

-- Bảng khach_hang
INSERT INTO khach_hang VALUES
(1,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
(2,'Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
(3,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
(4,'Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
(5,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
(6,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
(7,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
(8,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
(9,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
(10,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);

-- Bảng kieu_thue
INSERT INTO kieu_thue VALUES
(1,'year'),
(2,'month'),
(3,'day'),
(4,'hour');

-- Bảng loai_dich_vu
INSERT INTO loai_dich_vu VALUES
(1,'Villa'),
(2,'House'),
(3,'Room');

-- Bảng dich_vu
INSERT INTO dich_vu (
    ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    chi_phi_thue,
    so_nguoi_toi_da,
    tieu_chuan_phong,
    mo_ta_tien_nghi_khac,
    dien_tich_ho_boi,
    so_tang,
    dich_vu_mien_phi_di_kem,
    ma_kieu_thue,
    ma_loai_dich_vu
) VALUES
(1,'Villa Beach Front',25000,1000000,10,'vip','Có hồ bơi',500,4,NULL,4,1),
(2,'House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',NULL,3,NULL,3,2),
(3,'Room Twin 01',5000,1000000,2,'normal','Có tivi',NULL,NULL,'1 Xe máy, 1 Xe đạp',1,3),
(4,'Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,NULL,4,1),
(5,'House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',NULL,2,NULL,2,2),
(6,'Room Twin 02',3000,900000,2,'normal','Có tivi',NULL,NULL,'1 Xe máy',3,3);

-- Bảng dich_vu_di_kem
INSERT INTO dich_vu_di_kem VALUES
(1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
(2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
(3,'Thuê xe đạp',20000,'chiếc','tốt'),
(4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
(5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
(6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');

-- Bảng hop_dong
INSERT INTO hop_dong VALUES
(1,'2020-12-08','2020-12-08',0,3,1,3),
(2,'2020-07-14','2020-07-21',200000,7,3,1),
(3,'2021-03-15','2021-03-17',50000,3,4,2),
(4,'2021-01-14','2021-01-18',100000,7,5,5),
(5,'2021-07-14','2021-07-15',0,7,2,6),
(6,'2021-06-01','2021-06-03',0,7,7,6),
(7,'2021-09-02','2021-09-05',100000,7,4,4),
(8,'2021-06-17','2021-06-18',150000,3,4,1),
(9,'2020-11-19','2020-11-19',0,3,4,3),
(10,'2021-04-12','2021-04-14',0,10,3,5),
(11,'2021-04-25','2021-04-25',0,2,2,1),
(12,'2021-05-25','2021-05-27',0,7,10,1);

-- Bảng hop_dong_chi_tiet
INSERT INTO hop_dong_chi_tiet VALUES
(1,5,2,4),
(2,8,2,5),
(3,15,2,6),
(4,1,3,1),
(5,11,3,2),
(6,1,1,3),
(7,2,1,2),
(8,2,12,2);

-- Truy vấn dữ liệu
-- 1
SELECT *
FROM nhan_vien
WHERE LEFT(ho_ten, 1) IN ('H','T','K')
  AND CHAR_LENGTH(ho_ten) <= 15;
-- 2
SELECT *
FROM khach_hang
WHERE TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) BETWEEN 18 AND 50
  AND (
       dia_chi LIKE '%Đà Nẵng%'
       OR dia_chi LIKE '%Quảng Trị%'
      );

-- 3
SELECT k.ma_khach_hang,
       k.ho_ten,
       COUNT(h.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang k
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY k.ma_khach_hang, k.ho_ten
ORDER BY so_lan_dat_phong ASC;

-- 4
SELECT
  k.ma_khach_hang,
  k.ho_ten,
  lk.ten_loai_khach,
  h.ma_hop_dong,
  dv.ten_dich_vu,
  h.ngay_lam_hop_dong,
  h.ngay_ket_thuc,
  -- Tổng: chi phí thuê của dịch vụ chính + tổng (số lượng * giá) các dịch vụ đi kèm
  (IFNULL(dv.chi_phi_thue,0) + IFNULL(SUM(hdc.so_luong * dvdk.gia),0)) AS tong_tien
FROM khach_hang k
LEFT JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
LEFT JOIN dich_vu dv ON h.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdc ON h.ma_hop_dong = hdc.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdc.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY k.ma_khach_hang, k.ho_ten, lk.ten_loai_khach, h.ma_hop_dong, dv.ten_dich_vu, h.ngay_lam_hop_dong, h.ngay_ket_thuc, dv.chi_phi_thue
ORDER BY k.ma_khach_hang;

-- 5
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE NOT EXISTS (
  SELECT 1
  FROM hop_dong h
  WHERE h.ma_dich_vu = dv.ma_dich_vu
    AND YEAR(h.ngay_lam_hop_dong) = 2021
    AND MONTH(h.ngay_lam_hop_dong) IN (1,2,3)
);

-- 6
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE EXISTS (
    SELECT 1 FROM hop_dong h
    WHERE h.ma_dich_vu = dv.ma_dich_vu
      AND YEAR(h.ngay_lam_hop_dong) = 2020
)
AND NOT EXISTS (
    SELECT 1 FROM hop_dong h2
    WHERE h2.ma_dich_vu = dv.ma_dich_vu
      AND YEAR(h2.ngay_lam_hop_dong) = 2021
);


-- 7
SELECT ho_ten
FROM numbered
WHERE rn = 1;

-- 8
SELECT MONTH(h.ngay_lam_hop_dong) AS thang,
       COUNT(DISTINCT h.ma_khach_hang) AS so_khach_hang_dat_phong
FROM hop_dong h
WHERE YEAR(h.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(h.ngay_lam_hop_dong)
ORDER BY thang;

-- 9
SELECT h.ma_hop_dong,
       h.ngay_lam_hop_dong,
       h.ngay_ket_thuc,
       h.tien_dat_coc,
       IFNULL(SUM(hdc.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong h
LEFT JOIN hop_dong_chi_tiet hdc ON h.ma_hop_dong = hdc.ma_hop_dong
GROUP BY h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc;

-- 10
SELECT DISTINCT dvdk.ma_dich_vu_di_kem,
       dvdk.ten_dich_vu_di_kem,
       dvdk.gia,
       dvdk.don_vi,
       dvdk.trang_thai
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdc ON dvdk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
JOIN hop_dong h ON hdc.ma_hop_dong = h.ma_hop_dong
JOIN khach_hang k ON h.ma_khach_hang = k.ma_khach_hang
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
  AND (k.dia_chi LIKE '%Vinh%' OR k.dia_chi LIKE '%Quảng Ngãi%');

-- 11
SELECT
  h.ma_hop_dong,
  nv.ho_ten AS nhan_vien,
  k.ho_ten AS khach_hang,
  k.so_dien_thoai,
  dv.ten_dich_vu,
  IFNULL(SUM(hdc.so_luong),0) AS so_luong_dich_vu_di_kem,
  h.tien_dat_coc
FROM hop_dong h
JOIN nhan_vien nv ON h.ma_nhan_vien = nv.ma_nhan_vien
JOIN khach_hang k ON h.ma_khach_hang = k.ma_khach_hang
JOIN dich_vu dv ON h.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdc ON h.ma_hop_dong = hdc.ma_hop_dong
WHERE YEAR(h.ngay_lam_hop_dong) = 2020
  AND MONTH(h.ngay_lam_hop_dong) IN (10,11,12)
  -- đảm bảo dịch vụ này không xuất hiện trong 6 tháng đầu 2021
  AND NOT EXISTS (
      SELECT 1 FROM hop_dong h2
      WHERE h2.ma_dich_vu = h.ma_dich_vu
        AND YEAR(h2.ngay_lam_hop_dong) = 2021
        AND MONTH(h2.ngay_lam_hop_dong) BETWEEN 1 AND 6
  )
GROUP BY h.ma_hop_dong, nv.ho_ten, k.ho_ten, k.so_dien_thoai, dv.ten_dich_vu, h.tien_dat_coc;

-- 12
-- Bước 1: số lần sử dụng mỗi dịch vụ đi kèm
WITH usage_count AS (
  SELECT hdc.ma_dich_vu_di_kem,
         COUNT(*) AS so_lan_su_dung
  FROM hop_dong_chi_tiet hdc
  JOIN hop_dong h ON hdc.ma_hop_dong = h.ma_hop_dong
  -- chỉ tính những hợp đồng thực sự (nếu muốn giới hạn theo năm, thêm điều kiện)
  GROUP BY hdc.ma_dich_vu_di_kem
)
-- Bước 2: lấy max rồi join để chọn các dịch vụ có số lần = max
SELECT dvdk.*, uc.so_lan_su_dung
FROM usage_count uc
JOIN (
  SELECT MAX(so_lan_su_dung) AS max_usage FROM usage_count
) m ON uc.so_lan_su_dung = m.max_usage
JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = uc.ma_dich_vu_di_kem;

-- 13	
-- Tính số lần sử dụng mỗi ma_dich_vu_di_kem
WITH dv_usage AS (
  SELECT hdc.ma_dich_vu_di_kem,
         COUNT(*) AS so_lan_su_dung,
         MIN(hdc.ma_hop_dong) AS any_hop_dong -- lấy 1 hợp đồng chứa lần sử dụng đó để hiển thị ma_hop_dong
  FROM hop_dong_chi_tiet hdc
  GROUP BY hdc.ma_dich_vu_di_kem
)
SELECT
  du.any_hop_dong AS ma_hop_dong,
  ldv.ten_loai_dich_vu,
  dvdk.ten_dich_vu_di_kem,
  du.so_lan_su_dung
FROM dv_usage du
JOIN dich_vu_di_kem dvdk ON du.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
-- nối lên hợp đồng → dịch vụ chính → loại dịch vụ để lấy ten_loai_dich_vu (nếu hợp đồng có ma_dich_vu)
LEFT JOIN hop_dong h ON h.ma_hop_dong = du.any_hop_dong
LEFT JOIN dich_vu dv ON h.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE du.so_lan_su_dung = 1;

-- 14
SELECT nv.ma_nhan_vien,
       nv.ho_ten,
       td.ten_trinh_do,
       bp.ten_bo_phan,
       nv.so_dien_thoai,
       nv.dia_chi,
       COUNT(h.ma_hop_dong) AS tong_so_hop_dong_2020_2021
FROM nhan_vien nv
LEFT JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
LEFT JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
LEFT JOIN hop_dong h ON nv.ma_nhan_vien = h.ma_nhan_vien
  AND YEAR(h.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
HAVING COUNT(h.ma_hop_dong) <= 3;

-- 15
-- Kiểm tra danh sách nhân viên sẽ bị xóa
SELECT nv.*
FROM nhan_vien nv
WHERE NOT EXISTS (
  SELECT 1 FROM hop_dong h
  WHERE h.ma_nhan_vien = nv.ma_nhan_vien
    AND YEAR(h.ngay_lam_hop_dong) BETWEEN 2019 AND 2021
);

-- Xóa (thực hiện khi bạn chắc)
DELETE FROM nhan_vien
WHERE NOT EXISTS (
  SELECT 1 FROM hop_dong h
  WHERE h.ma_nhan_vien = nhan_vien.ma_nhan_vien
    AND YEAR(h.ngay_lam_hop_dong) BETWEEN 2019 AND 2021
);

-- 16
-- Cách làm: cập nhật mã loại khách của khách hàng (ma_loai_khach) sang mã của 'Diamond'
UPDATE khach_hang k
JOIN (
  SELECT h.ma_khach_hang,
         SUM( IFNULL(dv.chi_phi_thue,0) + IFNULL(hdc.so_luong * dvdk.gia,0) ) AS total_2021
  FROM hop_dong h
  LEFT JOIN dich_vu dv ON h.ma_dich_vu = dv.ma_dich_vu
  LEFT JOIN hop_dong_chi_tiet hdc ON h.ma_hop_dong = hdc.ma_hop_dong
  LEFT JOIN dich_vu_di_kem dvdk ON hdc.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
  WHERE YEAR(h.ngay_lam_hop_dong) = 2021
  GROUP BY h.ma_khach_hang
) t ON k.ma_khach_hang = t.ma_khach_hang
SET k.ma_loai_khach = (
  SELECT ma_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Diamond' LIMIT 1
)
WHERE k.ma_loai_khach = (
  SELECT ma_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Platinium' LIMIT 1
)
AND t.total_2021 > 10000000;

-- 17
-- 1) Tạo bảng tạm chứa danh sách khách hàng có hợp đồng trước 2021
CREATE TEMPORARY TABLE tmp_customers_to_delete AS
SELECT DISTINCT ma_khach_hang
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) < 2021;

-- 2) Xóa chi tiết hợp đồng của các hợp đồng thuộc những khách hàng này
DELETE hdc
FROM hop_dong_chi_tiet hdc
JOIN hop_dong h ON hdc.ma_hop_dong = h.ma_hop_dong
WHERE h.ma_khach_hang IN (SELECT ma_khach_hang FROM tmp_customers_to_delete)
  AND YEAR(h.ngay_lam_hop_dong) < 2021;

-- 3) Xóa hợp đồng thuộc các khách hàng này (những hợp đồng < 2021)
DELETE FROM hop_dong
WHERE ma_khach_hang IN (SELECT ma_khach_hang FROM tmp_customers_to_delete)
  AND YEAR(ngay_lam_hop_dong) < 2021;

-- 4) Xóa khách hàng trong tmp (chú ý: nếu khách hàng còn hợp đồng >=2021, điều kiện trên có thể xóa cả những khách có hợp đồng sau 2021; nếu muốn chỉ xóa KH mà *chỉ* có hợp đồng trước 2021, cần filter thêm)
DELETE FROM khach_hang
WHERE ma_khach_hang IN (SELECT ma_khach_hang FROM tmp_customers_to_delete);

DELETE FROM khach_hang
WHERE ma_khach_hang IN (
  SELECT ma_khach_hang FROM tmp_customers_to_delete
)
AND NOT EXISTS (
  SELECT 1 FROM hop_dong h2
  WHERE h2.ma_khach_hang = khach_hang.ma_khach_hang
    AND YEAR(h2.ngay_lam_hop_dong) >= 2021
);

-- 18
UPDATE dich_vu_di_kem dvdk
JOIN (
  SELECT hdc.ma_dich_vu_di_kem, SUM(hdc.so_luong) AS total_qty
  FROM hop_dong_chi_tiet hdc
  JOIN hop_dong h ON hdc.ma_hop_dong = h.ma_hop_dong
  WHERE YEAR(h.ngay_lam_hop_dong) = 2020
  GROUP BY hdc.ma_dich_vu_di_kem
  HAVING SUM(hdc.so_luong) > 10
) t ON dvdk.ma_dich_vu_di_kem = t.ma_dich_vu_di_kem
SET dvdk.gia = dvdk.gia * 2;

-- 19
SELECT 'NV' AS type, ma_nhan_vien AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION ALL
SELECT 'KH' AS type, ma_khach_hang AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;




