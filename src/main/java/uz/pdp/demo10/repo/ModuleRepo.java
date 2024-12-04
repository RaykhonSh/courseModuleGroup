package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Course;
import uz.pdp.demo10.tables.Module;

import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public class ModuleRepo {
    public static List<Module> getModules() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("from Module ",Module.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public static Module getById(int moduleId) {
        try (EntityManager entityManager = emf.createEntityManager()) {
            return entityManager.find(Module.class,moduleId);
            }
         catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
