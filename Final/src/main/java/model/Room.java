package model;

public class Room {
    private int maPhongTro;
    private String tenNguoiThue;
    private int sDT;
    private String ngayBatDau;
    private int idHinhThuc;

    public Room() {
    }

    public Room(int maPhongTro, String tenNguoiThue, int sDT, String ngayBatDau, int idHinhThuc) {
        this.maPhongTro = maPhongTro;
        this.tenNguoiThue = tenNguoiThue;
        this.sDT = sDT;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThuc = idHinhThuc;
    }

    public Room( String tenNguoiThue, int sDT, String ngayBatDau, int idHinhThuc) {
        this.tenNguoiThue = tenNguoiThue;
        this.sDT = sDT;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThuc = idHinhThuc;
    }
    public int getMaPhongTro() {
        return maPhongTro;
    }

    public void setMaPhongTro(int maPhongTro) {
        this.maPhongTro = maPhongTro;
    }

    public String getTenNguoiThue() {
        return tenNguoiThue;
    }

    public void setTenNguoiThue(String tenNguoiThue) {
        this.tenNguoiThue = tenNguoiThue;
    }

    public int getsDT() {
        return sDT;
    }

    public void setsDT(int sDT) {
        this.sDT = sDT;
    }

    public String getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(String ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public int getIdHinhThuc() {
        return idHinhThuc;
    }

    public void setIdHinhThuc(int idHinhThuc) {
        this.idHinhThuc = idHinhThuc;
    }
}
