package uz.pdp.demo10.tables;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Payme {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer amount;
    @ManyToOne
    private Student student;

    public Payme( Integer amount, Student student) {
        this.amount = amount;
        this.student = student;
    }
}
