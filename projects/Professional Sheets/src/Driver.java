import java.sql.*;

public class Driver {
   
    public static void main(String[] args) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet results = null;
    try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/world","root", "F**~<|*m0f0RE");
    stmt = conn.prepareStatement("select max(population), CountryCode from city group by CountryCode order by max(population) desc");
    results = stmt.executeQuery();
    while (results.next()) {
    System.out.println(results.getInt("max(population)") + " " +
    results.getString("CountryCode"));
    }
    } catch (SQLException e) {
    e.printStackTrace();
    } finally {
    try {
    if (results != null) results.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
    } catch (SQLException e) {
    e.printStackTrace();
    }
    }
    }
    }
    

