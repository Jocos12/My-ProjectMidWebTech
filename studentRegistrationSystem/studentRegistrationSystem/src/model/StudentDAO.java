package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import controller.Student;
import view.HibernateUtil;

public class StudentDAO {
    private SessionFactory sessionFactory;

    public StudentDAO() {
        this.sessionFactory = HibernateUtil.getSession();
    }

    public void saveStudent(Student student) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(student);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public boolean validateStudent(int studentId, String password) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Perform a query to check if a student with the given studentId and password exists
            String hql = "FROM Student WHERE studentId = :studentId AND password = :password";
            Query<Student> query = session.createQuery(hql);
            query.setParameter("studentId", studentId);
            query.setParameter("password", password);

            Student student = query.uniqueResult();

            tx.commit();

            return student != null;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return false; // Return false on error
        } finally {
            session.close();
        }
    }
}
