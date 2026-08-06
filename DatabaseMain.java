import java.sql.*;

public static void main(String[] args) {
    String url = "jdbc:mysql://localhost:3306/mydatabase";
    String user = "root";
    String password = "tg198007#TG";

    try (
        Connection con = DriverManager.getConnection(url, user, password)) {
        System.out.println("Database Connected successfully!");
        Statement st = con.createStatement();
        String insert="INSERT INTO student Values (101, 'Tanishq Goel', 19)";

        st.executeUpdate(insert);
        System.out.println("Data inserted");

        String update = "UPDATE student SET age =23 WHERE id=101";
        st.executeUpdate(update);
        System.out.println("Data updated");

        String select = "SELECT * FROM student";
        ResultSet rs = st.executeQuery(select);
        System.out.println("\nStudent data");

        while (rs.next()) {
            System.out.println(
                rs.getInt("id") + " " +
                rs.getString("name") + " " +
                rs.getInt("age")
                );
        }

        String delete = "DELETE FROM student WHERE id=101";
        st.executeUpdate(delete);
        System.out.println("Data deleted");

        rs.close();
        st.close();
        con.close();
        System.out.println("Database connection closed.");
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
}