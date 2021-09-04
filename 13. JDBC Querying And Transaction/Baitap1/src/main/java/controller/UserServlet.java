package controller;

import model.User;
import repository.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {

    private UserDAO repository;

    @Override
    public void init() throws ServletException {
        repository = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "getAllUsers":
                listUsersForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            default:
                showListUsers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
        }
    }

    private void listUsersForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = repository.selectAllUsers();
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("users/list.jsp").forward(request, response);
    }

    private void showListUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("users/list.jsp").forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.repository.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("users/error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("user", user);
            request.getRequestDispatcher("users/update.jsp").forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("nameUser");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = this.repository.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("users/error-404.jsp").forward(request, response);
        } else {
            user.setName(userName);
            user.setEmail(email);
            user.setCountry(country);
            this.repository.updateUser(user);
            request.setAttribute("user", user);
            request.setAttribute("message", "Updated User Successfully!");
            request.getRequestDispatcher("users/update.jsp").forward(request, response);
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.repository.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("users/error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("user", user);
            request.getRequestDispatcher("users/delete.jsp").forward(request, response);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.repository.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("users/error-404.jsp").forward(request, response);
        } else {
            this.repository.deleteUser(id);
            // Chuyển hướng về lại ProductServlet
            response.sendRedirect("/users");
        }
    }
}
