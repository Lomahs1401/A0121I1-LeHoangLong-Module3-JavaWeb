package com.example.thuc_hanh_4;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslationServlet", value = "/translate")
public class TranslationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chao");
        dictionary.put("how", "The nao");
        dictionary.put("book", "Quyen sach");
        dictionary.put("computer", "May tinh");
        dictionary.put("japanese", "Tieng Nhat");

        String search = request.getParameter("txtSearch");
        String result = dictionary.get(search);
        PrintWriter writer = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        writer.println("<!DOCTYPE html>");
        writer.println("<html>");
        writer.println("<head>");
        writer.println("<title>Dictionary</title>");
        writer.println("</head>");
        writer.println("<body>");
        if (result != null) {
            writer.println("Word: " + search + "<br/>");
            writer.println("Result: " + result);
        } else {
            writer.println("Not found");
        }
        writer.println("</body>");
        writer.println("</html>");
    }
}
