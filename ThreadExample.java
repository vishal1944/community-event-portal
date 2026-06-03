class ThreadExample extends Thread{
    public void run(){
        for(int i=1;i<=5;i++)
            System.out.println("Thread Running");
    }

    public static void main(String[] args){
        new ThreadExample().start();
    }
}