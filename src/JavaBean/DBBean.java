package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBBean {
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	private String url="jdbc:mysql://localhost:3306/cms?useUnicode=true&characterEncoding=utf8";
	private String user="root";
	private String pwd="root";
	private boolean logined=false;
	
	public void setLogined(boolean l){logined=l;}
	public boolean isLogined(){return logined;}
	
	public DBBean()
	{
		addDriver();  //加载数据库驱动
		getConn();
	}
	public void addDriver()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 建立连接
	 * @param url
	 * @param user
	 * @param pwd
	 * @return
	 */
	public void getConn()
	{
		try {    
			conn=DriverManager.getConnection(url,user,pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 返回查询结果集
	 * @param sql
	 * @return
	 */
	public ResultSet query(String sql)
	{
		try 
		{
			st=conn.createStatement();
			rs=st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * 返回更新结果集
	 * @param sql
	 * @return
	 */
	public int update(String sql){
		int rs=0;
		try 
		{
			st=conn.createStatement();
			rs=st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public void closeDB()
	{
		try {
			if(rs!=null){
				rs.close();
			}
			if(st!=null){
				st.close();
			}
			if(conn!=null){
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("不能关闭数据库！");
			e.printStackTrace();
		}
	}
}
