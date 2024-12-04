package uz.pdp.demo10.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Groups;
import uz.pdp.demo10.tables.Module;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo10.MyListener.emf;

@WebServlet("/addGroup")
public class AddGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(
                EntityManager entityManager = emf.createEntityManager();
                ) {
            int moduleId = Integer.parseInt(req.getParameter("moduleId"));
            String name = req.getParameter("groupName");
            entityManager.getTransaction().begin();
            Module module = entityManager.find(Module.class, moduleId);
            entityManager.persist(new Groups(name,module));
            entityManager.getTransaction().commit();
            resp.sendRedirect("groups.jsp?moduleId="+moduleId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
