select
    'NhanVien' as 'LoaiNguoi',
    id as 'Ma',
    name as 'HoTen',
    email as 'Email',
    phone_number as 'SoDienThoai',
    date_of_birth as 'NgaySinh',
    address as 'DiaChi'
from
    employee

union
select
    'KhachHang' as 'LoaiNguoi',
    id as 'Ma',
    name as 'HoTen',
    email as 'Email',
    phone_number as 'SoDienThoai',
    date_of_birth as 'NgaySinh',
    address as 'DiaChi'
from
    customer;