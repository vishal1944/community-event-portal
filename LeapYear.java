import java.util.*;
class LeapYear{
    public static void main(String[] args){
        int y=new Scanner(System.in).nextInt();
        System.out.println((y%400==0)||(y%4==0&&y%100!=0)?"Leap":"Not Leap");
    }
}