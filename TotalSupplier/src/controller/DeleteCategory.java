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
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/Admin/DeleteCategory")
public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			SessionFactory factory=HibernateUtil.getSessionFactory();
			Session session=factory.openSession();
			
			String hql = "FROM Category WHERE CategoryId = "+request.getParameter("category_id");
			Query query = session.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Category> categories=query.list();
			System.out.println(categories.size());
			if(categories.size()>0)
			{
				Category category=categories.get(0);
				Transaction transaction= session.beginTransaction();
				session.delete(category);
				transaction.commit();
				session.close();
			}
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("ManageCategory.jsp");
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
