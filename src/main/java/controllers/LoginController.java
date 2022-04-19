package controllers;

import database.DBService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = "/login")

public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        if (DBService.isVerifiedUser(login, password, role)) {// в java  вшито, что если стоит /, то автоматически выбирается стартовая страница index.jsp
            req.getSession().setAttribute("role", role);// роль необходимо сохранить, чтобы дать соответствующие роли права.
            resp.sendRedirect("/");
            return; // значит, что дальше код не будет исполняться
            // в cookie (не в java). Есть 3 места для хранения в самой java: request,  session, servlet context.
            // Выбираем session, потому что относительно данного пользователя уже создана сессия
        }//после return и закрытия тела автоматически условие else, даже если не указано явно
        req.setAttribute("message", "1");// если залогинились неправильно
        req.getRequestDispatcher("WEB-INF/jsp/login.jsp").forward(req, resp);

    }

}
