package controllers;

import database.DBManager;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TermCreateController", urlPatterns = "/term-create")
public class TermCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Discipline> allDisciplines = DBManager.getAllActiveDisciplines();
        req.setAttribute("allDisciplines", allDisciplines);// namesOfTerms - название атрибута пойдет в jsp страницу в <c:forEach items="${namesOfTerms}" var="t">
        req.getRequestDispatcher("WEB-INF/jsp/term-create.jsp").forward(req, resp);
    }

// doPost не работает!!! В РАБОТЕ!
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newTerm = req.getParameter("newTerm");
        String duration = req.getParameter("newDuration");
        ArrayList<Discipline> allDisciplines = DBManager.getAllActiveDisciplines();
        ArrayList<Discipline> disciplinesOfNewTerm = DBManager.getAllActiveDisciplinesByTerm(Integer.parseInt(newTerm)); //подумать над id

        if (newTerm == null || newTerm.equals("")) {
            req.setAttribute("message", "error"); //for jsp
            req.getRequestDispatcher("/terms").forward(req, resp);
        }
        DBManager.createNewTerm(duration, disciplinesOfNewTerm);
        resp.sendRedirect("/terms");
    }
}

