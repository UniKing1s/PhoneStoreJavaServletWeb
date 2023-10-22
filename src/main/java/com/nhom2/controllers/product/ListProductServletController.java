package com.nhom2.controllers.product;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/managerProduct")
public class ListProductServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showPageListOfProduct(req, resp); 
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }









    
    private void showPageListOfProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println("role = " + session.getAttribute("role"));
        if (session.getAttribute("role") != null && session.getAttribute("role").toString().equals("true") ) {
            //Lấy connect
            Connection conn = MySQLConnection.getMySQLConnection();
            //
            List<Product> list = null;
            list = DBCrudProduct.getListOfProduct(conn);
            MySQLConnection.closeConnection(conn);
            req.setAttribute("list", list);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/managerproduct.jsp");
            requestDispatcher.forward(req, resp);
            return;
        }    
        resp.sendRedirect("home");  
    }
}
