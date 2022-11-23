package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/product")
public class HelloServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                save(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "findBy":
                findBy(request,response);
            default:
                break;
        }

    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idDelete = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = productService.delete(idDelete);
        String mess ="xoa thành công";
        if (!check){
            mess =" xoá không thành công";
        }
        response.sendRedirect("product");

    }

    protected void findBy(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("findName");
        List<Product> check = productService.findBy(name);
        request.getRequestDispatcher("view/product/findBy.jsp").forward(request,response);
    }

    protected void save(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String manufacturer = request.getParameter("manufacturer");
        String granteeByYear = request.getParameter("granteeByYear");
        Product product = new Product(id,name,price,manufacturer,granteeByYear);
        boolean check = productService.add(product);
        String mess = "them moi khong thanh cong";
        if (check){
            mess ="them moi thanh cong";
            request.setAttribute("mess", mess);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException s){
            s.printStackTrace();
        }catch (IOException i){
            i.printStackTrace();
        }
    }



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request,response);
                // thêm mới
                break;
            case "delete":
                // xoá
                break;
            case "findBy":
            default:
                // trả về trang list
                showListStudent(request, response);
        }

    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("bookList", this.productService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}