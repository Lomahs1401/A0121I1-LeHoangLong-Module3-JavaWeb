package com.example.bai_tap_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        String operator = request.getParameter("operator");
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        char charOperator = 0;
        float result = 0;
        int check;
        String exception;

        switch (operator) {
            case "addition": {
                result = firstOperand + secondOperand;
                charOperator = '+';
                break;
            }
            case "subtraction": {
                result = firstOperand - secondOperand;
                charOperator = '-';
                break;
            }
            case "multiplication": {
                result = firstOperand * secondOperand;
                charOperator = '*';
                break;
            }
            case "division": {
                if (secondOperand == 0) {
                    Calculator ex = new Calculator();
                    exception = ex.getMessage();
                    System.out.println(exception);
                    request.setAttribute("exception", exception);
                } else {
                    result = firstOperand / secondOperand;
                    charOperator = '/';
                }
                break;
            }
        }

        request.setAttribute("firstOperand", firstOperand);
        request.setAttribute("operator", charOperator);
        request.setAttribute("secondOperator", secondOperand);
        request.setAttribute("result", result);

        request.getRequestDispatcher("calculate.jsp").forward(request, response);
    }
}
