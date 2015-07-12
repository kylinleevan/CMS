package Servlet.index;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import JavaBean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Register() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		DBBean co = new DBBean();
		String user_ID = new String (request.getParameter("newID").getBytes("ISO-8859-1"),"utf-8");
		String user_Name = new String (request.getParameter("newName").getBytes("ISO-8859-1"),"utf-8");
		String pwd = new String (request.getParameter("newPwd").getBytes("ISO-8859-1"),"utf-8");
		String sql = "insert into tb_user(user_id,user_name,password) values ('"+user_ID+"','"+user_Name+"','"+pwd+"')";
		try
		{
			co.update(sql);
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"◊¢≤·≥…π¶!  «Î¿Œº«√‹¬Î!\");" + " window.location.href=\"./JSP/HEAD/login.jsp\";</script> ");
		} catch (Exception e)
		{
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"◊¢≤· ß∞‹!  ¥Àπ§∫≈“—¥Ê‘⁄£°\");" + " window.location.href=\"./JSP/HEAD/register.jsp\";</script> ");
		}//response.sendRedirect("./JSP/HEAD/login.jsp");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
