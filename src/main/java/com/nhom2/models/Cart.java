package com.nhom2.models;

import java.util.ArrayList;

public class Cart {
    private ArrayList<CartItem> cartItems = new ArrayList<CartItem>();
    private double Sumtotal;
    public Cart() {
    }

    public Cart(ArrayList<CartItem> cartItems, double sumtotal) {
        this.cartItems = cartItems;
        Sumtotal = sumtotal;
    }

    public ArrayList<CartItem> getCartItems() {
        return cartItems;
    }




    public void setCartItems(ArrayList<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public int getCountItem(){
        return cartItems.size();
    }
    

    

    public void setSumtotal() {
        Sumtotal = tinhTongTien(cartItems);
    }
    //Tinh tong tien
    private double tinhTongTien(ArrayList<CartItem> cartItems){
        double tong = 0;
        for (CartItem cartItem : cartItems) {
            tong = tong + (cartItem.getTongTien());
        }
        return tong;
    }


    ///thêm sản phẩm vào giỏ
    public void addItem(CartItem card){
        if (card.getSl() > 0) {
            System.out.println("bắt đầu đọc dữ liệu");
            for (CartItem x : cartItems) {
                System.out.println("giá trị của cardItem (masp): "+ x.getProduct().getMasp());
                System.out.println("Giá trị của card masp: " + card.getProduct().getMasp());
                if(x.getProduct().getMasp() == card.getProduct().getMasp()){
                    int soluong = x.getSl() + card.getSl();
                    x.setSl(soluong);
                    System.out.println("Số lượng mới của carItem này là:" + x.getSl());
                    return;
                } 
            }
            cartItems.add(card);
            System.out.println("Số lượng item trong giỏ: "+ getCountItem());
        }
    }
    
    public void updateItem(int masp,int soluong){
        if (soluong > 0) {
            for (CartItem cartItem : cartItems) {
                if(cartItem.getProduct().getMasp() == masp){
                    cartItem.setSl(soluong);
                    cartItem.setTongTien();;
                    setSumtotal();
                }
            }  
        }else{
            deleteItem(masp);
        }
        
    }
    public void deleteItem(int masp){
        int i = 0;
        for (CartItem cartItem : cartItems) {
            if(cartItem.getProduct().getMasp() == masp){
                cartItems.remove(i);
                break;
            }
            i++;
        }
    }

    public double getSumtotal() {
        return Sumtotal;
    }

    public void setSumtotal(double sumtotal) {
        Sumtotal = sumtotal;
    }

}
