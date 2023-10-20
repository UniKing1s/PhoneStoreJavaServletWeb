package com.nhom2.models.modelsCart;

/**
 * CartItemBean
 */
public class CartItemBean {
    private String strPartNumber;
    private String strMota;
    private double dblUnicost;
    private int iSoluong;
    private double dblTotalCost;
    
    public CartItemBean() {
    }

    
    public CartItemBean(String strPartNumber, String strMota, double dblUnicost, int iSoluong, double dbTotalCost) {
        this.strPartNumber = strPartNumber;
        this.strMota = strMota;
        this.dblUnicost = dblUnicost;
        this.iSoluong = iSoluong;
        this.dblTotalCost = dbTotalCost;
    }
    
    public String getStrMota() {
        return strMota;
    }
    public void setStrMota(String strMota) {
        this.strMota = strMota;
    }
    public double getDbUnicost() {
        return dblUnicost;
    }
    public void setDblUnicost(double dblUnicost) {
        this.dblUnicost = dblUnicost;
    }
    public int getSoluong() {
        return iSoluong;
    }
    public void setSoluong(int Soluong) {
        iSoluong = Soluong;
    }
    public double getTotalCost() {
        return dblTotalCost;
    }
    public void setTotalCost(double dbTotalCost) {
        this.dblTotalCost = dbTotalCost;
    }


    public String getStrPartNumber() {
        return strPartNumber;
    }


    public void setStrPartNumber(String strPartNumber) {
        this.strPartNumber = strPartNumber;
    }


    
}