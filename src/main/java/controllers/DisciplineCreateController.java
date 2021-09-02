package controllers;

import database.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineCreateController", urlPatterns = "/discipline-create")
//we have to add an annotation and put as parameters the name and URL
public class DisciplineCreateController extends HttpServlet { //we have to extend HttpServlet and override methods
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/discipline-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String disc = req.getParameter("newDisc");
        if (disc == null || disc.equals("")) {
            req.setAttribute("message", "error");
            req.getRequestDispatcher("WEB-INF/jsp/discipline-create.jsp").forward(req, resp);
            return;
        }
        DBManager.createNewDiscipline(disc);
        resp.sendRedirect("/disciplines");
    }
}
