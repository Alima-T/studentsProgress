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


}
