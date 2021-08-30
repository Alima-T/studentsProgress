package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Discipline {
    private int id;
    private String discipline;
    private int status=1;
    private boolean selected = false;

    @Override
    public String toString() {
        return "Discipline{" +
                "id=" + id +
                ", discipline='" + discipline + '\'' +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Discipline that = (Discipline) o;
        return id == that.id && status == that.status && Objects.equals(discipline, that.discipline);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, discipline, status);
    }
}
