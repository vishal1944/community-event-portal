class VirtualThreads{
    public static void main(String[] args){
        Thread.startVirtualThread(() ->
            System.out.println("Virtual Thread Running"));
    }
}