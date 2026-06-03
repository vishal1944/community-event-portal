import java.util.*;

class LambdaExample{
    public static void main(String[] args){
        List<String> list=Arrays.asList("Banana","Apple","Orange");

        list.sort((a,b)->a.compareTo(b));

        System.out.println(list);
    }
}