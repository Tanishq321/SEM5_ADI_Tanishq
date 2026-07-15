class Cars {
    void display() {
        System.out.println("This is a car.");
    }
}

class bmw extends Cars {
    @Override
    void display() {
        System.out.println("BMW: Luxury and Performance");
    }
}

class lambo extends Cars {
    @Override
    void display() {
        System.out.println("Lamborghini: Speed and Style");
    }
}

class ferrari extends Cars {
    @Override
    void display() {
        System.out.println("Ferrari: Power and Elegance");
    }
}

public class CarOverriding {
    public static void main(String[] args) {

        Cars car1 = new bmw();
        Cars car2 = new lambo();
        Cars car3 = new ferrari();

        car1.display();
        car2.display();
        car3.display();
    }
}