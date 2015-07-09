package Servlet.index;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import JavaBean.DBBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Login() {
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
		String user_ID = new String (request.getParameter("userID").getBytes("ISO-8859-1"),"utf-8");
		String pwd = new String (request.getParameter("userPwd").getBytes("ISO-8859-1"),"utf-8");
		String sql = "select * from tb_user where user_id='"+user_ID+"' and password='"+pwd+"'";
		
		
		HttpSession session = request.getSession();
		
		if (co.isLogined()){
			response.sendRedirect("./index.jsp");
		}else{
			ResultSet rs = co.query(sql);
			try {
				if (rs.next()){
					co.setLogined(true);
					session.setAttribute("isLogined", "true");
					response.sendRedirect("./index.jsp");
				}else{
					co.setLogined(false);
					session.setAttribute("isLogined", "false");				
					response.sendRedirect("./JSP/HEAD/login.jsp?password=false");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
		}
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
