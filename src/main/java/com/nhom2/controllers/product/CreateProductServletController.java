package com.nhom2.controllers.product;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.nhom2.models.Hang;
import com.nhom2.models.Loai;
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
@WebServlet("/addproduct")
public class CreateProductServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("role") != null && session.getAttribute("role").toString().equals("true") ) {
            Connection conn = MySQLConnection.getMySQLConnection();
            List<Loai> loais = DBCrudCategory.GetListLoai(conn);
            List<Hang> hangs = DBCrudCategory.GetListHang(conn);
            MySQLConnection.closeConnection(conn);
            req.setAttribute("loais", loais);
            req.setAttribute("hangs", hangs);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/addproduct.jsp");
            requestDispatcher.forward(req, resp);
            return;
        }    
        resp.sendRedirect("home");  
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Lấy connect
        Connection conn = MySQLConnection.getMySQLConnection();
        //Lấy giá trị từ trang thêm
        String tensp = req.getParameter("tensp");
        int sl = Integer.parseInt(req.getParameter("sl"));
        double giasp = Double.parseDouble(req.getParameter("giasp"));
        double giamgia = Double.parseDouble(req.getParameter("giamgia"));
        String tag = req.getParameter("tag");
        String mota = req.getParameter("mota");
        int mahang = Integer.parseInt(req.getParameter("mahang"));
        int maloai = Integer.parseInt(req.getParameter("maloai"));
        String imgURL = req.getParameter("imgUrl");
        int idNguoiThem = 1;
        Product product = new Product(0, tensp, sl, giasp, giamgia, tag, mota, mahang, maloai, imgURL, idNguoiThem);
        DBCrudProduct.addProduct(conn, product);
        MySQLConnection.closeConnection(conn);
        resp.sendRedirect("managerProduct");
    }
}
