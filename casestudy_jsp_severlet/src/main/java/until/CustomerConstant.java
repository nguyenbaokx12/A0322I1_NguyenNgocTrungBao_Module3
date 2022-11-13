package until;

public class CustomerConstant {
    public static final String INSERT_CUSTOMER_SQL = "INSERT INTO khach_hang" + "  (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?);";
    public static final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang where ma_khach_hang =?";
    public static final String SELECT_ALL_CUSTOMER = "select * from khach_hang";
    public static final String DELETE_CUSTOMER_SQL = "delete from khach_hang where ma_khach_hang = ?;";
    public static final String UPDATE_CUSTOMER_SQL = "update khach_hang set ma_loai_khach = ?, ho_ten = ?, ngay_sinh = ?, gioi_tinh = ?, so_cmnd = ?, so_dien_thoai = ?, email = ?, dia_chi = ? where ma_khach_hang = ?;";
}
