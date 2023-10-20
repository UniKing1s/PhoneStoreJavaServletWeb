package com.nhom2.models;

public class Product {
    private int masp;
    private String tensp;
    private int sl;
    private double giasp;
    private double giamgia;
    private String tag;
    private String mota;
    private int mahang;
    private int maloai;
    private String imgURL;
    private int idNguoiThem;
    
    public Product() {
    }
    
    

    
    
    public Product(int masp, String tensp, int sl, double giasp, double giamgia, String tag, String mota, int mahang,int maloai, String imgURL, int idNguoiThem) {
        this.masp = masp;
        this.tensp = tensp;
        this.sl = sl;
        this.giasp = giasp;
        this.giamgia = giamgia;
        this.tag = tag;
        this.mota = mota;
        this.mahang = mahang;
        this.maloai = maloai;
        this.imgURL = imgURL;
        this.idNguoiThem = idNguoiThem;
    }





    public double getGiamgia() {
        return giamgia;
    }





    public void setGiamgia(double giamgia) {
        this.giamgia = giamgia;
    }





    public String getTag() {
        return tag;
    }





    public void setTag(String tag) {
        this.tag = tag;
    }





    public int getMasp() {
        return masp;
    }
    public void setMasp(int masp) {
        this.masp = masp;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public int getSl() {
        return sl;
    }
    public void setSl(int sl) {
        this.sl = sl;
    }
    public double getGiasp() {
        return giasp;
    }
    public void setGiasp(double giasp) {
        this.giasp = giasp;
    }
    public String getMota() {
        return mota;
    }
    public void setMota(String mota) {
        this.mota = mota;
    }
    public int getMahang() {
        return mahang;
    }
    public void setMahang(int mahang) {
        this.mahang = mahang;
    }
    public int getMaloai() {
        return maloai;
    }
    public void setMaloai(int maloai) {
        this.maloai = maloai;
    }
    public String getImgURL() {
        return imgURL;
    }
    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }




    public int getIdNguoiThem() {
        return idNguoiThem;
    }




    public void setIdNguoiThem(int idNguoiThem) {
        this.idNguoiThem = idNguoiThem;
    }

    
}
