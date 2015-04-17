package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Admin;
import model.DoAdminLogin;
import model.HibernateUtil;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/Admin/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    		
    		response.setContentType("text/html");
    		PrintWriter out=response.getWriter();
    		
    		String email=request.getParameter("email");
    		String password=request.getParameter("password");
    		if(DoAdminLogin.isValid(email, password))
    		{
    			RequestDispatcher dispatcher=request.getRequestDispatcher("AdminHome.jsp");
    			dispatcher.forward(request, response);
    		}
    		else 
    		{
    			out.print("Invalid user");
    		}
    		
	}

}
