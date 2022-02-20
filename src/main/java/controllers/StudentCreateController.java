package controllers;

import database.DBService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static constants.Constants.DATE_PATTERN_FOR_USER;
import static constants.Constants.DATE_PATTERN_FOR_SQL;

@WebServlet(name = "StudentCreateController", urlPatterns = "/student-create")
public class StudentCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/student-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String lastname = req.getParameter("lastname");
        String name = req.getParameter("name");
        String group = req.getParameter("group");
        String date = req.getParameter("date");
        DateFormat format = new SimpleDateFormat(DATE_PATTERN_FOR_USER); //устанавливаем удобный для пользователей формат даты
        Date dateFromUser = null;

        if (lastname == null || name == null || group == null || date == null ||
                lastname.equals("") || name.equals("") || group.equals("") || date.equals("")) {
            req.setAttribute("message", "error");
            req.getRequestDispatcher("WEB-INF/jsp/student-create.jsp").forward(req, resp);
        } else {
            try {
                dateFromUser = format.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN_FOR_SQL);//снова переводим формат "MM/dd/yyyy" в нужный для SQL "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            String dateForSQL = sdf.format(dateFromUser);
            DBService.createNewStudent(lastname, name, group, dateForSQL);
            resp.sendRedirect("/students");
        }
    }
}


