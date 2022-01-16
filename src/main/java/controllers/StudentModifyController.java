package controllers;

import database.DBManager;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student-modify")
public class StudentModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id.equals("")) {
            resp.sendRedirect("/students");
        } else {
            req.setAttribute("id", id);
            ArrayList<Student> students = DBManager.getAllActiveStudents();
            for (Student student : students) {
                if (student.getId() == Integer.parseInt(id)) {
                    req.setAttribute("selectedStudent", student);
                }
                req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String lastname = req.getParameter("lastname");
        String name = req.getParameter("name");
        String id_group = req.getParameter("id_group");
        String date = req.getParameter("date");
        String dateFormat = null;
        if (lastname.equals("") || name.equals("") || id_group.equals("") || date.equals("")) {
            req.setAttribute("error", "1");
            req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req, resp);
        } else {
            if (!date.matches("\\d\\d\\d\\d-\\d\\d-\\d\\d")) {
                String pattern = "MM/dd/yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                Date date2 = null;
                try {
                    date2 = simpleDateFormat.parse(date);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String pattern1 = "yyyy-MM-dd HH:mm:ss";
                SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(pattern1);
                dateFormat = simpleDateFormat1.format(date2);
                DBManager.modifyStudent(id, lastname, name, id_group, date);
                resp.sendRedirect("/students");
            } else {
                DBManager.modifyStudent(id, lastname, name, id_group, date);
                resp.sendRedirect("/students");
            }
        }
    }
}
