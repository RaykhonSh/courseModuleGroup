package uz.pdp.demo10.repo;

import jakarta.persistence.EntityManager;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import static uz.pdp.demo10.MyListener.emf;

public  class BaseRepo<T> {
    private final Class<T> persistentClass;

    public BaseRepo(){
        Class<T>  clazz=(Class<T>)((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.persistentClass=clazz;
    }
    public void save(T entity) {
        try (
                EntityManager entityManager = emf.createEntityManager();
        ){
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<T> findAll(){
        try (
                EntityManager entityManager = emf.createEntityManager();
        ){
            return entityManager.createQuery("from %s".formatted(persistentClass.getSimpleName()),persistentClass).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
