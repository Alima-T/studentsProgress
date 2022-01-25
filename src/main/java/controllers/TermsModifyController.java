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
/*
Согласно прототипу на странице модификации семестра должен быть отображен семестр и список всех дисциплин, где выделены цветом те дисциплины, которые входят в текущий семестр
 */
@WebServlet(name = "TermsModifyController", urlPatterns = "/term-modify")
public class TermsModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idModify");// GET - запрос выбор семестра, требующего изменения из terms.jsp, id мы не вписываем, а выбираем семестр из списка
        ArrayList<Discipline> allDisciplines = DBManager.getAllActiveDisciplines();
        ArrayList<Discipline> disciplinesByTerm = DBManager.getAllActiveDisciplinesByTerm(Integer.parseInt(id));
        Term term = DBManager.getTermByID(id);

        for (int i = 0; i < allDisciplines.size(); i++) {
            for (Discipline discByTerm : disciplinesByTerm) {
                if (allDisciplines.get(i).getId() == discByTerm.getId()) {
                    Discipline discNew = allDisciplines.get(i);
                    discNew.setSelected(true);
                    allDisciplines.set(i, discNew);
                }
            }
        }
        req.setAttribute("allDisciplines", allDisciplines);// namesOfTerms - название атрибута пойдет в jsp страницу в <c:forEach items="${namesOfTerms}" var="t">
//        req.setAttribute("disciplinesByTerm",disciplinesByTerm);
        req.setAttribute("term", term);

        req.getRequestDispatcher("WEB-INF/jsp/term-modify.jsp").forward(req, resp); //отправляем на отображение, перенаправляем на jsp страницу terms


    }
}
