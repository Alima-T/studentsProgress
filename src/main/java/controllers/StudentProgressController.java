package controllers;

import database.DBManager;
import entity.Discipline;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

@WebServlet(name = "StudentProgressController", urlPatterns = "/student-progress")
public class StudentProgressController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idStudent"); //idStudent получили сo страницы student
//        if (id.equals("")) {
//            resp.sendRedirect("/student-progress");
//        } else {
        req.setAttribute("id", id);
//            передали значение id в name в строку <input type="hidden" name="id" value="${id}"> в student-progress.jsp
        Student student = DBManager.getStudent(id);
        req.setAttribute("student", student);

        ArrayList<Term> terms = DBManager.getAllActiveTerms();
        req.setAttribute("allTerms", terms);
        req.setAttribute("selectedTerm", terms.get(0));

        req.getRequestDispatcher("WEB-INF/jsp/student-progress.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("idStudent");
        ArrayList<Term> terms = DBManager.getAllActiveTerms();
        String termId = req.getParameter("selectedTerm");
        int selectedId = Integer.parseInt(termId);
        for (Term s : terms) {
            if (s.getId() == selectedId) {
                req.setAttribute("allTerms", terms);
                req.setAttribute("selectedTerm", s);
                ArrayList<Discipline> disciplinesByTerm = DBManager.getAllActiveDisciplinesByTerm(selectedId);
                req.setAttribute("allDisciplinesByTerm", disciplinesByTerm);

                req.setAttribute("id", id);
                Student student = DBManager.getStudent(id);
                req.setAttribute("student", student);

                LinkedHashMap<Discipline, String> disciplinesAndMarkByTerm = DBManager.getDisciplinesAndMarkByTerm(id, termId);
                req.setAttribute("disciplinesAndMarkByTerm", disciplinesAndMarkByTerm);

                req.getRequestDispatcher("WEB-INF/jsp/student-progress.jsp").forward(req, resp);
            }
        }
    }
}

