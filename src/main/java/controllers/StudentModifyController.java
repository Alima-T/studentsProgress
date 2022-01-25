package controllers;

import database.DBManager;
import entity.Discipline;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import static constants.Constants.DATE_PATTERN_FOR_USER;
import static constants.Constants.DATE_PATTERN_FOR_SQL;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student-modify")
public class StudentModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("hiddenModify");
        Student student = DBManager.getStudentByID(id);
        req.setAttribute("studentForJSP", student);
//        if (stud.equals("")) {
//            resp.sendRedirect("/students");
//        } else {
//            ArrayList<Student> students = DBManager.getAllActiveStudents();
//            for (Student student : students) {
//                if (student.getId() == Integer.parseInt(id)) {
//                    req.setAttribute("selectedStudent", student);
//                }
                req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req, resp);
//            }
//        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String lastname = req.getParameter("lastname");
        String name = req.getParameter("name");
        String group = req.getParameter("group");
//        String date = req.getParameter("date");
        String date = req.getParameter("date");
        DateFormat format = new SimpleDateFormat(DATE_PATTERN_FOR_USER); //устанавливаем удобный для пользователей формат даты
        Date dateNew = null;

        if (lastname == null || name == null || group == null || date == null ||
                lastname.equals("") || name.equals("") || group.equals("") || date.equals("")) {
            req.setAttribute("message", "error");
            req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req, resp);
        } else {
            try {
                dateNew = format.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN_FOR_SQL);//снова переводим формат "MM/dd/yyyy" в нужный для SQL "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            String dateForSQL = sdf.format(dateNew);
            DBManager.modifyStudent(id,lastname, name, group, dateForSQL);
            resp.sendRedirect("/students");
        }
//
//        String id = req.getParameter("id");
//        String disc = req.getParameter("disc");
//        if (disc == null || disc.equals("")) { //последовательность важна!
//            req.setAttribute("message", "error");
//            Discipline discipline = DBManager.getDisciplineByID(id);
//            req.setAttribute("disc", discipline);
//            req.getRequestDispatcher("WEB-INF/jsp/discipline-modify.jsp").forward(req, resp);
//            return;
//        }
//
//        DBManager.modifyDiscipline(id, disc);
//        resp.sendRedirect("/disciplines");
//
//        req.setCharacterEncoding("UTF-8");
//        String id = req.getParameter("id");
//        String lastname = req.getParameter("lastname");
//        String name = req.getParameter("name");
//        String group = req.getParameter("group");
//        String date = req.getParameter("date");
//
//        String dateFormat = null;
//        if (lastname.equals("") || name.equals("") || group.equals("") || date.equals("")) {
//            req.setAttribute("error", "1");
//            req.getRequestDispatcher("WEB-INF/jsp/student-modify.jsp").forward(req, resp);
//        } else {
//            if (!date.matches("\\d\\d\\d\\d-\\d\\d-\\d\\d")) {
//                String pattern = "MM/dd/yyyy";
//                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//                Date date2 = null;
//                try {
//                    date2 = simpleDateFormat.parse(date);
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
//                String pattern1 = "yyyy-MM-dd HH:mm:ss";
//                SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(pattern1);
//                dateFormat = simpleDateFormat1.format(date2);
//                DBManager.modifyStudent(id, lastname, name, group, date);
//                resp.sendRedirect("/students");
//            } else {
//                DBManager.modifyStudent(id, lastname, name, group, date);
//                resp.sendRedirect("/students");
//            }
//        }
    }
}
