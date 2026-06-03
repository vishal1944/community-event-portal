import java.util.*;
class ArraySumAverage{
    public static void main(String[] args){
        Scanner s=new Scanner(System.in);
        int n=s.nextInt(),sum=0;
        int[] a=new int[n];

        for(int i=0;i<n;i++){
            a[i]=s.nextInt();
            sum+=a[i];
        }

        System.out.println("Sum="+sum);
        System.out.println("Average="+(double)sum/n);
    }
}