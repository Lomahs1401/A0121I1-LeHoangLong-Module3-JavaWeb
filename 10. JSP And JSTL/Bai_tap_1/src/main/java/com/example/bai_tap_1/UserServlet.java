package com.example.bai_tap_1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = new ArrayList<>();
        users.add(new User("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "1.jpeg"));
        users.add(new User("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "2.jpg"));
        users.add(new User("Nguyễn Thái Hoà", "1983-08-22", "Nam Định", "3.jpg"));
        users.add(new User("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "4.jpg"));
        users.add(new User("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "5.jpg"));

        request.setAttribute("users", users);
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
