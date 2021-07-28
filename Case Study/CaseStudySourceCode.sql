SELECT * FROM khachhang;

USE case_study_furama_resort;

-- câu 2
SELECT IDNhanVien, IDViTri, IDTrinhDo, IDBoPhan, CONCAT_WS(" ", Ho, TenLot, Ten) AS "Họ và tên tối đa 15 kí tự", 
NgaySinh, SoCMND, SDT, Email, DiaChi, Luong FROM nhanvien
WHERE SUBSTR(Ten, 1, 1) IN ('H', 'T', 'K') AND CHAR_LENGTH(CONCAT_WS(" ", Ho, TenLot, Ten)) <= 15;

-- câu 3
SELECT IDKhachHang, IDLoaiKhach, CONCAT_WS(" ", Ho, TenLot, Ten) AS "Họ và tên", NgaySinh, SoCMND, SDT, Email, 
DiaChi FROM khachhang
WHERE DiaChi IN ("Đà Nẵng", "Quảng Trị") AND (YEAR(CURRENT_DATE()) - YEAR(NgaySinh) BETWEEN 18 AND 50)
GROUP BY CONCAT_WS(" ", Ho, TenLot, Ten);

-- câu 4
SELECT kh.IDKhachHang, CONCAT_WS(" ", Ho, TenLot, Ten) AS "Họ và tên", COUNT(IDKhachhang) AS "Số lần đặt phòng", 
lk.TenLoaiKhach AS "Loại khách hàng" 
FROM khachhang AS kh
INNER JOIN loaikhach AS lk ON kh.IDLoaiKhach = lk.IDLoaiKhach
WHERE kh.IDLoaiKhach = (SELECT IDLoaiKhach FROM loaikhach WHERE TenLoaiKhach = "Diamond")
GROUP BY CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten)
ORDER BY COUNT(IDKhachhang);

-- câu 5
SELECT kh.IDKhachHang, CONCAT_WS(" ", Ho, TenLot, Ten) AS "Họ và tên", lk.TenLoaiKhach, hd.IDHopDong, dv.TenDichVu, 
hd.NgayLamHopDong, hd.NgayKetThucHopDong, SUM(hd.TongTienThanhToan) AS "Tổng tiền"
FROM ((khachhang AS kh
LEFT JOIN loaikhach AS lk ON kh.IDLoaiKhach = lk.IDLoaiKhach)
LEFT JOIN hopdong AS hd ON kh.IDKhachHang = hd.IDKhachHang)
INNER JOIN dichvu AS dv ON hd.IDDichVu = dv.IDDichVu
GROUP BY CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten);

-- câu 6
SELECT dv.IDDichVu, dv.TenDichVu, dv.DienTich, dv.ChiPhiThue, ldv.TenLoaiDichVu
FROM dichvu AS dv
INNER JOIN loaidichvu AS ldv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
WHERE IDDichVu NOT IN 
(SELECT IDDichVu FROM hopdong AS hd
WHERE hd.NgayLamHopDong BETWEEN '2019-01-01' AND '2019-03-31');

-- câu 7
SELECT dv.IDDichVu, dv.TenDichVu, dv.DienTich, dv.SoNguoiToiDa, dv.ChiPhiThue, ldv.TenLoaiDichVu
FROM dichvu AS dv
INNER JOIN loaidichvu AS ldv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
WHERE IDDichVu NOT IN (
SELECT IDDichVu FROM hopdong AS hd
WHERE YEAR(hd.NgayLamHopDong) = 2018 AND YEAR(hd.NgayLamHopDong) <> 2019);

-- câu 8
-- *cách 1:
SELECT * FROM khachhang
GROUP BY CONCAT_WS(" ", Ho, TenLot, Ten);
-- *cách 2:
SELECT DISTINCT CONCAT_WS(" ", Ho, TenLot, Ten) AS "Họ và tên", NgaySinh, SoCMND, SDT, Email, DiaChi FROM khachhang;
-- *cách 3:
SELECT DISTINCTROW CONCAT_WS(" ", Ho, TenLot, Ten) AS "Họ và tên", NgaySinh, SoCMND, SDT, Email, DiaChi FROM khachhang;

-- câu 9
SELECT IDHopDong, SUBSTRING(NgayLamHopDong, 6, 2) AS "Tháng", SUM(TongTienThanhToan) AS "Doanh thu các tháng trong năm 2019"
FROM hopdong
WHERE YEAR(NgayLamHopDong) = 2019
GROUP BY SUBSTRING(NgayLamHopDong, 6, 2);

-- câu 10
SELECT hd.IDHopDong, hd.NgayLamHopDong, hd.NgayKetThucHopDong, hd.TienDatCocTruoc, COUNT(hdct.IDHopDongChiTiet) AS "Số lượng dịch vụ đi kèm"
FROM (hopdong AS hd
LEFT JOIN hopdongchitiet AS hdct ON hd.IDHopdong = hdct.IDHopDong)
LEFT JOIN khachhang AS kh ON hd.IDKhachHang = kh.IDKhachHang
GROUP BY CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten);

-- câu 11
SELECT kh.IDKhachHang, CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten) AS "Họ và tên", kh.NgaySinh, kh.DiaChi, lk.IDLoaiKhach, lk.TenLoaiKhach,
dv.IDDichVu, dv.TenDichVu, dv.DienTich, dv.ChiPhiThue, dv.SoNguoiToiDa, dv.SoTang
FROM ((khachhang AS kh
INNER JOIN loaikhach AS lk ON kh.IDLoaiKhach = lk.IDLoaiKhach)
INNER JOIN hopdong AS hd ON kh.IDKhachHang = hd.IDKhachHang)
INNER JOIN dichvu AS dv ON hd.IDDichVu = dv.IDDichVu
WHERE kh.DiaChi IN ("Vinh", "Quảng Ngãi") AND kh.IDLoaiKhach = 
(SELECT IDLoaiKhach FROM loaikhach WHERE TenLoaiKhach = "Diamond");

-- câu 12
SELECT hd.IDHopDong, CONCAT_WS(" ", nv.Ho, nv.TenLot, nv.Ten) AS "Tên nhân viên", CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten) AS "Tên khách hàng", 
kh.SDT AS "SDT Khách hàng", dv.IDDichVu, dv.TenDichVu, COUNT(IDHopDongChiTiet) AS "Số lượng dịch vụ đi kèm", hd.TienDatCocTruoc
FROM (((hopdong AS hd
INNER JOIN nhanvien AS nv ON hd.IDNhanVien = nv.IDNhanVien)
INNER JOIN khachhang AS kh ON hd.IDKhachHang = kh.IDKhachHang)
INNER JOIN dichvu AS dv ON hd.IDDichVu = dv.IDDichVu)
INNER JOIN hopdongchitiet AS hdct ON hd.IDHopDong = hdct.IDHopDong
WHERE YEAR(NgayLamHopDong) = 2019 AND SUBSTRING(NgayLamHopDong, 6, 2) IN (10, 11, 12) AND hd.IDDichVu NOT IN (
SELECT hopdong.IDDichVu FROM dichvu 
LEFT JOIN hopdong ON dichvu.IDDichVu = hopdong.IDDichVu
WHERE YEAR(hopdong.NgayLamHopDong) = 2019 AND SUBSTRING(NgayLamHopDong, 6, 2) IN (1, 2, 3, 4, 5, 6)
);
 
-- câu 13
SELECT kh.IDKhachHang, CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten) AS "Họ và tên", kh.NgaySinh, kh.SoCMND, kh.SDT, kh.Email, 
kh.DiaChi, MAX(hdct.SoLuong) AS "Số lượng dịch vụ đi kèm lớn nhất"
FROM ((khachhang AS kh
INNER JOIN hopdong AS hd ON kh.IDKhachHang = hd.IDKhachHang)
INNER JOIN hopdongchitiet AS hdct ON hdct.IDHopDong = hd.IDHopDong)
INNER JOIN dichvudikem AS dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem
GROUP BY CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten);

-- câu 14
SELECT hd.IDHopDong, CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten) AS "Họ và tên", ldv.TenLoaiDichVu, dvdk.TenDichVuDiKem, 
COUNT(hdct.SoLuong) AS "Số lần sử dụng dịch vụ đi kèm"
FROM ((((hopdong AS hd
INNER JOIN hopdongchitiet AS hdct ON hd.IDHopDong = hdct.IDHopDong)
INNER JOIN khachhang AS kh ON hd.IDKhachHang = kh.IDKhachHang)
INNER JOIN dichvudikem AS dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem)
INNER JOIN dichvu AS dv ON hd.IDDichVu = dv.IDDichVu)
INNER JOIN loaidichvu AS ldv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
GROUP BY dvdk.TenDichVuDiKem
HAVING COUNT(hdct.SoLuong) = 1;

/* Yêu cầu phụ:
14.	Hiển thị thông tin tất cả các khách hàng mới sử dụng dịch vụ đi kèm được một lần duy nhất.
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
*/
SELECT hd.IDHopDong, CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten) AS "Họ và tên", ldv.TenLoaiDichVu, dvdk.TenDichVuDiKem, 
COUNT(hdct.SoLuong) AS "Số lần sử dụng dịch vụ đi kèm"
FROM ((((hopdong AS hd
INNER JOIN hopdongchitiet AS hdct ON hd.IDHopDong = hdct.IDHopDong)
INNER JOIN khachhang AS kh ON hd.IDKhachHang = kh.IDKhachHang)
INNER JOIN dichvudikem AS dvdk ON hdct.IDDichVuDiKem = dvdk.IDDichVuDiKem)
INNER JOIN dichvu AS dv ON hd.IDDichVu = dv.IDDichVu)
INNER JOIN loaidichvu AS ldv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
GROUP BY CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten)
HAVING COUNT(hdct.SoLuong) = 1;

-- câu 15
SELECT nv.IDNhanVien, CONCAT_WS(" ", nv.Ho, nv.TenLot, nv.Ten) AS "Họ và tên nhân viên", td.TrinhDo AS "Trình độ", 
bp.TenBoPhan AS "Tên bộ phận", nv.SDT AS "Số điện thoại nhân viên", nv.DiaChi AS "Địa chỉ", COUNT(nv.IDNhanVien) AS "Số lần làm hợp đồng"
FROM (((nhanvien AS nv
INNER JOIN trinhdo AS td ON nv.IDTrinhDo = td.IDTrinhDo)
INNER JOIN bophan AS bp ON nv.IDBoPhan = bp.IDBoPhan)
INNER JOIN hopdong AS hd ON nv.IDNhanVien = hd.IDNhanVien)
WHERE YEAR(NgayLamHopDong) BETWEEN 2018 AND 2019
GROUP BY CONCAT_WS(" ", nv.Ho, nv.TenLot, nv.Ten)
HAVING COUNT(nv.IDNhanVien) <= 3;

-- câu 16


-- câu 17
UPDATE khachhang
SET IDLoaiKhach = (SELECT IDLoaiKhach FROM loaikhach WHERE TenLoaiKhach = "Diamond")
WHERE IDLoaiKhach = (SELECT IDLoaiKhach FROM loaikhach WHERE TenLoaiKhach = "Platinium") 
AND IDKhachHang = ANY (SELECT IDKhachHang FROM hopdong WHERE YEAR(NgayLamHopDong) = 2019 AND TongTienThanhToan >= 10000000);

-- câu 18


-- câu 19
UPDATE dichvudikem
SET Gia = Gia * 2
WHERE dichvudikem.IDDichVuDiKem = 
(SELECT COUNT(hdct.SoLuong) AS "Số lần dịch vụ đi kèm được đăng ký trong 2019"
FROM ((dichvudikem AS dvdk
INNER JOIN hopdongchitiet AS hdct ON dvdk.IDDichVuDiKem = hdct.IDDichVuDiKem)
INNER JOIN hopdong AS hd ON hd.IDHopDong = hdct.IDHopDong)
WHERE YEAR(NgayLamHopDong) = 2019
GROUP BY dvdk.IDDichVuDiKem
HAVING COUNT(hdct.SoLuong) > 10);

-- câu 20
SELECT nv.IDNhanVien, CONCAT_WS(" ", nv.Ho, nv.TenLot, nv.Ten) AS "Họ và tên nhân viên", nv.NgaySinh AS "Ngày sinh nhân viên", 
nv.SDT AS "SĐT nhân viên", nv.Email AS "Email nhân viên", nv.DiaChi AS "Địa chỉ của nhân viên", 
kh.IDKhachHang, CONCAT_WS(" ", kh.Ho, kh.TenLot, kh.Ten) AS "Họ và tên khách hàng", kh.NgaySinh AS "Ngày sinh khách hàng",
kh.SDT AS "SĐT Khách hàng", kh.Email AS "Email khách hàng", kh.DiaChi AS "Địa chỉ của khách hàng"
FROM (nhanvien AS nv
INNER JOIN hopdong AS hd ON nv.IDNhanVien = hd.IDNhanVien)
INNER JOIN khachhang AS kh ON hd.IDKhachHang = kh.IDKhachHang;

-- câu 21
CREATE VIEW V_NHANVIEN AS
SELECT nv.IDNhanVien, nv.Ho, nv.TenLot, nv.Ten, nv.NgaySinh, nv.SoCMND, nv.SDT, nv.Email, nv.DiaChi, nv.Luong
FROM nhanvien AS nv
LEFT JOIN hopdong AS hd ON nv.IDNhanVien = hd.IDNhanVien
WHERE nv.DiaChi = "Hải Châu" AND NgayLamHopDong = "2019-12-12";

-- câu 22
SELECT table_name, is_updatable
FROM information_schema.VIEWS
WHERE table_schema = "case_study_furama_resort";

/*
Không thể update "Hải Châu" thành "Liên Chiểu" vì View được tạo ra bởi nhiều bảng trong query statement FROM
View không thể được UPDATE
*/
UPDATE V_NHANVIEN
SET DiaChi = "Liên Chiểu";

-- câu 23
CREATE INDEX IX_KHACHHANG ON khachhang (IDKhachHang);

-- câu 24
CREATE INDEX IX_SoDT_DiaChi ON khachhang (SDT, DiaChi);

-- câu 25
DELIMITER $$
CREATE PROCEDURE Sp_1 (IN IDKh INT)
BEGIN
	DELETE FROM khachhang
    WHERE IDKhachHang = IDKh;
END; $$
DELIMITER ;

-- câu 26
DELIMITER $$
CREATE PROCEDURE Sp_2 (IN IDHD INT, IN IDNV INT, IN IDKH INT, IN IDDV INT, IN NgayBatDau DATE, IN NgayKetThuc DATE, IN TienCoc INT, IN TongTien INT)
BEGIN
	INSERT INTO hopdong VALUES (IDHD, IDNV, IDKH, IDDV, NgayBatDau, NgayKetThuc, TiecCoc, TongTien);
END; $$
DELIMITER ;

-- câu 27
DELIMITER $$
CREATE TRIGGER Tr_1
AFTER DELETE
ON hopdong FOR EACH ROW
BEGIN
	SELECT COUNT(IDHopDong) AS "Tổng số hợp đồng"
    FROM hopdong;
END; $$
DELIMITER ;

-- câu 28


-- câu 29


-- câu 30