package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Term {
    private int id;
    private int idTerm;
    private String name;
    private String duration;
    private int status = 1;
    private ArrayList<Discipline> disciplines = new ArrayList<Discipline>();


    @Override
    public String toString() {
        return "Term{" +
                "id=" + id +
                "id_term=" + idTerm +
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
        return Objects.hash(id, idTerm, name, duration, status, disciplines);
    }
}
