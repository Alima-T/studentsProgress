package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Discipline {
    private int id;
    private String discipline;
    private int status = 1;
    private boolean selected = false;

}
