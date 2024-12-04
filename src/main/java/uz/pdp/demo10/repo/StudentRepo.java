package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Module;
import uz.pdp.demo10.tables.Student;

import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public class StudentRepo {

    public static List<Student> getStudentList() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("from Student ", Student.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
