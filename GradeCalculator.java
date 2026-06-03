import java.util.*;
class GradeCalculator{
    public static void main(String[] args){
        int m=new Scanner(System.in).nextInt();
        if(m>=90) System.out.println("A");
        else if(m>=80) System.out.println("B");
        else if(m>=70) System.out.println("C");
        else if(m>=60) System.out.println("D");
        else System.out.println("F");
    }
}