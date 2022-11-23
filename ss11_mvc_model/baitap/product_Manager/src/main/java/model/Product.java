package model;

public class Product {
    private int idProduct;
    private String nameProduct;
    private double priceProduct;
    private String manufacturerProduct;
    private String granteeByYear;

    public Product(int idProduct, String nameProduct, double priceProduct, String manufacturerProduct, String granteeByYear) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.priceProduct = priceProduct;
        this.manufacturerProduct = manufacturerProduct;
        this.granteeByYear = granteeByYear;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(double priceProduct) {
        this.priceProduct = priceProduct;
    }

    public String getManufacturerProduct() {
        return manufacturerProduct;
    }

    public void setManufacturerProduct(String manufacturerProduct) {
        this.manufacturerProduct = manufacturerProduct;
    }

    public String getGranteeByYear() {
        return granteeByYear;
    }

    public void setGranteeByYear(String granteeByYear) {
        this.granteeByYear = granteeByYear;
    }
}
