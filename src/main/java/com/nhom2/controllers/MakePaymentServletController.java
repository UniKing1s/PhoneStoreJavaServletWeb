package com.nhom2.controllers;

import java.io.IOException;

import com.nhom2.models.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/makePayment")
public class MakePaymentServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showPaymenDisplay(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
    private void showPaymenDisplay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();  
        if(session.getAttribute("cart") == null){
            Cart giohang = new Cart();
            session.setAttribute("cartCount", giohang.getCountItem());
            session.setAttribute("cart", giohang);
            session.setAttribute("cardTotal", giohang.getSumtotal());
        }else{
            Cart cart = (Cart) session.getAttribute("cart");
            cart.setSumtotal();
            session.setAttribute("cardTotal", cart.getSumtotal());
        }
        if(session.getAttribute("ID") != null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/paymentView.jsp");
            requestDispatcher.forward(req, resp);
            return;
        }
        resp.sendRedirect("login");
    }
}
