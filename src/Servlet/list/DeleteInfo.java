package Servlet.list;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.DBBean;

public class DeleteInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteInfo() {
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
		//接收数据表的键参数及表的标识
		int key=Integer.parseInt(request.getParameter("key"));
		int flag=Integer.parseInt(request.getParameter("flag"));
		//sql语句
		String sql0="delete from info_re_poj where ="+key;
		String sql1="delete from info_train where ="+key;
		String sql2="delete from info_article where ="+key;
		String sql3="delete from info_support where ="+key;
		String sql4="delete from info_groupBuild where ="+key;
		String sql5="delete from info_book where ="+key;
		String sql6="delete from info_ipr where ="+key;
		String sql7="delete from info_checkup where ="+key;
		String sql8="delete from info_meeting where ="+key;
		String sql9="delete from info_foreign where ="+key;
		DBBean DB=new DBBean();
		//执行删除
		try{
			switch (flag) {
			case 0:
				DB.update(sql0);
				break;
			case 1:
				DB.update(sql1);
				break;
			case 2:
				DB.update(sql2);
				break;
			case 3:
				DB.update(sql3);
				break;
			case 4:
				DB.update(sql4);
				break;
			case 5:
				DB.update(sql5);
				break;
			case 6:
				DB.update(sql6);
				break;
			case 7:
				DB.update(sql7);
				break;
			case 8:
				DB.update(sql8);
				break;
			case 9:
				DB.update(sql9);
				break;
			default:
				break;
			}
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"成功删除记录! \");" + " window.location.href=\"../../CMS/JSP/LIST/listroom.jsp \";</script> ");
		} catch (Exception e){
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"删除失败，请重试！\");" + " window.location.href=\"../../CMS/JSP/LIST/listroom.jsp \";</script> ");
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
