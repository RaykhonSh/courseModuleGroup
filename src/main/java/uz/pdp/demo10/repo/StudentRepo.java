package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import uz.pdp.demo10.tables.Student;

import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public class StudentRepo {

    public static List<Student> getStudentList(int pagejon, String search, int groupId) {
        pagejon--;
        try (EntityManager entityManager = emf.createEntityManager()) {

            Query fromToDo = entityManager.createNativeQuery("select * from student s  where s.name ilike '%'||:search ||'%' and s.groups_id = :groupId limit 10 offset :off", Student.class).
                    setParameter("off", pagejon*10).
                    setParameter("groupId", groupId).
                    setParameter("search", search);
            return fromToDo.getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Long count(String search) {

        try(
                EntityManager entityManager = emf.createEntityManager();
        ){
            Query fromToDo = entityManager.createNativeQuery("select count(*) from student s where s.name ilike '%'||:search||'%'", Long.class).setParameter("search",search);

            return (Long) fromToDo.getSingleResult();

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
