package model;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DoAdminLogin {
	
	public static boolean isValid(String email, String password)
	{
		SessionFactory factory=HibernateUtil.getSessionFactory();
		Session session=factory.openSession();
		Transaction transaction=session.beginTransaction();
		
		Query query=session.createQuery("from Admin where id="+2);
				
		List<Admin> list=query.list();
		Iterator<Admin> itr=list.iterator();
		transaction.commit();
		while(itr.hasNext())
		{
			Admin admin=itr.next();
			System.out.println(admin.getEmail()+" "+admin.getPassword());
			if((admin.getEmail()).equals(email))
			{
				if((admin.getPassword()).equals(password))
				{
				return true;
				}
				else
					return false;
			}
			else
				return false;
		}
		
		return false;
		
	}
}
