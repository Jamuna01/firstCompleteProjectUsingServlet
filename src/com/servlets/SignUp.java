package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.entities.User;

/**
 * Servlet implementation class SignUp
 */
@MultipartConfig
@WebServlet(name = "signup", urlPatterns = { "/signup" })
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		
		
//		if(ud.saveUser(us))
//		{
//			response.sendRedirect("index.jsp");
//		}
//		else
//		{
//			response.sendRedirect("login_jsp.jsp");
//		}
		String checkbox = request.getParameter("user_checkbox");
		
		//out.println(checkbox);
		
		if(checkbox == null)
		{
			out.println("Please check the terms and conditions");
		}
		else
		{
			String username = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String pass = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			User us = new User(username, email, pass, gender, about);
			UserDao ud = new UserDao();
			if(ud.saveUser(us))
			{
				out.println("done");
			}
			else
			{
				out.println("error");
				
				
			}
		}
		
	}

}
