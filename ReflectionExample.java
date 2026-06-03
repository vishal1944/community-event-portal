import java.lang.reflect.*;

class ReflectionExample{

    public void display(){
        System.out.println("Hello Reflection");
    }

    public static void main(String[] args)throws Exception{
        Class<?> c=Class.forName("ReflectionExample");

        Object obj=c.getDeclaredConstructor().newInstance();

        Method m=c.getMethod("display");
        m.invoke(obj);
    }
}