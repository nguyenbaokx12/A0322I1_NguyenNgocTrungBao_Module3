package com.example.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/convert")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double  listPrice = Double.parseDouble(request.getParameter("price"));
        double  discountPercent = Double.parseDouble(request.getParameter("percent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        request.setAttribute("discountAmount","=> Discount Amount "+discountAmount);
        request.setAttribute("discountPrice","=> Discount Price "+discountPrice);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
