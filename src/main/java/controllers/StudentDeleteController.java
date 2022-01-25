package controllers;

import database.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StudentDeleteController", urlPatterns = "/students-delete")
public class StudentDeleteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studIds = req.getParameter("hiddenDeleteStud");
        String[] studIdsToDelete = studIds .split("-");
        for (String id : studIdsToDelete) {
            DBManager.deleteStudents(id);
        }
        resp.sendRedirect("/students");
    }
}

