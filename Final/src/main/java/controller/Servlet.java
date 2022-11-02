package controller;

import model.Payment;
import model.Room;
import repositories.IRoomRepository;
import repositories.Impl.RoomRepository;
import service.Impl.PaymentService;
import service.Impl.RoomService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet", value = "/room")
public class Servlet extends HttpServlet {
    RoomService roomService = new RoomService();
    PaymentService paymentService = new PaymentService();
    IRoomRepository iRoomRepository = new RoomRepository();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showFormList(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                create(req,resp);
                break;
//            case "edit":
//                edit(req, resp);
//                break;
            case "delete":
                delete(req,resp);
                break;
            case "search":
                search(req,resp);
                break;
        }
    }

    public void showFormList(HttpServletRequest request, HttpServletResponse response) {
        List<Room> roomList = roomService.findAll();
        List<Payment> paymentList = paymentService.findAll();
        request.setAttribute("roomList",roomList);
        request.setAttribute("paymentList",paymentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Payment> paymentList = paymentService.findAll();
        request.setAttribute("paymentList", paymentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String tenNguoiThue = request.getParameter("tenNguoiThue");
        int sDT = Integer.parseInt(request.getParameter("sDT"));
        String ngayBatDau = request.getParameter("ngayBatDau");
        int idHinhThuc = Integer.parseInt(request.getParameter("idHinhThuc"));
        Room room = new Room(tenNguoiThue, sDT, ngayBatDau, idHinhThuc);
        iRoomRepository.create(room);
//        roomService.create(room);
        String mess = "Successfully Added New";
        request.setAttribute("mess", mess);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        boolean check = roomService.delete(idDelete);
        request.setAttribute("roomList", this.roomService.findAll());
        request.setAttribute("paymentList", this.paymentService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String tenNguoiThue = request.getParameter("tenNguoiThueSearch");
        request.setAttribute("roomList", this.roomService.search(tenNguoiThue));
        request.setAttribute("paymentList", paymentService.findAll());
        request.setAttribute("tenNguoiThueSearch", tenNguoiThue);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
