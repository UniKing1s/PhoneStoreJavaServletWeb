package com.nhom2.models.modelsCart;

import java.util.ArrayList;

/**
 * CartBean
 */
public class CartBean {
private ArrayList<CartItemBean> alCartItems = new ArrayList<CartItemBean>();
private double dblOrderTotal;


public int getLineItemCount(){
    return alCartItems.size();
}


public void deleteCartItem(String strItemIndex){
    int iItemIndex = 0;
    try {
        iItemIndex = Integer.parseInt(strItemIndex);
        alCartItems.remove(iItemIndex - 1);
        calculateOrderTotal();
    } catch (NumberFormatException nfe) {
        System.out.println("Error while deleting cart item : " + nfe.getMessage());
        nfe.printStackTrace();
        // TODO: handle exception
    }
}


public void updateCartItem(String strItemIndex, String strSoluong){
    double dblTotalCost = 0.0;
    double dblUnicost = 0.0;
    int iSoluong = 0;
    int iItemIndex = 0;
    CartItemBean cartItem = null;
    try {
        iItemIndex = Integer.parseInt(strItemIndex);
        iSoluong = Integer.parseInt(strSoluong);
        if(iSoluong > 0){
            cartItem = (CartItemBean) alCartItems.get(iItemIndex -1);
            dblUnicost = cartItem.getDbUnicost();///////////
            dblTotalCost = dblUnicost * iSoluong;
            cartItem.setSoluong(iSoluong);
            cartItem.setTotalCost(dblTotalCost);
            calculateOrderTotal();
        }
    } catch (NumberFormatException nfe) {
        System.out.println("Error while updating cart: " + nfe.getMessage());
        nfe.printStackTrace();
        // TODO: handle exception
    }
}


public void addCartItem(String strmodelNo, String strMota, String strUnicost, String strSoluong){
    double dblTotalCost = 0.0;
    double dblUnicost = 0.0;
    int iSoluong = 0;
    CartItemBean cartItem = new CartItemBean();
    try {
        dblUnicost = Double.parseDouble(strUnicost);
        iSoluong = Integer.parseInt(strSoluong);
        if(iSoluong > 0){
            dblTotalCost = dblUnicost *iSoluong;
            cartItem.setStrPartNumber(strmodelNo);/////////
            cartItem.setStrMota(strMota);/////////
            cartItem.setDblUnicost(dblUnicost);/////////
            cartItem.setSoluong(iSoluong);
            cartItem.setTotalCost(dblTotalCost);
            alCartItems.add(cartItem);
            calculateOrderTotal();
        }
    } catch (NumberFormatException nfe) {
        System.out.println("Error while parsing form String to primitive types : " + nfe.getMessage());
        nfe.printStackTrace();
        // TODO: handle exception
    }
}


public void addCartItem(CartItemBean cartItem){
alCartItems.add(cartItem);
}


public CartItemBean getCartItem(int iItemIndex){
    CartItemBean cartItem = null;
    if (alCartItems.size() > iItemIndex){
        cartItem = (CartItemBean) alCartItems.get(iItemIndex);
    }
    return cartItem;
}


public ArrayList<CartItemBean> getCartItems(){
    return alCartItems;
}


public void setCartItems(ArrayList<CartItemBean> alCartItems){
    this.alCartItems = alCartItems;
}


public double getOrderTotal(){
    return dblOrderTotal;
}


public void setOrderTotal(double dblOrderTotal){
    this.dblOrderTotal = dblOrderTotal;
}


protected void calculateOrderTotal(){
    double dblTotal = 0;
    for(int counter = 0; counter <alCartItems.size(); counter++){
        CartItemBean cartItem = (CartItemBean) alCartItems.get(counter);
        dblTotal += cartItem.getTotalCost();
    }
    setOrderTotal(dblTotal);
}
}