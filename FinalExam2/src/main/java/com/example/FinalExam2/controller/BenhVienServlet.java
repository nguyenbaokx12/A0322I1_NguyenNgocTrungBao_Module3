package com.example.FinalExam2.controller;

import com.example.FinalExam2.model.BenhAn;
import com.example.FinalExam2.model.BenhNhan;
import com.example.FinalExam2.service.impl.BenhAnService;
import com.example.FinalExam2.service.impl.BenhNhanService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BenhVienServlet", value = "/benhvien")
public class BenhVienServlet extends HttpServlet {
    BenhAnService benhAnService = new BenhAnService();
    BenhNhanService benhNhanService = new BenhNhanService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                break;
            default:
                showFormList(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request,response);
                break;
        }
    }

    public void showFormList(HttpServletRequest request, HttpServletResponse response){
        List<BenhAn> benhAnList = benhAnService.findAll();
        List<BenhNhan> benhNhanList = benhNhanService.findAll();
        request.setAttribute("benhAnList", benhAnList);
        request.setAttribute("benhNhanList", benhNhanList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/benhvien/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        boolean check = benhNhanService.delete(idDelete);
        request.setAttribute("benhNhanList", this.benhNhanService.findAll());
        request.setAttribute("benhAnList", this.benhAnService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/benhvien/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int idBenhNhan = Integer.parseInt(request.getParameter("idBenhNhan"));
        String nameBenhNhan = request.getParameter("nameBenhNhan");
        String ngayNhapVien = request.getParameter("ngayNhapVien");
        String ngayXuatVien = request.getParameter("ngayXuatVien");
        String lyDo = request.getParameter("lyDo");
        BenhNhan benhNhan = new BenhNhan(idBenhNhan,nameBenhNhan,ngayNhapVien,ngayXuatVien,lyDo);
        try {
            benhNhanService.edit(benhNhan);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            response.sendRedirect("benhvien");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
