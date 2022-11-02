package model;

public class Payment {
    private int id;
    private String namePayment;

    public Payment() {
    }

    public Payment(int id, String namePayment) {
        this.id = id;
        this.namePayment = namePayment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamePayment() {
        return namePayment;
    }

    public void setNamePayment(String namePayment) {
        this.namePayment = namePayment;
    }
}
