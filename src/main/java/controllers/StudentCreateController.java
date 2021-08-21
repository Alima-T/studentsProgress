package controllers;

import database.DBManager;

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
        String id_group = (req.getParameter("id_group"));
        String dateSt = req.getParameter("date");
        String status = req.getParameter("status");

        if (lastname == null || name == null || id_group == null || dateSt == null || status == null ||
                lastname.equals("") || name.equals("") || id_group.equals("") || dateSt.equals("") || status.equals("")) {
            req.setAttribute("message", "error");
            req.getRequestDispatcher("WEB-INF/jsp/student-create.jsp").forward(req, resp);
        } else {
            String dateFromUser = req.getParameter("date");
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
            Date date = null;
            try {
                date = format.parse(dateFromUser);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
            String dateToDB = sdf.format(date);
            System.out.println(dateToDB);

            String pattern2 = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);
            String dateFormat = simpleDateFormat2.format(date);

            DBManager.createNewStudent(lastname, name, id_group, dateFormat, status);
            resp.sendRedirect("/students"); //передаем управление на другой контроллер
        }

    }
}


