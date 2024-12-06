package uz.pdp.demo10.tables;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.demo10.repo.BaseEntity;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Course extends BaseEntity {

    private String name;


}
