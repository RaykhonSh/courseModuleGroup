package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Payme;
import uz.pdp.demo10.tables.Student;

import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public class PaymentRepo {
    public static List<Payme> getPaymentList() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("from Payme ",Payme.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Integer getTotalPaymentByStudentId(Integer studentId) {
        try (EntityManager em = emf.createEntityManager()) {
            Long totalPayment = (Long) em.createNativeQuery(
                            "SELECT COALESCE(SUM(amount), 0) FROM payme WHERE student_id = ?")
                    .setParameter(1, studentId)
                    .getSingleResult();

            // Long qiymatini int ga o'zgartirish
            return totalPayment != null ? totalPayment.intValue() : 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
