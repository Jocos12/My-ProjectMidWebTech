package model;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import controller.DefCourse;
import view.HibernateUtil;
import java.util.List;
public class AcademicUnitDAO {
    private SessionFactory sessionFactory;

    public AcademicUnitDAO() {
        this.sessionFactory = HibernateUtil.getSession();
    }

    public void saveAcademicUnit(DefCourse academicUnit) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(academicUnit);
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
    
    
    public void deleteAcademicUnit(String code) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            DefCourse academicUnit = session.get(DefCourse.class, code);

            if (academicUnit != null) {
                session.delete(academicUnit);
            }

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

    public void updateAcademicUnit(DefCourse updatedAcademicUnit) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            DefCourse existingAcademicUnit = session.get(DefCourse.class, updatedAcademicUnit.getCode());

            if (existingAcademicUnit != null) {
                existingAcademicUnit.setAcademicName(updatedAcademicUnit.getAcademicName());
                existingAcademicUnit.setAcademicType(updatedAcademicUnit.getAcademicType());
                existingAcademicUnit.setUnit(updatedAcademicUnit.getUnit());
                existingAcademicUnit.setProgram(updatedAcademicUnit.getProgram());

                session.update(existingAcademicUnit);
            }

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
    
    
    public List<DefCourse> getAllAcademicUnits() {
        // Implement the logic to retrieve all academic units from your database
        Session session = sessionFactory.openSession();
        List<DefCourse> academicUnits = session.createQuery("FROM DefCourse").list();
        session.close();

        return academicUnits;
    }
}

    

