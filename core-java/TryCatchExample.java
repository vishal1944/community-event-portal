import java.util.*;
class TryCatchExample{
    public static void main(String[] args){
        Scanner s=new Scanner(System.in);
        int a=s.nextInt();
        int b=s.nextInt();

        try{
            System.out.println(a/b);
        }catch(ArithmeticException e){
            System.out.println("Cannot divide by zero");
        }
    }
}