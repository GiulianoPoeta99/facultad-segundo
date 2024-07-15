// Interfaz Strategy que declara el método de pago
interface PaymentStrategy {
    void pay(int amount);
}

// Clase concreta que implementa la interfaz Strategy para el pago con tarjeta de crédito
class CreditCardPayment implements PaymentStrategy {
    private String cardNumber;
    private String name;

    public CreditCardPayment(String cardNumber, String name) {
        this.cardNumber = cardNumber;
        this.name = name;
    }

    @Override
    public void pay(int amount) {
        System.out.println("Realizando pago de $" + amount + " con tarjeta de crédito " + cardNumber);
    }
}

// Clase concreta que implementa la interfaz Strategy para el pago con PayPal
class PayPalPayment implements PaymentStrategy {
    private String email;

    public PayPalPayment(String email) {
        this.email = email;
    }

    @Override
    public void pay(int amount) {
        System.out.println("Realizando pago de $" + amount + " con PayPal (" + email + ")");
    }
}

// Clase de contexto que utiliza una estrategia de pago
class PaymentContext {
    private PaymentStrategy paymentStrategy;

    public PaymentContext(PaymentStrategy paymentStrategy) {
        this.paymentStrategy = paymentStrategy;
    }

    public void setPaymentStrategy(PaymentStrategy paymentStrategy) {
        this.paymentStrategy = paymentStrategy;
    }

    public void processPayment(int amount) {
        paymentStrategy.pay(amount);
    }
}

// Cliente que utiliza el patrón Strategy
class StrategyExample {
    public static void main(String[] args) {
        // Crear instancias de las estrategias de pago
        PaymentStrategy creditCardPayment = new CreditCardPayment("1234-5678-9876-5432", "John Doe");
        PaymentStrategy payPalPayment = new PayPalPayment("john.doe@example.com");

        // Crear instancias de contexto con diferentes estrategias de pago
        PaymentContext creditCardContext = new PaymentContext(creditCardPayment);
        PaymentContext payPalContext = new PaymentContext(payPalPayment);

        // Realizar pagos utilizando diferentes estrategias
        creditCardContext.processPayment(100);
        payPalContext.processPayment(50);

        // Cambiar dinámicamente la estrategia de pago
        creditCardContext.setPaymentStrategy(payPalPayment);
        creditCardContext.processPayment(75);
    }
}
