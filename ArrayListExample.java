import java.util.*;

class ArrayListExample{
    public static void main(String[] args){
        ArrayList<String> list=new ArrayList<>();
        list.add("Vishal");
        list.add("Kumar");

        for(String s:list)
            System.out.println(s);
    }
}