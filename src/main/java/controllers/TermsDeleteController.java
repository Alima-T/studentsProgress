package controllers;

import database.DBService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TermDeleteController", urlPatterns = "/term-delete")
//we have to add an annotation and put as parameters the name and URL
public class TermsDeleteController extends HttpServlet { //we have to extend HttpServlet and override methods

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String termIds = req.getParameter("hiddenDelete");
        String[] idsToDelete = termIds.split("-");
        for (String id : idsToDelete) {
            DBService.deleteTerm(id);
        }
        resp.sendRedirect("/terms");
    }
}
