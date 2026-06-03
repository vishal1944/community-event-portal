import java.sql.*;

class JDBCTransaction{
    public static void main(String[] args){
        try{
            Connection con=DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/test","root","root");

            con.setAutoCommit(false);

            Statement st=con.createStatement();
            st.executeUpdate("update accounts set balance=balance-100 where id=1");
            st.executeUpdate("update accounts set balance=balance+100 where id=2");

            con.commit();
            System.out.println("Transaction Successful");

        }catch(Exception e){
            System.out.println(e);
        }
    }
}