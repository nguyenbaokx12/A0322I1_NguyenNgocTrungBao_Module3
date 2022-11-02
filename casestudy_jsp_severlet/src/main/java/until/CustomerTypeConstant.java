package until;

public class CustomerType {
    public static final String INSERT_CUSTOMERTYPE_SQL = "INSERT INTO User" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    public static final String SELECT_CUSTOMERTYPE_BY_ID = "select id,name,email,country from User where id =?";
    public static final String SELECT_ALL_CUSTOMERTYPE = "select * from User";
    public static final String DELETE_CUSTOMERTYPE_SQL = "delete from User where id = ?;";
    public static final String UPDATE_CUSTOMERTYPE_SQL = "update User set name = ?,email= ?, country =? where id = ?;";
}
