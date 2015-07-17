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
		String sql;
		DBBean DB=new DBBean();
		//执行删除
		try{
			//判断执行删除哪一个表格中的记录
			switch (flag) {
			case 0:
				sql="delete from info_re_poj where r_id="+key;break;
			case 1:
				sql="delete from info_train where year="+key;break;
			case 2:
				sql="delete from info_article where a_id="+key;break;
			case 3:
				sql="delete from info_support where s_id="+key;break;
			case 4:
				sql="delete from info_groupBuild where g_id="+key;break;
			case 5:
				sql="delete from info_book where b_id="+key;break;
			case 6:
				sql="delete from info_ipr where ipr_id="+key;break;
			case 7:
				sql="delete from info_checkup where c_id="+key;break;
			case 8:
				sql="delete from info_meeting where m_id="+key;break;
			case 9:
				sql="delete from info_foreign where f_id="+key;break;
			default:sql="";break;
			}
			int rs=DB.update(sql);
			if(rs!=0){
				response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"成功删除"+rs+"条记录! \");" + " window.location.href=\"../../CMS/JSP/LIST/listinfo.jsp \";</script> ");
			}
		} catch (Exception e){
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"删除失败，请重试！\");" + " window.location.href=\"../../CMS/JSP/LIST/listinfo.jsp \";</script> ");
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
