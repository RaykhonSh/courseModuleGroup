package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Groups;

import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public class GroupRepo {
    public static List<Groups> getGroupsList() {
        try (
                EntityManager entityManager = emf.createEntityManager();
                ){
            return entityManager.createQuery("from Groups ",Groups.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Groups findById(int groupId) {
        try (
                EntityManager entityManager = emf.createEntityManager();
                ){
            return entityManager.find(Groups.class, groupId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
