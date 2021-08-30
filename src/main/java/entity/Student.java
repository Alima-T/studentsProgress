package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private int id;
    private String lastname;
    private String name;
    private Integer id_group;
    private Date date;
    private int status = 1;

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", lastname='" + lastname + '\'' +
                ", name='" + name + '\'' +
                ", group=" + id_group +
                ", date=" + date +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return id == student.id && status == student.status && Objects.equals(lastname, student.lastname) && Objects.equals(name, student.name) && Objects.equals(id_group, student.id_group) && Objects.equals(date, student.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, lastname, name, id_group, date, status);
    }
}
