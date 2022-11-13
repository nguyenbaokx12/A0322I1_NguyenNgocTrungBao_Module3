package com.example.UngDungCalculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.InputMismatchException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int firstNum = Integer.parseInt(request.getParameter("firstNumber"));
        int secondNum = Integer.parseInt(request.getParameter("secondNumber"));
        String operator = request.getParameter("operator");
        double result = 0;
        String error = "";
        try {
            switch (operator) {
                case "+":
                    result = firstNum + secondNum;
                    break;
                case "-":
                    result = firstNum - secondNum;
                    break;
                case "*":
                    result = firstNum * secondNum;
                    break;
                case "/":
                    result = firstNum / secondNum;
                    break;
                default:
                    break;
            }
        } catch (ArithmeticException e) {
            error  ="Không chia cho 0";
        } catch (InputMismatchException e){
            error = "Nhập sai định dạng";
        } catch (Exception e) {
            error = "Đã có lỗi xảy ra";
        }

            request.setAttribute("firstNum", firstNum);
            request.setAttribute("secondNum", secondNum);
            request.setAttribute("result", result);
            request.setAttribute("operator", operator);
            request.setAttribute("error", error);
            request.getRequestDispatcher("WEB-INF/result.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
