package com.example.FinalExam2.model;

public class BenhNhan {
    private int idBenhNhan;
    private String nameBenhNhan;
    private String ngayNhapVien;
    private String ngayXuatVien;
    private String lyDo;
    private int id_BenhAn;

    public BenhNhan() {
    }

    public BenhNhan(int idBenhNhan, String nameBenhNhan, String ngayNhapVien, String ngayXuatVien, String lyDo, int id_BenhAn) {
        this.idBenhNhan = idBenhNhan;
        this.nameBenhNhan = nameBenhNhan;
        this.ngayNhapVien = ngayNhapVien;
        this.ngayXuatVien = ngayXuatVien;
        this.lyDo = lyDo;
        this.id_BenhAn = id_BenhAn;
    }

    public BenhNhan(int idBenhNhan, String nameBenhNhan, String ngayNhapVien, String ngayXuatVien, String lyDo) {
        this.idBenhNhan = idBenhNhan;
        this.nameBenhNhan = nameBenhNhan;
        this.ngayNhapVien = ngayNhapVien;
        this.ngayXuatVien = ngayXuatVien;
        this.lyDo = lyDo;
    }

    public int getIdBenhNhan() {
        return idBenhNhan;
    }

    public void setIdBenhNhan(int idBenhNhan) {
        this.idBenhNhan = idBenhNhan;
    }

    public String getNameBenhNhan() {
        return nameBenhNhan;
    }

    public void setNameBenhNhan(String nameBenhNhan) {
        this.nameBenhNhan = nameBenhNhan;
    }

    public String getNgayNhapVien() {
        return ngayNhapVien;
    }

    public void setNgayNhapVien(String ngayNhapVien) {
        this.ngayNhapVien = ngayNhapVien;
    }

    public String getNgayXuatVien() {
        return ngayXuatVien;
    }

    public void setNgayXuatVien(String ngayXuatVien) {
        this.ngayXuatVien = ngayXuatVien;
    }

    public String getLyDo() {
        return lyDo;
    }

    public void setLyDo(String lyDo) {
        this.lyDo = lyDo;
    }

    public int getId_BenhAn() {
        return id_BenhAn;
    }

    public void setId_BenhAn(int id_BenhAn) {
        this.id_BenhAn = id_BenhAn;
    }
}
