import java.util.*;

class HashMapExample{
    public static void main(String[] args){
        HashMap<Integer,String> map=new HashMap<>();

        map.put(1,"Vishal");
        map.put(2,"Kumar");

        System.out.println(map.get(1));
    }
}