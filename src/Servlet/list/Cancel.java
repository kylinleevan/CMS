package Servlet.list;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.DBBean;

public class Cancel extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Cancel() {
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
		
		DBBean DB=new DBBean();
		
		String userid=request.getParameter("userid").toString();
		String room=request.getParameter("room").toString();
		String date=request.getParameter("date").toString();
		int ordertime=Integer.parseInt(request.getParameter("ordertime"));
		String reason=new String (request.getParameter("reason").getBytes("ISO-8859-1"),"utf-8");
		
		//更改订单的状态
		String sql="update tb_order set state=0 and back_reason='"+reason+"' where " +
				"user_id='"+userid+"' and b_id='"+room+"' and " +
				"order_date='"+date+"' and order_time="+ordertime;
			try{
				DB.update(sql);
				response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"取消成功! \");" + " window.location.href=\"../../CMS/JSP/LIST/listroom.jsp \";</script> ");
			} catch (Exception e){
				response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"取消失败，请重试！\");" + " window.location.href=\"../../CMS/JSP/LIST/listroom.jsp \";</script> ");
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
		doGet(request, response);
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
