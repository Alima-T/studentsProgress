package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

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
    private boolean selected = false;

}


