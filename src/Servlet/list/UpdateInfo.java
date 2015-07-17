package Servlet.list;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.DBBean;

public class UpdateInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateInfo() {
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
		
		/*
		
		//�������ݱ�ļ���������ı�ʶ
		int key=Integer.parseInt(new String (request.getParameter("key").getBytes("ISO-8859-1"),"utf-8"));
		int flag=Integer.parseInt(new String (request.getParameter("flag").getBytes("ISO-8859-1"),"utf-8"));
		out.println(request.getParameter("key"));
		out.print(request.getParameter("flag"));
		//sql���
		String sql;

		DBBean DB=new DBBean();
		//ִ�и���
		try{
			//�ж�ִ��ɾ����һ������еļ�¼
			switch (flag) {
			case 0:
				sql="delete from info_re_poj where ="+key;break;
			case 1:
				sql="delete from info_train where ="+key;break;
			case 2:
				sql="delete from info_article where ="+key;break;
			case 3:
				sql="delete from info_support where ="+key;break;
			case 4:
				sql="delete from info_groupBuild where ="+key;break;
			case 5:
				sql="delete from info_book where ="+key;break;
			case 6:
				sql="delete from info_ipr where ="+key;break;
			case 7:
				sql="delete from info_checkup where ="+key;break;
			case 8:
				sql="delete from info_meeting where ="+key;break;
			case 9:
				sql="delete from info_foreign where ="+key;break;
			default:sql="";break;
			}
			DB.update(sql);
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"�ɹ�ɾ����¼! \");" + " window.location.href=\"../../CMS/JSP/LIST/listroom.jsp \";</script> ");
		} catch (Exception e){
			response.getWriter().print("<script type=\"text/javascript\">" + "alert(\"ɾ��ʧ�ܣ������ԣ�\");" + " window.location.href=\"../../CMS/JSP/LIST/listroom.jsp \";</script> ");
		}*/
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
