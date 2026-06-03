import java.util.*;
class Palindrome{
    public static void main(String[] args){
        String s=new Scanner(System.in).nextLine().toLowerCase();
        String r=new StringBuilder(s).reverse().toString();
        System.out.println(s.equals(r)?"Palindrome":"Not Palindrome");
    }
}
