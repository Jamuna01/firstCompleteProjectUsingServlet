package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.dbutilities.Helper;
import com.entities.Message;
import com.entities.User;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//Fetch all data
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		//get the user from the session...
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		user.setProfile(imageName);
		
		//update database....
		UserDao ud = new UserDao();
		boolean ans = ud.updateUser(user);
		PrintWriter out = response.getWriter();
		if(ans)
		{			
			//String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			String path = "C:/Users/jamun/OneDrive/Desktop/images/jamuna.png";
			Helper.deleteFile(path); 
			
				if(Helper.saveFile(part.getInputStream(), path))
				{
					//out.println("Profile updated..");
					Message msg = new Message("Profile updated...","success","alert-success");
					s.setAttribute("msg", msg);
				}	
			}
		else
		{
			Message msg = new Message("Something went wrong...","error","alert-danger");
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile_page.jsp");
		}
		
	

}
