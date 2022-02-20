package controllers;

import database.DBService;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineModifyController", urlPatterns = "/discipline-modify")

public class DisciplineModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("hiddenModify");
      //  System.out.println(id); //проверка в консоли на корректность
        Discipline discipline = DBService.getDisciplineByID(id);// id - объект строкой выше (String id = req.getParameter("hiddenModify");)
        req.setAttribute("disciplineForJSP", discipline); // disForJSP - название посылки для jsp страницы, и саму посылку (объект)
        req.getRequestDispatcher("WEB-INF/jsp/discipline-modify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        String disc = req.getParameter("discipl"); //название обязательно, пойдет в jsp  name="discipl"
        if (disc == null || disc.equals("")) { //последовательность важна!
            req.setAttribute("message", "error");
            Discipline discipline = DBService.getDisciplineByID(id);
            req.setAttribute("discipline", discipline);
            req.getRequestDispatcher("WEB-INF/jsp/discipline-modify.jsp").forward(req, resp);
            return;
        }

        DBService.modifyDiscipline(id, disc);
        resp.sendRedirect("/disciplines");
    }

}
