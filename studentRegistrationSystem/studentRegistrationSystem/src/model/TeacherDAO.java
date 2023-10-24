package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import controller.Teacher;
import view.HibernateUtil;
import java.util.List;


public class TeacherDAO {
    private SessionFactory sessionFactory;

    public TeacherDAO() {
        this.sessionFactory = HibernateUtil.getSession();
    }

    public void saveTeacher(Teacher teacher) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(teacher);
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

    public boolean validateTeacher(String name, String password) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // Perform a query to check if a teacher with the given name and password exists
            String hql = "FROM Teacher WHERE name = :name AND password = :password";
            Query<Teacher> query = session.createQuery(hql);
            query.setParameter("name", name);
            query.setParameter("password", password);

            Teacher teacher = query.uniqueResult();

            tx.commit();

            return teacher != null;
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
    
 // Add a method to get all teachers
    public List<Teacher> getAllTeachers() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Teacher"; // Use "Teacher" as the entity name
            Query<Teacher> query = session.createQuery(hql, Teacher.class); // Specify the Teacher class
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    
}



