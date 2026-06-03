import java.util.*;
class GuessingGame{
    public static void main(String[] args){
        Scanner s=new Scanner(System.in);
        int r=(int)(Math.random()*100)+1,g;
        do{
            g=s.nextInt();
            if(g<r) System.out.println("Too Low");
            else if(g>r) System.out.println("Too High");
        }while(g!=r);
        System.out.println("Correct");
    }
}