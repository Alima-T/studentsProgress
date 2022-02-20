package database;

import entity.Discipline;
import entity.Student;
import entity.Term;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static constants.Constants.DB;

public interface IDBService {
    static ArrayList<Student> getAllActiveStudents() {
        return null;
    }
//    Student getStudentByID(String id);
//
//    Student getStudent(String id);
//
//    void createNewStudent(String lastname, String name, String group, String date);
//
//    void deleteStudents(String id);
//
//    void modifyStudent(String id, String lastname, String name, String group, String date);
//
//    //    DISCIPLINES
//    ArrayList<Discipline> getAllActiveDisciplines();
//
//    Discipline getDisciplineByID(String id);
//
//    void createNewDiscipline(String disc);
//
//    void deleteDiscipline(String id);
//
//    ArrayList<Discipline> getAllActiveDisciplinesByTerm(int idTerm);
//
//    //    TERMS
//    ArrayList<Term> getAllActiveTerms();
//
//    Term getTermByID(String id);
//    void createNewTerm(String duration, ArrayList <Discipline> disciplines);
//
//    void deleteTerm(String id);
//    Term getTermById(String idTerm);
//
//    void modifyTerm(String id, String modifiedDuration, String[] modifiedDisciplinesId);
//
//    // LOGIN/LOGOUT
//    boolean isVerifiedUser(String login, String password, String role);
//
//    LinkedHashMap<Discipline, String> getDisciplinesAndMarkByTerm(String id, String termId);

}
