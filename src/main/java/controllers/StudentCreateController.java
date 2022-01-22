package controllers;

import com.mysql.cj.x.protobuf.MysqlxDatatypes;
import database.DBManager;
import entity.Group;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
        Date date = Date.valueOf(req.getParameter("date"));
        int status = Integer.parseInt(req.getParameter("status"));
        //INSERT INTO `students_19`.`student` (`lastname`, `name`, `id_group`, `date`, `status`) VALUES ('Степанов', 'Степан', '4', '2022-06-01', '1');
        //UPDATE `students_19`.`student` SET `lastname` = 'Логинов', `name` = 'Эдуард', `id_group` = '4', `date` = '2021-09-01' WHERE (`id` = '9');
        if (lastname == null || name == null || group == null || date == null || status == '0' ||
                lastname.equals("") || name.equals("") || group.equals("") || date.equals("")|| status==0){
            req.setAttribute("message", "error");
            req.getRequestDispatcher("WEB-INF/jsp/student-create.jsp").forward(req, resp);
        } else {
            String dateFromUser = req.getParameter("date");
            DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
            date = null;
            try {
                date = (Date) format.parse(dateFromUser);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
            String dateToDB = sdf.format(date);
            System.out.println(dateToDB);

            String pattern2 = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);
            Date dateFormat = Date.valueOf(simpleDateFormat2.format(date));

            DBManager.createNewStudent(lastname, name, group, dateFormat, status);
            resp.sendRedirect("/students"); //передаем управление на другой контроллер
        }

    }
}


