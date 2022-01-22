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
    private String name; // в базе нет имени, поэтому прописываем код для генерации нового имени семестр1, 2, 3 в DBManager
    private String duration;
    private int status = 1;
    private ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
}

