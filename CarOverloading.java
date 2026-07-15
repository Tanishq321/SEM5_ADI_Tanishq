class Cars {

    void carInfo() {
        System.out.println("Car Information");
    }

    void carInfo(String brand) {
        System.out.println("Car Brand: " + brand);
    }

    void carInfo(String brand, int price) {
        System.out.println("Car Brand: " + brand);
        System.out.println("Price: " + price + " Lakhs");
    }
}

public class CarOverloading {
    public static void main(String[] args) {

        Cars c = new Cars();

        c.carInfo();
        c.carInfo("BMW");
        c.carInfo("Ferrari", 500);
    }
}