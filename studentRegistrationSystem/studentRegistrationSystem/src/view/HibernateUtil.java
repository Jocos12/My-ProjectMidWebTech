package view;


import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import controller.DefCourse;
import controller.Course;

import controller.Student;
import controller.StudentRegistration;
import controller.Teacher;


public class HibernateUtil {
	
	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSession() {
	    if (sessionFactory == null) {
	        try {
	            Configuration configuration = new Configuration();

	            // Hibernate settings equivalent to hibernate.cfg.xml's properties
	            Properties settings = new Properties();
	            settings.put("hibernate.connection.driver_class", "com.mysql.cj.jdbc.Driver");
	            settings.put("hibernate.connection.url", "jdbc:mysql://localhost:3306/Registra?createDatabaseIfNotExist=true"); // Specify your MySQL database URL
	            settings.put("hibernate.connection.username", "root"); 
	            settings.put("hibernate.connection.password", ""); 
	            settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect"); // MySQL Dialect

	            settings.put(Environment.SHOW_SQL, "true");

	            settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

	            settings.put(Environment.HBM2DDL_AUTO, "update");

	            // This helps put all properties into our configuration
	            configuration.setProperties(settings);
	            configuration.addAnnotatedClass(Student.class);
	            configuration.addAnnotatedClass(Course.class);
	            configuration.addAnnotatedClass(DefCourse.class);
	            configuration.addAnnotatedClass(Teacher.class);
	  
	            configuration.addAnnotatedClass(StudentRegistration.class);
	            
	            
	            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
	                .applySettings(configuration.getProperties())
	                .build();

	            System.out.println("Hibernate Java Config serviceRegistry created JOE");
	            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	            return sessionFactory;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return sessionFactory;
	}
}
