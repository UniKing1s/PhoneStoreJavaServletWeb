package com.nhom2.controllers.cartController;

import java.io.IOException;
import java.sql.Connection;

import com.nhom2.models.Cart;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.modelsCURD.DBCrudCartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteItem")
public class DeleteCartItemServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        deleteItemCart(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }



    
    private void deleteItemCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int masp = Integer.parseInt(req.getParameter("masp").toString());
        if(session.getAttribute("ID") != null){
            int id = Integer.parseInt(session.getAttribute("ID").toString());
            Connection conn = MySQLConnection.getMySQLConnection();
            DBCrudCartItem.deleteCardItem(conn, id, masp);
            Cart card = new Cart();
            card.setCartItems(DBCrudCartItem.getListOfItemByID(conn, id)); 
            card.setSumtotal();
            session.setAttribute("cart", card);
            session.setAttribute("cartCount", card.getCountItem());
            MySQLConnection.closeConnection(conn);
        }else{
            Cart card = (Cart) session.getAttribute("cart");
            card.deleteItem(masp);
            card.setSumtotal();
            session.setAttribute("cart", card);
            session.setAttribute("cartCount", card.getCountItem());
        }
        resp.sendRedirect("cart");
    }
}
