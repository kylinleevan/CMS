package Servlet.room;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JavaBean.DBBean;

public class Saveroom extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Saveroom() {
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
		String user_ID = new String (request.getParameter("userid").getBytes("ISO-8859-1"),"utf-8");
		String room_id = new String (request.getParameter("room").getBytes("ISO-8859-1"),"utf-8");
		String order_date = new String (request.getParameter("date").getBytes("ISO-8859-1"),"utf-8");
		String order_time = new String (request.getParameter("ordertime").getBytes("ISO-8859-1"),"utf-8");
		String reason = new String (request.getParameter("reason").getBytes("ISO-8859-1"),"utf-8");
		String college = new String (request.getParameter("college").getBytes("ISO-8859-1"),"utf-8");
		String sql = "insert into tb_order(b_id,user_id,order_date,order_time,reason,college,approved,state) "
			+"values('"+room_id+"','"+user_ID+"','"+order_date+"',"+order_time+",'"+reason+"','"+college+"',0,1)";
		try
		{
			co.update(sql);
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"预约成功！\");" + " window.location.href=\"./index.jsp\";</script> ");
		} catch (Exception e)
		{
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"预约失败！请重试！\");" + " window.location.href=\"./JSP/ROOM/boardroom.jsp\";</script> ");
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
