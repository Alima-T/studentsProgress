package controllers;

import database.DBService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineDeleteController", urlPatterns = "/disciplines-delete")
public class DisciplineDeleteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String discIds = req.getParameter("hiddenDeleteDisc");
        String[] idsToDelete = discIds.split("-");
        for (String id : idsToDelete) {
            DBService.deleteDiscipline(id);
        }
        resp.sendRedirect("/disciplines");
    }
}
