package com.example.HienThiDanhSachKhachHang;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String diaChi;
    private String urlImage;

    public Customer() {
    }

    public Customer(String name, String dateOfBirth, String diaChi, String urlImage) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.diaChi = diaChi;
        this.urlImage = urlImage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }
}
