package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import model.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Servlet implementation class UpadetCategory
 */
@WebServlet("/Admin/UpadetCategory")
public class UpadetCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpadetCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher=request.getRequestDispatcher("ManageCategory.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	        Session session = sessionFactory.openSession();
	        Transaction tx = session.beginTransaction();
	        //Category category = (Category) session.load(Category.class, new Long(101));
	        Query qry = session.createQuery("update Category c set c.name=?, c.status=?, c.Description=? "
	        		+ "where c.CategoryId ="+request.getParameter("category_id"));
	        
	        qry.setParameter(0, request.getParameter("category_name"));
	        
	        
	        String status=request.getParameter("status");
			if(status.equals("publish"))
				qry.setParameter(1, 1);
			else
				qry.setParameter(1, 0);;
	        	        
	        qry.setParameter(2, request.getParameter("desc"));
	        
	        qry.executeUpdate();        
	        tx.commit();
			session.close();
	        doGet(request, response);
		
	}

}
