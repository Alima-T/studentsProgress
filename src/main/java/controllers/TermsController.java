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
        ArrayList<Term> terms = DBManager.getAllActiveTerms();
        Term selectedTerm = terms.get(0);
        req.setAttribute("namesOfTerms", terms);// namesOfDisciplines - название атрибута пойдет в jsp страницу в <c:forEach items="${namesOfDisciplines}" var="disc">
        req.getRequestDispatcher("WEB-INF/jsp/terms.jsp").forward(req, resp);









        //        Object count = req.getSession().getServletContext().getAttribute("countTerms");
//        if(count ==null){
//            req.getSession().getServletContext().setAttribute("countTerms", "1");
//        }else{
//            Object value = req.getSession().getServletContext().getAttribute("countTerms"); // меняем int на Object
//            int v = Integer.parseInt(value.toString());
//            v++;
//            req.getSession().getServletContext().setAttribute("countTerms", v);
//        }
//        resp.getWriter().print("<h1>Terms page</h1>" + req.getSession().getServletContext().getAttribute("countTerms"));
////        req.getRequestDispatcher("WEB-INF/jsp/terms.jsp").forward(req,resp);
    }
}

