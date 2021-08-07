package database;

import constants.Constants;
import entity.Discipline;
import entity.Group;
import entity.Student;
import entity.Term;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DBManager {

    public static ArrayList<Student> getAllActiveStudents() {
        ArrayList<Student> students = new ArrayList<Student>();
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("select * from `students_19`.`student` where `status`='1'");
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    public static Student getStudentByID(String id) {
        Student student = new Student();
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `students_19`.`student` WHERE status = '1' AND id = " + id + ";");

            while (rs.next()) {
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public static void createNewStudent(String lastName, String name, Group group, Date date) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void createNewStudent(String lastname, String name, String group, String date) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `students_19`.`student` (`lastname`, `name`, `group`, `date`) " +
                    "VALUES ('" + lastname + "', '" + name + "', '" + group + "', '" + date + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteStudent(String id) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `status` = '0' WHERE (`id` = " + id + ");");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void modifyStudent(String id, String lastname, String name, String group, String date) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `sername` = '" + lastname + "', `name` = '" + name + "', `group` = '" + group + "', `date` = '" + date + "' WHERE (`id` = '" + id + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Discipline> getAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
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

    public static Discipline getDisciplineByID(String id) {
        Discipline discipline = new Discipline();
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_19.discipline where id ='" + id + "';");// id приходит из js от клиента
            while (rs.next()) {
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discipline;
    }

    public static void createNewDiscipline(String disc) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + disc + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void modifyDiscipline(String id, String disc) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `students_19`.`discipline` SET `discipline` = '" + disc + "' WHERE (`id` = '" + id + "');");
            // копируем запрос из mySQL, удаляем название схемы и разделяем кавычками запрос + id
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteDiscipline(String id) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `students_19`.`discipline` SET `status` = '0' WHERE (`id` = '" + id + "');\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static ArrayList<Discipline> getAllActiveDisciplinesByTerm(int idTerm) {
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT discipline.id, discipline.discipline FROM term_discipline as td" + //as - маска, для того, чтобы сократить название заменяем с помощью фы
                    "left join discipline as d on td.id_discipline = d.id\n" +// join - присоединение таблицы discipline к таблице term_discipline к колонке id_discipline
                    "where td.id_term = '" + idTerm + "'\n" + // где id_term равно выбранному в браузере семестру
                    "and d.status = '1'");// выводит только активные дисциплины в выбранном семестре

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

    public static ArrayList<Term> getAllActiveTerms() {
        ArrayList<Term> terms = new ArrayList<Term>();
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("select * from `term` where `status`='1'");

            int count = 1; // счетчик для установления имени семестру, т.к. у него нет названия
            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setName("Семестр" + count); // в базе нет имени, поэтому прописываем код для н=генерации нового имени семестр1, 2, 3
                count++;
                term.setDuration(rs.getString("duration"));// устанавливаем длительность семестра в неделях
                terms.add(term);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return terms;
    }

    //    public static ArrayList<Term> getAllActiveTerms() {
//        ArrayList<Term> terms = new ArrayList<>();
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(Constants.PATH_TO_DATABASE);
//            Statement stmt = conn.createStatement();
//            ResultSet rs = stmt.executeQuery("SELECT * FROM semestr WHERE status = '1';");
//
//            while (rs.next()) {
//                Term term = new Term();
//                term.setId(rs.getInt("id"));
//                term.setName(rs.getString("name"));
//                term.setDuration(rs.getString("duration"));
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return terms;
//    }
    public static void createNewTerm(String name, String duration) {
        try {
            Class.forName(Constants.MYSQL_DRIVER);
            Connection conn = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `term` (`name`, `duration`) VALUES ('" + name + "', '" + duration + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Term getTermByID(String id) {

        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("select * from `term` where `status`='1' and `id` = '" + id + "'");
            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                //на этом месте понимаем что не можем сгенерировать снова имя, удаляем установку имени
                term.setDuration(rs.getString("duration"));// устанавливаем длительность семестра в неделях
                return term;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isVerifiedUser(String login, String password, String role) {

        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection conn = DriverManager.getConnection(Constants.DB_URL);//  создали и подключились к БД
            Statement stmt = conn.createStatement();// создали отправку в БД
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_19.user_role as us\n" +
                    "left join user as u on us.id_user = u.id \n" +
                    "where u.login = '" + login + "' and u.password = '" + password + "' and us.id_role = " + role);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static void createTerm(String duration, String[] disciplines) {

        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT id,  term FROM students_19.terms ORDER BY ID DESC limit 1");
            String currentTerm = null;
            int idTerm = 0;
            while (resultSet.next()) {
                currentTerm = resultSet.getString("term");
                idTerm = resultSet.getInt("id");
            }
            int termNumber = 0;
            termNumber = Integer.parseInt(currentTerm.substring(8));
            String term = "Семестр " + (++termNumber);
            stmt.execute("INSERT INTO `students_19`.`terms` (`term`, `duration`) VALUES ('" + term + "','" + duration + "')");

            int newId = ++idTerm;
            for (String discipline : disciplines) {
                ResultSet resultSet1 = stmt.executeQuery("SELECT id FROM students_19.disciplines\n" +
                        "where discipline ='" + discipline + "'");
                int idDiscipline = 0;
                while (resultSet1.next()) {
                    idDiscipline = resultSet1.getInt("id");
                }

                stmt.execute("INSERT INTO `students_19`.`terms_disciplines` (`term_id`, `discipline_id`) VALUES ('" + newId + "','" + idDiscipline + "')");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteStudents(String id) {
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = con.createStatement();
            stmt.execute("UPDATE `students_19`.`students` SET `status` = '0' WHERE (`id` = '" + id + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteTerm(String idTermDelete) {
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement stmt = con.createStatement();
            stmt.execute("UPDATE `students_19`.`terms` SET `status` = '0' WHERE (`id` = '" + idTermDelete + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static String getDisciplineName(String id) {
        String name = null;
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select discipline from students_19.discipline where id =" + id + "");
            while (rs.next()) {
                name = rs.getString("discipline");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public static Term getTermById(String idTerm) {

        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM students_19.term where id = " + idTerm);

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setDuration(rs.getString("duration"));
                term.setName(rs.getString("term"));
                term.setStatus(1);
                return term;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void modifyTerm(String id, String modifiedDuration, String[] modifiedDisciplinesId) {
        int duration1 = 0;
        try {
            duration1 = Integer.parseInt(modifiedDuration.trim());

        } catch (NumberFormatException e) {
            Pattern pattern = Pattern.compile("\\D");
            Matcher matcher = pattern.matcher(modifiedDuration);

            int i = 0;
            if (matcher.find()) {
                i = matcher.start();
            }
            duration1 = Integer.parseInt(modifiedDuration.substring(0, i));
        }
        String wordWeek = null;
        String durationString = String.valueOf(duration1);
        if ((duration1 - 1) % 10 == 0 && duration1 != 11) {
            wordWeek = " неделя";
        } else if ((durationString.substring(durationString.length() - 1).equals("2") ||
                durationString.substring(durationString.length() - 1).equals("3") ||
                durationString.substring(durationString.length() - 1).equals("4")) &&
                duration1 != 12 && duration1 != 13 && duration1 != 14) {
            wordWeek = " недели";
        } else {
            wordWeek = " недель";
        }
        String durationResult = duration1 + wordWeek;
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement statement = con.createStatement();
            statement.execute("DELETE FROM `students_19`.`term_discipline` WHERE (`id_term` = '" + id + "')");
            if (modifiedDisciplinesId != null) {
                for (String newDisciplineId : modifiedDisciplinesId) {
                    statement.execute("INSERT INTO `students_19`.`term_discipline` (`id_term`, `id_discipline`) VALUES ('" + id + "', '" + newDisciplineId + "')");
                }
            }

            statement.execute("UPDATE `students_19`.`term` SET `duration` = '" + durationResult + "' WHERE (`id` = '" + id + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void modifyStudent(String id, String modifiedLastName, String modifiedFirstName, int modifiedGroup, String modifiedDate) {
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement statement = con.createStatement();
            statement.execute("UPDATE `students_19'.`students` SET `name` = '" + modifiedFirstName + "', `lastname` = '" + modifiedLastName + "', `id_group` = '" + modifiedGroup + "', `date` = '" + modifiedDate + "' WHERE (`id` = '" + id + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudent(String id) {
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select  lastname, name, id_group, date from students_19.student where id =" + id + "");

            while (rs.next()) {
                Student student = new Student();
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("groupName"));
                student.setDate(rs.getDate("date"));
                return student;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static LinkedHashMap<Discipline, String> getDisciplinesAndMarkByTerm(String id, String termId) {
        LinkedHashMap<Discipline, String> disciplinesAndMark = new LinkedHashMap<>();
        try {
            Class.forName(Constants.MYSQL_DRIVER); // объявили драйвер
            Connection con = DriverManager.getConnection(Constants.DB_URL);
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select discipline.id, discipline.discipline , mark.mark  from students_control.marks\n" +
                    "join students_19.term_discipline on marks.id_term_discipline=terms_disciplines.id\n" +
                    "join students_19.term on term_disciplines.id_term = term.id\n" +
                    "join students_19.discipline on term_discipline.discipline=disciplines.id\n" +
                    " where marks.student_id =" + id + " and terms_disciplines.term_id=" + termId + "");
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                discipline.setStatus(1);
                String mark = rs.getString("mark");
                disciplinesAndMark.put(discipline, mark);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return disciplinesAndMark;
    }
}


