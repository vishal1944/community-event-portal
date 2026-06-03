import java.net.*;

class TCPServer{
    public static void main(String[] args)throws Exception{
        ServerSocket ss=new ServerSocket(5000);
        System.out.println("Server Started");
        Socket s=ss.accept();
        System.out.println("Client Connected");
        ss.close();
    }
}