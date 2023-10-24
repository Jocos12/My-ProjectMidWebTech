package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;
import controller.StudentRegistration;
import view.HibernateUtil;

public class RegistrationDAO {
    private SessionFactory sessionFactory;

    public RegistrationDAO() {
        this.sessionFactory = HibernateUtil.getSession();
    }

    public void saveStudentRegistration(StudentRegistration studentRegistration) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(studentRegistration);
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
    
    
    
    public List<StudentRegistration> getAllRegistrations() {
        List<StudentRegistration> registrations = null;
        Session session = sessionFactory.openSession();
        
        try {
            Query<StudentRegistration> query = session.createQuery("FROM StudentRegistration", StudentRegistration.class);
            registrations = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return registrations;
    }
}
    
    

