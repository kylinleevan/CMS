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
	private int []aId;                           //1.键序号
	private String []stdName;                    //2.研究生姓名
	private String []aName;                      //3.论文姓名
	private String []tutorName;                  //4.导师姓名
	private String []winYear;                    //5.获奖年份
	private String []awards;                     //6.所获奖项
	private String []publisher;                  //7.上传人
	private String []publishTime;                //8.上传时间
	/*****************************************************************/
	
	private int articleNumber;                     //结果集中记录的数目
	private DBBean DB=new DBBean();              //连接数据库
	private ResultSet rs;                        //结果集 
	private String sql;
	
	/*****************************************************************/
	/*****************************************************************/
	public int getaId(int i) {	
		return aId[i];
	}
	public void setaId(int aId,int i) {
		this.aId[i] = aId;
	}

	public String getStdName(int i) {
		return stdName[i];
	}
	public void setStdName(String stdName,int i) {
		this.stdName[i] = stdName;
	}
	public String getaName(int i) {
		return aName[i];
	}
	public void setaName(String aName,int i) {
		this.aName[i] = aName;
	}
	public String getTutorName(int i) {
		return tutorName[i];
	}
	public void setTutorName(String tutorName,int i) {
		this.tutorName[i] = tutorName;
	}
	public String getWinYear(int i) {
		return winYear[i];
	}
	public void setWinYear(String winYear,int i) {
		this.winYear[i] = winYear;
	}
	public String getAwards(int i) {
		return awards[i];
	}
	public void setAwards(String awards,int i) {
		this.awards[i] = awards;
	}
	public String getPublisher(int i) {
		return publisher[i];
	}
	public void setPublisher(String publisher,int i) {
		this.publisher[i] = publisher;
	}
	public String getPublishTime(int i) {
		return publishTime[i];
	}
	public void setPublishTime(String publishTime,int i) {
		this.publishTime[i] = publishTime;
	}

	/********************************************************************/
	public int getArticleNumber() {
		return articleNumber;
	}
	public void setArticleNumber(int articleNumber) {
		this.articleNumber = articleNumber;
	}
	/**********************************************************************/
	/**********************************************************************/
	/**
	 * 构造函数
	 */
	public articleBean(){}
	/**
	 * 初始化JavaBean数组
	 * @param user
	 */
	public boolean init(String user){
		sql="select *from info_article,info_article_awards where publisher='"+user+"' "+ 
				"and info_article.a_id=info_article_awards.a_id";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				articleNumber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(articleNumber!=0){
			//初始化JavaBean数组
			aId=new int[articleNumber];                        //1.保存键序号
			stdName=new String[articleNumber];                 //2.保存研究生姓名
			aName=new String[articleNumber];                   //3.保存论文姓名
			tutorName=new String[articleNumber];               //4.保存导师姓名
			winYear=new String[articleNumber];                 //5.保存获奖年份
			awards=new String[articleNumber];                  //6.保存所获奖项
			publisher=new String[articleNumber];               //7.保存上传人
			publishTime=new String[articleNumber];             //8.保存上传时间
			return true;
		}
		else
			return false;
	}
	/**
	 * 
	 * @param user
	 */
	public void query(String user,boolean sign){
		if(sign){
			rs=DB.query(sql);
			int i=0;
			try {
				while(rs.next()){
					//保存各属性
					setaId(rs.getInt("info_article.a_id"), i);
					setStdName(rs.getString("std_name"), i);
					setaName(rs.getString("a_name"), i);
					setTutorName(rs.getString("tutor_name"), i);
					setWinYear(rs.getString("win_year"), i);
					setAwards(rs.getString("awards"), i);
					setPublisher(rs.getString("publisher"), i);
					setPublishTime(rs.getString("pub_date"), i);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

