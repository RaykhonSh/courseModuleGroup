package uz.pdp.demo10.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Course;
import uz.pdp.demo10.tables.Module;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo10.MyListener.emf;

@WebServlet("/updateModule")
public class UpdateModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager em = emf.createEntityManager()) {
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            int moduleId = Integer.parseInt(req.getParameter("moduleId"));
            String name = req.getParameter("modulName");
            em.getTransaction().begin();
            Course course = em.find(Course.class, courseId);
            Module module = em.find(Module.class, moduleId);
            module.setName(name);
            module.setCourse(course);
            em.getTransaction().commit();
            resp.sendRedirect("/modules.jsp?courseId="+courseId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
