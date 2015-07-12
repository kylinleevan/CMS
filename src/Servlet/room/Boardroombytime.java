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

public class Boardroombytime extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Boardroombytime() {
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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
//		response.sendRedirect("./JSP/ROOM/boardroombytime.jsp");
		DBBean db = new DBBean();
		String date = new String (request.getParameter("date").getBytes("ISO-8859-1"),"utf-8");
		String time = new String (request.getParameter("time").getBytes("ISO-8859-1"),"utf-8");
		String sql = "select * from tb_order where order_date='"+date+"' and order_time='"+time+"'";
		
		String sql1 = "select b_address from tb_boardroom where b_address not in(select b_id from tb_order where order_date='"+date+"' and order_time='"+time+"')";
		
		ResultSet rs1 = db.query(sql1);
		
        boolean b=true;
        HttpSession session = request.getSession();
        int i=1;
        
		try {
			while(rs1.next())
			{
				request.setAttribute("room"+i,rs1.getString("b_address")); 
				i++;
			}
			
			request.setAttribute("date",date); 
			request.setAttribute("time",time); 
			request.setAttribute("length",i-1); 
			request.getRequestDispatcher( "./JSP/ROOM/boardroombytime.jsp").forward(request,response); 
		//	response.sendRedirect("./JSP/ROOM/boardroombytime.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		out.flush();
		out.close();
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
