package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mark {

    private int id;
    private Student student;
    private Term term;
    private Discipline discipline;
    private int mark;


    @Override
    public String toString() {
        return "Mark{" +
                "id=" + id +
                ", student=" + student +
                ", term=" + term +
                ", discipline=" + discipline +
                ", mark=" + mark +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Mark mark1 = (Mark) o;
        return id == mark1.id && mark == mark1.mark && Objects.equals(student, mark1.student) && Objects.equals(term, mark1.term) && Objects.equals(discipline, mark1.discipline);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, student, term, discipline, mark);
    }
}
