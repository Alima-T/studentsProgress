package entity;

import java.util.ArrayList;
import java.util.Objects;

public class Term {
private int id;
private String name;
private String duration;
private int status = 1;
private ArrayList<Discipline> disciplines = new ArrayList<Discipline>();

    public Term() {
    }

    public Term(int id, String name, String duration) {
        this.id = id;
        this.name = name;
        this.duration = duration;
    }

    public void addDiscepline(Discipline discipline){
        disciplines.add(discipline);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public ArrayList<Discipline> getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(ArrayList<Discipline> disciplines) {
        this.disciplines = disciplines;
    }

    @Override
    public String toString() {
        return "Term{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", duration='" + duration + '\'' +
                ", status=" + status +
                ", disciplines=" + disciplines +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Term term = (Term) o;
        return id == term.id && status == term.status && Objects.equals(name, term.name) && Objects.equals(duration, term.duration) && Objects.equals(disciplines, term.disciplines);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, duration, status, disciplines);
    }
}
