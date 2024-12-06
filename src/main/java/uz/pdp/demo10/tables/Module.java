package uz.pdp.demo10.tables;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.demo10.repo.BaseEntity;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Module extends BaseEntity {

    private String name;

    @ManyToOne
    private Course course;

    
}
