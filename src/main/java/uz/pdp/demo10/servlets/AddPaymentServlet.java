package uz.pdp.demo10.servlets;

import jakarta.persistence.EntityManager;
import uz.pdp.demo10.tables.Groups;
import uz.pdp.demo10.tables.Module;
import uz.pdp.demo10.tables.Payme;
import uz.pdp.demo10.tables.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.demo10.MyListener.emf;

@WebServlet("/addPayment")
public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(
                EntityManager entityManager = emf.createEntityManager();
        ) {
            int studentId= Integer.parseInt(req.getParameter("studentId"));
            int payAmount= Integer.parseInt(req.getParameter("payAmount"));
            entityManager.getTransaction().begin();
            Student student = entityManager.find(Student.class, studentId);
            entityManager.persist(new Payme(payAmount,student));
            entityManager.getTransaction().commit();
            resp.sendRedirect("students.jsp?groupId="+student.getGroups().getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
