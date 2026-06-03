import java.sql.*;

class JDBCInsertUpdate{
    public static void main(String[] args){
        try{
            Connection con=DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/test","root","root");

            PreparedStatement ps=
                con.prepareStatement("insert into students values(?,?)");

            ps.setInt(1,101);
            ps.setString(2,"Vishal");

            ps.executeUpdate();
            System.out.println("Inserted");

            con.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}