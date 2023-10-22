package com.nhom2.controllers.cartController;

import java.io.IOException;
import java.sql.Connection;

import com.nhom2.models.Cart;
import com.nhom2.models.CartItem;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudCartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/updatecard")
public class EditCartServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doGet(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int masp = Integer.parseInt(req.getParameter("masp"));
        int sl = Integer.parseInt(req.getParameter("sl"));
        int id = 0;
        try {
            id = Integer.parseInt(session.getAttribute("ID").toString());
        } catch (Exception e) {
            // TODO: handle exception
        }
        System.out.println("id = " + id);
        //Check đăng nhập
        if (session.getAttribute("ID") != null) {
            //Xử lí số lượng sản phẩm khi đã đăng nhập
            Product product = new Product();
            product.setMasp(masp);
            CartItem cardItem = new CartItem();
            //Set product có masp và set sl cho carditem
            cardItem.setProduct(product);
            cardItem.setSl(sl);
            Connection conn = MySQLConnection.getMySQLConnection();
            DBCrudCartItem.updateQuantity(conn, id, cardItem);
            Cart card = new Cart();
            card.setCartItems(DBCrudCartItem.getListOfItemByID(conn, id)); 
            session.setAttribute("cart", card);
            session.setAttribute("cartCount", card.getCountItem());
            //Đóng connection
            MySQLConnection.closeConnection(conn);
        }else{
            ///Xử lí số lượng vật phẩm trong giỏ khi chưa đăng nhâp

            Cart giohang = (Cart) session.getAttribute("cart");
            if (giohang != null) {
                giohang.updateItem(masp, sl);
                giohang.setSumtotal();
                session.setAttribute("cart", giohang);
                session.setAttribute("cartCount", giohang.getCountItem());
            }
        }
        resp.sendRedirect("cart");
    }
}

