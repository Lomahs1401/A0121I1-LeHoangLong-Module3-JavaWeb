package com.example.product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        float listPrice = Float.parseFloat(request.getParameter("price"));
        float discountPercent = Float.parseFloat(request.getParameter("discount"));

        //Lượng chiết khấu
        float discountAmount = listPrice * discountPercent * 0.01f;
        // Giá sau khi được chiết khấu
        float discountPrice = listPrice - discountAmount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Description: " + description + "</h1><br/>");
        writer.println("<h1>Discount amount: " + discountAmount + "</h1><br/>");
        writer.println("<h1>Discount price: " + discountPrice + "</h1><br/>");
        writer.println("</html>");
    }
}
