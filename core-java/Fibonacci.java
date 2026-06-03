import java.util.*;
class Fibonacci{
    static int fib(int n){
        return n<=1?n:fib(n-1)+fib(n-2);
    }
    public static void main(String[] args){
        int n=new Scanner(System.in).nextInt();
        System.out.println(fib(n));
    }
}