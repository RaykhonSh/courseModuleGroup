package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Course;

import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public class CourseRepo extends BaseRepo<Course> {
//    public static List<Course>  getAllCourses() {
//        try(EntityManager em = emf.createEntityManager()) {
//            return em.createQuery("from Course", Course.class).getResultList();
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }

    public static Course getById(int courseId) {
        try(EntityManager em = emf.createEntityManager()) {
            return em.find(Course.class,courseId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
