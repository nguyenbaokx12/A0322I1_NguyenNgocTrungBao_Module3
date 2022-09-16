package com.example.HienThiDanhSachKhachHang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomersServlet", value = "/CustomersServlet")
public class CustomersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Luffy", "1983-08-20", "Hà Nội", "http://cdn.shopify.com/s/files/1/0550/9300/2349/products/Luffy_snewwantedposter_1200x1200.jpg?v=1658374516"));
        customerList.add(new Customer("Zoro", "1983-08-21", "Bắc Giang", "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/zoro-bounty-wanted-poster-one-piece-roronoa-zoro.jpg"));
        customerList.add(new Customer("Sanji", "1983-08-22", "Nam Định", "https://cdn.shopify.com/s/files/1/0573/7522/8070/products/OP-425-SanjiHearteyes.jpg?v=1622781125"));
        customerList.add(new Customer("Ussop", "1983-08-17", "Hà Tây", "https://i.pinimg.com/474x/40/ce/51/40ce51d85aa47573ab49b837db05d500.jpg"));
        customerList.add(new Customer("Franky", "1983-08-19", "Hà Nội", "https://i.pinimg.com/originals/1a/8d/3e/1a8d3e747c26a7dcdf8a8d9c1aecd52a.jpg"));

        request.setAttribute("listcustomers", customerList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
