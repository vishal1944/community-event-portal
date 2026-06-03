class PatternMatchingSwitch{

    static void check(Object obj){
        switch(obj){
            case Integer i -> System.out.println("Integer");
            case String s -> System.out.println("String");
            case Double d -> System.out.println("Double");
            default -> System.out.println("Unknown");
        }
    }

    public static void main(String[] args){
        check(10);
        check("Java");
        check(10.5);
    }
}