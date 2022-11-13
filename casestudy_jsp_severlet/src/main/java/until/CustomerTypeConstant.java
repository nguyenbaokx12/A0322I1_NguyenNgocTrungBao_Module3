package until;

public class CustomerTypeConstant {
    public static final String INSERT_CUSTOMERTYPE_SQL = "INSERT INTO loai_khach" + "  (ten_loai_khach) VALUES " +
            " (?);";

    public static final String SELECT_CUSTOMERTYPE_BY_ID = "select ten_loai_khach from loai_khach where ma_loai_khach =?";
    public static final String SELECT_ALL_CUSTOMERTYPE = "select * from loai_khach";
    public static final String DELETE_CUSTOMERTYPE_SQL = "delete from loai_khach where ma_loai_khach = ?;";
    public static final String UPDATE_CUSTOMERTYPE_SQL = "update loai_khach set ten_loai_khach where ma_loai_khach = ?;";
}
