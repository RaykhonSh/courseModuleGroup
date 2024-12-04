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

@WebServlet("/updateGroup")
public class UpdateGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = emf.createEntityManager();
                ){
            int moduleId = Integer.parseInt(req.getParameter("moduleId"));
            int groupId = Integer.parseInt(req.getParameter("groupId"));
            System.out.println("updateservlet moduleId; "+moduleId);
            System.out.println("groupId: "+groupId);
            String name = req.getParameter("groupName");
            entityManager.getTransaction().begin();
            Module module = entityManager.find(Module.class, moduleId);
            Groups groups = entityManager.find(Groups.class, groupId);
            groups.setName(name);
            groups.setModule(module);
            System.out.println(groups);
           // entityManager.persist(groups);
            entityManager.getTransaction().commit();
            resp.sendRedirect("/groups.jsp?moduleId="+moduleId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
