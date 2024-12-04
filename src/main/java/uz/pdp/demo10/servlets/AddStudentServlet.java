package uz.pdp.demo10.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Groups;
import uz.pdp.demo10.tables.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo10.MyListener.emf;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(
                EntityManager entityManager = emf.createEntityManager();
        ) {
            int groupId = Integer.parseInt(req.getParameter("groupId"));
            String name = req.getParameter("studentName");
            entityManager.getTransaction().begin();
            Groups groups = entityManager.find(Groups.class, groupId);
            entityManager.persist(new Student(name, groups));
            entityManager.getTransaction().commit();
            resp.sendRedirect("/students.jsp?groupId=" + groupId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
