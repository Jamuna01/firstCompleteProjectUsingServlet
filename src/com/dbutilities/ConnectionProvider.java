package com.dbutilities;

import java.sql.Connection;
import java.sql.DriverManager;

import com.dao.UserDao;
import com.entities.User;

import java.sql.*;
public class ConnectionProvider 
{
	private static Connection con = null;
	
	public static Connection getConnection()
	{
		try
		{
			if(con == null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infoproject","root", "toor");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	public static void main(String[] args) 
	{
		getConnection();
		System.out.println("connected!");
		UserDao ud = new UserDao();
		User us = new User();
		ud.saveUser(us);
		
	}
}
