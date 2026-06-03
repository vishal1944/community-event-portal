class Car{
    String make="Toyota";
    String model="Camry";
    int year=2024;

    void displayDetails(){
        System.out.println(make+" "+model+" "+year);
    }

    public static void main(String[] args){
        Car c=new Car();
        c.displayDetails();
    }
}