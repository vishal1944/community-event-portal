import java.util.concurrent.*;

class ExecutorCallable{
    public static void main(String[] args)throws Exception{

        ExecutorService ex=Executors.newFixedThreadPool(2);

        Callable<Integer> task=()->100;

        Future<Integer> result=ex.submit(task);

        System.out.println(result.get());

        ex.shutdown();
    }
}