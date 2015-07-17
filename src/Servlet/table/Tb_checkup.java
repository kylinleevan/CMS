package Servlet.table;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.DBBean;

public class Tb_checkup extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Tb_checkup() {
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
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		
		DBBean co = new DBBean();
		String c_name = new String (request.getParameter("c_name").getBytes("ISO-8859-1"),"utf-8");
		String c_date_1 = new String (request.getParameter("c_date_1").getBytes("ISO-8859-1"),"utf-8");
		String c_date_2 = new String (request.getParameter("c_date_2").getBytes("ISO-8859-1"),"utf-8");
		String c_date_3 = new String (request.getParameter("c_date_3").getBytes("ISO-8859-1"),"utf-8");
		String c_date = c_date_1 + "-" + c_date_2 + "-" + c_date_3;
		String c_dep = new String (request.getParameter("c_dep").getBytes("ISO-8859-1"),"utf-8");
		String c_advise = new String (request.getParameter("c_advise").getBytes("ISO-8859-1"),"utf-8");
		String c_person = new String (request.getParameter("c_person").getBytes("ISO-8859-1"),"utf-8");
		String sql = "insert into info_checkup(c_name,c_date,c_dep,c_advise,c_person,publisher,pub_date) values ('"+c_name+"','"+c_date+"','"+c_dep+"','"+c_advise+"','"+c_person+"','"+userID+"','2013-01-01')";
		try
		{
			co.update(sql);
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"添加成功!\");" + " window.location.href=\"./JSP/TABLE/tb_checkup.jsp\";</script> ");
		} catch (Exception e)
		{
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"添加失败!  请重试！\");" + " window.location.href=\"./JSP/TABLE/tb_checkup.jsp\";</script> ");
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
