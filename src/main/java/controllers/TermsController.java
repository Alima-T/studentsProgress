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


@WebServlet (name = "TermsController", urlPatterns = "/terms")
public class TermsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selected = req.getParameter("selected");
        ArrayList<Term> terms = DBManager.getAllActiveTerms();//достаем все активные семестры
        Term selectedTerm = terms.get(0);

        if (selectedTerm ==null||selectedTerm.equals("")){// если обновить страницу,  то возвращается 1-й семестр по умолчанию,
            // то есть если нам не передали какой нужен семестр с помощью "выбрать", то приходит по умолчанию 1
            selectedTerm = terms.get(0); //если не передадим на isp отдельно выбранный семестр, нам будет трудно, достаем отдельно выбранный семестр (у нас самый первый из списка с индексом 0)
        }else{
            for (Term t: terms){
                if (selectedTerm.equals (t.getId()+"")){//для сравнения нужно, чтобы id читалось String
                    selectedTerm=t;
                }
            }
        }
         //если не передадим на jsp отдельно выбранный семестр, нам будет трудно, достаем отдельно выбранный семестр (у нас самый первый из списка с индексом 0)
        ArrayList<Discipline> disciplines =
                DBManager.getAllActiveDisciplinesByTerm(selectedTerm.getIdTerm()); //достаем все дисциплины, которые есть в этом семестре.

        req.setAttribute("terms", terms);// terms - название атрибута пойдет в jsp страницу в <c:forEach items="${terms}" var="t">
        req.setAttribute("selectedTerm", selectedTerm);
        req.setAttribute("disciplines", disciplines);

        req.getRequestDispatcher("WEB-INF/jsp/terms.jsp").forward(req, resp); //отправляем на отображение, перенаправляем на jsp страницу terms

        Object count = req.getSession().getServletContext().getAttribute("countTerms");
        if(count ==null){
            req.getSession().getServletContext().setAttribute("countTerms", "1");
        }else{
            Object value = req.getSession().getServletContext().getAttribute("countTerms"); // меняем int на Object
            int v = Integer.parseInt(value.toString());
            v++;
            req.getSession().getServletContext().setAttribute("countTerms", v);
        }
        resp.getWriter().print("<h1>Terms page</h1>" + req.getSession().getServletContext().getAttribute("countTerms"));
        req.getRequestDispatcher("WEB-INF/jsp/terms.jsp").forward(req,resp);
    }
}

