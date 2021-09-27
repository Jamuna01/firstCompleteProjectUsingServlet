package com.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbutilities.ConnectionProvider;
import com.entities.User;

public class UserDao 
{
	private Connection con;
	boolean status = false;
	
	public boolean saveUser(User user)
	{
		 con = ConnectionProvider.getConnection();
		try
		{
			String saveQuery = "insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(saveQuery);
//			ps.setString(1, "jamuna");
//			ps.setString(2, "jam@gmail.com");
//			ps.setString(3, "123456");
//			ps.setString(4, "female");
//			ps.setString(5, "Java Devloper");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			
			ps.executeUpdate();
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	//for login 
	public User getUserByEmailAndPassword(String username, String password)
	{
		User us = new User();
		con = ConnectionProvider.getConnection();
		try
		{
			String loginQuery = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(loginQuery);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				String name = rs.getString("name");
				us.setName(name);
				us.setId(rs.getInt("id"));
				us.setEmail(rs.getString("email"));
				String pass = rs.getString("password");
				us.setPassword(pass);
				us.setGender(rs.getString("gender"));
				us.setAbout(rs.getString("about"));
				us.setDateTime(rs.getTimestamp("rdate"));
				us.setProfile(rs.getString("profile"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return us;
	}
	public boolean updateUser(User user)
	{
		boolean status = false;
		con = ConnectionProvider.getConnection();
		try
		{
			String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.setString(6, user.getProfile());
			ps.setInt(7, user.getId());
			
			ps.executeUpdate();
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
}
