package database;

import constants.Constants;
import entity.Discipline;
import entity.Group;
import entity.Student;
import entity.Term;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {


    public static ArrayList<Discipline> getAllActiveDisciplines() {

        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("select * from `discipline` where `status`='1'");

            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setId(rs.getInt("id"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
        return disciplines;
    }
    public static ArrayList<Student> getAllActiveStudents() {

        ArrayList<Student> students = new ArrayList<Student>();
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("select * from `student` where `status`='1'");

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setDate(rs.getDate("date"));
//                student.setGroup(rs.getGroup("group"));
                student.setStatus(rs.getInt("status"));

                students.add(student);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
        return students;

    }
    public static ArrayList<Term> getAllActiveTerms() {
    ArrayList<Term> terms = new ArrayList<Term>();
        try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // объявили драйвер
        Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
        Statement stmt = conn.createStatement();// создали отправку в БД
        ResultSet rs = stmt.executeQuery("select * from `term` where `status`='1'");

        int count =1;
        while (rs.next()) {
           Term term = new Term();
           term.setId(rs.getInt("id"));
           term.setName("Семестр"+count);
           count++;
           term.setDuration(rs.getString("duration"));
           terms.add(term);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
        return terms;
}

    public static ArrayList<Discipline> getAllActiveDisciplinesByTerm(int idTerm) {

        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("SELECT d.id, d.discipline FROM term_discipline as td"+
                    "left join discipline as d on td.id_discipline = d.id\n" +
                           "where td.id_term = '"+idTerm+"'\n"+
                    "and d.status = '1'");

            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setId(rs.getInt("id"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
        return disciplines;
    }

    public static Discipline getDisciplineByID(String id) {
        Discipline discipline = new Discipline();
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL); //  создали и подключились к БД);
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_19.discipline where id ='"+id+"';");// id приходит из js от клиента
            while (rs.next()) {
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discipline;
    }

//public static Student getStudentByID(String id){
//        Student student = new Student();
//    try {
//        Class.forName(Constants.MYSQL_DRIVER);
//        Connection conn = DriverManager.getConnection(Constants.DB_URL);
//        Statement stmt = conn.createStatement();
//        ResultSet rs = stmt.executeQuery("SELECT * FROM students_19.student where id = '"+id+"';");
//while (rs.next()){
//
//    student.setId(rs.getInt(id));
//}
//    } catch (Exception e) {
//        e.printStackTrace();
//    }
//    return student;
//}


    public static void createNewDiscipline(String disc) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL); //  создали и подключились к БД

            Statement stmt = conn.createStatement();// создали отправку в БД
            stmt.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + disc + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void createNewStudent(String lastName, String name, Group group, Date date){
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
          //




        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public static void modifyDiscipline(String id, String disc) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL); //  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            stmt.execute("UPDATE `students_19`.`discipline` SET `discipline` = '"+disc+"' WHERE (`id` = '"+id+"');");
            // копируем запрос из mySQL, удаляем название схемы и разделяем кавычками запрос + id

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteDiscipline(String id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL); //  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            stmt.execute("UPDATE `students_19`.`discipline` SET `status` = '0' WHERE (`id` = '" + id + "');\n");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}