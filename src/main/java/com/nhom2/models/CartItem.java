package com.nhom2.models;

public class CartItem {
    //private int maCart;
    private int sl;
    private Product product;
    private double tongTien;
    public CartItem() {
    }
    
    

    
    public CartItem(int sl, Product product, double tongTien) {
        //this.maCart = maCart;
        this.sl = sl;
        this.product = product;
        this.tongTien = tongTien;
    }




    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setTongTien() {
        this.tongTien = tinhTongTien();
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

    //public int getMaCart() {
    //    return maCart;
    //}
    //public void setMaCart(int maCart) {
    //    this.maCart = maCart;
    //}   
    private double tinhTongTien(){
        double tong = product.getGiasp() *(1 - (product.getGiamgia()/100)) * getSl();
        return tong;
    }

    public double getTongTien() {
        return tongTien;
    }
}
