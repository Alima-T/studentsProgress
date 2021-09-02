package constants;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public interface Constants {
    //local:
    String DB_URL = "jdbc:mysql://localhost:7777/students_19?user=root&password=123123DaDa";
    //remote:
    //String DB_URL = "jdbc:mysql://localhost:3306/students_19?user=root21&password=123123DaDa";
    Statement DB = getStatement();

    public static Statement getStatement() {
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL);
            if (conn == null) {
                System.out.println("Нет соединения с БД!");
                System.exit(0);
            }
            stmt = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stmt;
    }
}
