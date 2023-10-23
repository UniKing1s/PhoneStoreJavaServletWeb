package com.nhom2.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nhom2.models.Cart;
import com.nhom2.models.Hang;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudCategory;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/home")
public class homePageServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showHomePage(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }

    protected void showHomePage(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        //Giỏ hàng
        HttpSession session = req.getSession();
        //Giỏ hàng chưa có => tạo mới
        if(session.getAttribute("cart") == null){
            Cart giohang = new Cart();
            session.setAttribute("cartCount", giohang.getCountItem());
            session.setAttribute("cart", giohang);
        }
        //List<Product> prod = new ArrayList<>();
        //lấy connection
        Connection conn = MySQLConnection.getMySQLConnection();
        //thực hiện lấy dữ liệu;
        List<Product> prod = DBCrudProduct.getListOfProduct(conn);
        List<Hang> hangs = DBCrudCategory.GetListHang(conn);

        //đóng kết nối
        MySQLConnection.closeConnection(conn);
        //Load dữ liệu lên req
        List<String> listHang = new ArrayList<>();
        for (Hang hang : hangs) {
            listHang.add(hang.getTenHang());
        }
        req.setAttribute("list", prod);
        req.setAttribute("listhang", listHang);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/homePageViews.jsp");
        requestDispatcher.forward(req, resp);
    }
}
