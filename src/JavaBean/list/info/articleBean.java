package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 研究生获优秀学位论文情况JavaBean
 * @author 小强
 *
 */

public class articleBean {
	
	private String []stdName;                    //研究生姓名
	private String []aName;                      //论文姓名
	private String []tutorName;                  //导师姓名
	private String []winYear;                    //获奖年份
	private String []awards;                     //所获奖项
	private int rsRowNumber;                     //结果集中记录的数目
	private DBBean DB=new DBBean();              //连接数据库
	private ResultSet rs;                        //结果集 
	
	public String[] getStdName() {
		return stdName;
	}
	public void setStdName(String[] stdName) {
		this.stdName = stdName;
	}
	public String[] getaName() {
		return aName;
	}
	public void setaName(String[] aName) {
		this.aName = aName;
	}
	public String[] getTutorName() {
		return tutorName;
	}
	public void setTutorName(String[] tutorName) {
		this.tutorName = tutorName;
	}
	public String[] getWinYear() {
		return winYear;
	}
	public void setWinYear(String[] winYear) {
		this.winYear = winYear;
	}
	public String[] getAwards() {
		return awards;
	}
	public void setAwards(String[] awards) {
		this.awards = awards;
	}
	
	public articleBean(){
		
	}
	/**
	 * 初始化JavaBean数组
	 * @param user
	 */
	public void init(String user){

		String sql="";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			//初始化JavaBean数组
			stdName=new String[rsRowNumber];
			aName=new String[rsRowNumber];
			tutorName=new String[rsRowNumber];
			winYear=new String[rsRowNumber];
			awards=new String[rsRowNumber];

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param user
	 */
	public void query(String user){

		String sql="";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			rs.first();        //光标指向第一行
			//初始化JavaBean数组
			stdName=new String[rsRowNumber];
			aName=new String[rsRowNumber];
			tutorName=new String[rsRowNumber];
			winYear=new String[rsRowNumber];
			awards=new String[rsRowNumber];
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

