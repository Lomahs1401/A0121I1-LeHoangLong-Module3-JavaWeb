package controller;

import model.User;
import repository.UserRepositoryImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {

    private UserRepositoryImpl repository;

    @Override
    public void init() throws ServletException {
        repository = new UserRepositoryImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewDetails(request, response);
                break;
            case "findByCountry":
                findCountryForm(request, response);
            default:
                showListUsers(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "findByCountry":
                findUserByCountry(request, response);
                break;
        }
    }

    private void showListUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = repository.selectAllUsers();
        request.setAttribute("listUsers", userList);
        request.getRequestDispatcher("users/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("users/create.jsp").forward(request, response);
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("nameUser");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        List<User> users = repository.selectAllUsers();
        int id = users.get(users.size() - 1).getId() + 1;
        User user = new User(id, userName, email, country);
        this.repository.insertUser(user);
        // Chuyển hướng về lại trang create.jsp để thông báo cho người dùng biết đã create product thành công!
        request.setAttribute("message", "Created New User Successfully!");
        request.getRequestDispatcher("users/create.jsp").forward(request, response);
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

    private void viewDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.repository.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("users/error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("user", user);
            request.getRequestDispatcher("users/view.jsp").forward(request, response);
        }
    }

    private void findCountryForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("users/find-by-country.jsp").forward(request, response);
    }

    private void findUserByCountry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String country = request.getParameter("findByCountry");
        List<User> users = repository.findByCountry(country);
        request.setAttribute("country", country);
        request.setAttribute("users", users);
        request.getRequestDispatcher("users/find-by-country.jsp").forward(request, response);
    }
}
