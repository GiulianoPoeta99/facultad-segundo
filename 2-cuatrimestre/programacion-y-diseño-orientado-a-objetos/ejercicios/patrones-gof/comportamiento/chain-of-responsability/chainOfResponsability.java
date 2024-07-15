// Clase que representa una solicitud de compra
class PurchaseRequest {
    private double amount;
    private String purpose;

    public PurchaseRequest(double amount, String purpose) {
        this.amount = amount;
        this.purpose = purpose;
    }

    public double getAmount() {
        return amount;
    }

    public String getPurpose() {
        return purpose;
    }
}

// Interfaz Handler que declara el método para manejar solicitudes
interface Approver {
    void setNextApprover(Approver nextApprover);
    void processRequest(PurchaseRequest request);
}

// Clase base para los manejadores
abstract class AbstractApprover implements Approver {
    private Approver nextApprover;

    @Override
    public void setNextApprover(Approver nextApprover) {
        this.nextApprover = nextApprover;
    }

    @Override
    public void processRequest(PurchaseRequest request) {
        if (canApprove(request)) {
            approve(request);
        } else if (nextApprover != null) {
            nextApprover.processRequest(request);
        } else {
            System.out.println("Ningún aprobador puede manejar la solicitud.");
        }
    }

    // Método abstracto que verifica si el manejador puede aprobar la solicitud
    protected abstract boolean canApprove(PurchaseRequest request);

    // Método abstracto para aprobar la solicitud
    protected abstract void approve(PurchaseRequest request);
}

// Clase concreta de manejador
class Manager extends AbstractApprover {
    @Override
    protected boolean canApprove(PurchaseRequest request) {
        return request.getAmount() <= 1000;
    }

    @Override
    protected void approve(PurchaseRequest request) {
        System.out.println("La solicitud de compra para " + request.getPurpose() +
                " por " + request.getAmount() + " ha sido aprobada por el Gerente.");
    }
}

// Clase concreta de manejador
class Director extends AbstractApprover {
    @Override
    protected boolean canApprove(PurchaseRequest request) {
        return request.getAmount() <= 5000;
    }

    @Override
    protected void approve(PurchaseRequest request) {
        System.out.println("La solicitud de compra para " + request.getPurpose() +
                " por " + request.getAmount() + " ha sido aprobada por el Director.");
    }
}

// Clase concreta de manejador
class VicePresident extends AbstractApprover {
    @Override
    protected boolean canApprove(PurchaseRequest request) {
        return request.getAmount() <= 10000;
    }

    @Override
    protected void approve(PurchaseRequest request) {
        System.out.println("La solicitud de compra para " + request.getPurpose() +
                " por " + request.getAmount() + " ha sido aprobada por el Vicepresidente.");
    }
}

// Cliente que utiliza el patrón Chain of Responsibility
class ChainOfResponsibilityClient {
    public static void main(String[] args) {
        // Crear instancias de manejadores
        Approver manager = new Manager();
        Approver director = new Director();
        Approver vicePresident = new VicePresident();

        // Configurar la cadena de responsabilidad
        manager.setNextApprover(director);
        director.setNextApprover(vicePresident);

        // Procesar solicitudes de compra
        PurchaseRequest request1 = new PurchaseRequest(800, "Suministros de oficina");
        manager.processRequest(request1);

        PurchaseRequest request2 = new PurchaseRequest(3500, "Equipamiento de TI");
        manager.processRequest(request2);

        PurchaseRequest request3 = new PurchaseRequest(12000, "Muebles de oficina");
        manager.processRequest(request3);
    }
}