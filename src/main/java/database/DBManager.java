package database;

import constants.Constants;
import entity.Discipline;
import entity.Group;
import entity.Student;
import entity.Term;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DBManager {

//    STUDENTS
    public static ArrayList<Student> getAllActiveStudents() {
        ArrayList<Student> students = new ArrayList<Student>();
        try {
            String id;
            ResultSet rs = Constants.DB.executeQuery("SELECT * FROM `students_19`.`student` WHERE status = '1'");
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setId_group(rs.getInt("id_group"));
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
        ArrayList<Student> students = new ArrayList<>();
        try {
            ResultSet rs = Constants.DB.executeQuery("SELECT * FROM `students_19`.`student` WHERE status = '1' AND id = " + id + ";");
            while (rs.next()) {
                student.setId(rs.getInt("id"));
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setId_group(rs.getInt("id_group"));
                student.setDate(rs.getDate("date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public static void createNewStudent(String lastname, String name, String id_group, Date date, int status) {
        try {
            Constants.DB.execute("INSERT INTO `students_19`.`student` ( `lastname`, `name`, `id_group`, `date`, `status`) " +
                    "VALUES ('" + lastname + "', '" + name + "', '" + id_group + "', '" + date + "', '" + status + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void deleteStudents(String id) {
        try {
            Constants.DB.execute("UPDATE `students_19`.`student` SET `status` = '0' WHERE (`id` = '" + id + "');\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

public static void modifyStudent(String id, String lastname, String name, String id_group, String date){
        try {
            Constants.DB.execute("UPDATE `students_19'.`student` SET " +
                    "`lastname` = '" + lastname + "', " +
                    "`name` = '" + name + "', " +
                    "`id_group` = '" + id_group + "', " +
                    "`date` = '" + date + "' " +
                    "WHERE (`id` = '" + id + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Student getStudent(String id) {
        try {
            ResultSet rs = Constants.DB.executeQuery("select  lastname, name, id_group, date from students_19.student where id =" + id + "");
            while (rs.next()) {
                Student student = new Student();
                student.setLastname(rs.getString("lastname"));
                student.setName(rs.getString("name"));
                student.setId_group(rs.getInt("id_group"));
                student.setDate(rs.getDate("date"));
                return student;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    DISCIPLINES
    public static ArrayList<Discipline> getAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
            ResultSet rs = Constants.DB.executeQuery("select * from `discipline` where `status`='1'");
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
            ResultSet rs = Constants.DB.executeQuery("SELECT * FROM students_19.discipline where id ='" + id + "';");// id приходит из js от клиента
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
            Constants.DB.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + disc + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void modifyDiscipline(String id, String disc) {
        try {
            Constants.DB.execute("UPDATE `students_19`.`discipline` SET `discipline` = '" + disc + "' WHERE (`id` = '" + id + "');");
            // копируем запрос из mySQL, удаляем название схемы и разделяем кавычками запрос + id
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteDiscipline(String id) {
        try {
            Constants.DB.execute("UPDATE `students_19`.`discipline` SET `status` = '0' WHERE (`id` = '" + id + "');\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Discipline> getAllActiveDisciplinesByTerm(int idTerm) {
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {
//            ResultSet rs = Constants.DB.executeQuery("SELECT * FROM students_19.term_discipline \n" +
//                    "left join discipline on term_discipline.id_discipline = discipline.id\n" +
//                    "where term_discipline.id_term='1' \n" +
//                    "and discipline.status = '1' ");
            ResultSet rs = Constants.DB.executeQuery("SELECT d.id, d.discipline FROM students_19.term_discipline as td \n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where td.id_term='" + idTerm + "'\n" +
                    "and d.status = '1' ");
//            ResultSet rs = stmt.executeQuery("SELECT d.id, d.discipline FROM term_discipline as td" + //as - маска, для того, чтобы сократить название заменяем с помощью фы
//                    "left join discipline as d on td.id_discipline = d.id\n" +// join - присоединение таблицы discipline к таблице term_discipline к колонке id_discipline
//                    "where td.id_term =  '" + idTerm + "'" + // где id_term равно выбранному в браузере семестру
//                    "and d.status = '1'");// выводит только активные дисциплины в выбранном семестре
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

//    TERMS
    public static ArrayList<Term> getAllActiveTerms() {
        ArrayList<Term> terms = new ArrayList<Term>();
        try {
            ResultSet rs = Constants.DB.executeQuery("select * from `term` where `status`='1'");
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

    public static Term getTermByID(String id) {
        try {
            ResultSet rs = Constants.DB.executeQuery("select * from `term` where `status`='1' and `id` = '" + id + "'");
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

//    public static void createNewTerm(String name, String duration) {
//        try {
//            Constants.DB.execute("INSERT INTO `term` (`name`, `duration`) VALUES ('" + name + "', '" + duration + "');");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    public static void createTerm(String duration, String[] disciplines) {

        try {
            ResultSet rs = Constants.DB.executeQuery("SELECT id,  term FROM students_19.terms ORDER BY ID DESC limit 1");
            String currentTerm = null;
            int idTerm = 0;
            while (rs.next()) {
                currentTerm = rs.getString("term");
                idTerm = rs.getInt("id");
            }
            int termNumber = 0;
            termNumber = Integer.parseInt(currentTerm.substring(8));
            String term = "Семестр " + (++termNumber);
            Constants.DB.execute("INSERT INTO `students_19`.`terms` (`term`, `duration`) VALUES ('" + term + "','" + duration + "')");

            int newId = ++idTerm;
            for (String discipline : disciplines) {
                ResultSet rs1 = Constants.DB.executeQuery("SELECT id FROM students_19.disciplines\n" +
                        "where discipline ='" + discipline + "'");
                int idDiscipline = 0;
                while (rs1.next()) {
                    idDiscipline = rs1.getInt("id");
                }
                Constants.DB.execute("INSERT INTO `students_19`.`terms_disciplines` (`term_id`, `discipline_id`) VALUES ('" + newId + "','" + idDiscipline + "')");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void deleteTerm(String idTermDelete) {
        try {
            Constants.DB.execute("UPDATE `students_19`.`terms` SET `status` = '0' WHERE (`id` = '" + idTermDelete + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static String getDisciplineName(String id) {
        String name = null;
        try {
            ResultSet rs = Constants.DB.executeQuery("select discipline from students_19.discipline where id =" + id + "");
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
            ResultSet rs = Constants.DB.executeQuery("SELECT * FROM students_19.term where id = " + idTerm);

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
            Constants.DB.execute("DELETE FROM `students_19`.`term_discipline` WHERE (`id_term` = '" + id + "')");
            if (modifiedDisciplinesId != null) {
                for (String newDisciplineId : modifiedDisciplinesId) {
                    Constants.DB.execute("INSERT INTO `students_19`.`term_discipline` (`id_term`, `id_discipline`) VALUES ('" + id + "', '" + newDisciplineId + "')");
                }
            }
            Constants.DB.execute("UPDATE `students_19`.`term` SET `duration` = '" + durationResult + "' WHERE (`id` = '" + id + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // LOGIN/LOGOUT
    public static boolean isVerifiedUser(String login, String password, String role) {
        try {
            ResultSet rs = Constants.DB.executeQuery("SELECT * FROM students_19.user_role as us\n" +
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


    public static LinkedHashMap<Discipline, String> getDisciplinesAndMarkByTerm(String id, String termId) {
        LinkedHashMap<Discipline, String> disciplinesAndMark = new LinkedHashMap<>();
        try {
            ResultSet rs = Constants.DB.executeQuery("select discipline.id, discipline.discipline , mark.mark  from students_control.marks\n" +
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


