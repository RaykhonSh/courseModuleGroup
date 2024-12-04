package uz.pdp.demo10.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo10.MyListener.emf;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(EntityManager em = emf.createEntityManager()) {
            String name = req.getParameter("name");
            em.getTransaction().begin();
            em.persist(new Course(name));
            em.getTransaction().commit();
            resp.sendRedirect("/course.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
