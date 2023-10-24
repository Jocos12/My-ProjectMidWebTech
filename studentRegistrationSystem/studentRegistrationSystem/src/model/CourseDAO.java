package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import controller.Course;
import view.HibernateUtil;
import java.util.List;

public class CourseDAO {
    private SessionFactory sessionFactory;

    public CourseDAO() {
        this.sessionFactory = HibernateUtil.getSession();
    }

    public void saveCourse(Course course) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(course);
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
    
    public List<Course> getAllCourses() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Course";
            Query<Course> query = session.createQuery(hql, Course.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void updateCourse(Course course) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(course);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCourseByCode(String code) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            Course course = session.get(Course.class, code);
            if (course != null) {
                session.delete(course);
            }
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
