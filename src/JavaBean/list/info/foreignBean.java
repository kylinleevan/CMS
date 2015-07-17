package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 教师境外进修（合作研究）情况JavaBean
 * @author 小强
 *
 */

public class foreignBean {
	private int []fId;                              //1.键序号
	private String []fName;                         //2.姓名
	private String []orgName;                       //3.国外机构名称
	private String []fDate;                         //4.时间
	private String []content;                       //5.进修(合作)内容
	private String []publisher;                     //6.上传人
	private String []publishTime;                   //7.上传时间
	/**************************************************************/
	private int foreignNumnber;
	private DBBean DB=new DBBean();
	private ResultSet rs;
	private String sql;
	/**************************************************************/
	/**************************************************************/
	public int getfId(int i) {
		return fId[i];
	}
	public void setfId(int fId,int i) {
		this.fId[i] = fId;
	}
	public String getfName(int i) {
		return fName[i];
	}
	public void setfName(String fName,int i) {
		this.fName[i] = fName;
	}
	public String getOrgName(int i) {
		return orgName[i];
	}
	public void setOrgName(String orgName,int i) {
		this.orgName[i] = orgName;
	}
	public String getfDate(int i) {
		return fDate[i];
	}
	public void setfDate(String fDate,int i) {
		this.fDate[i] = fDate;
	}
	public String getContent(int i) {
		return content[i];
	}
	public void setContent(String content,int i) {
		this.content[i] = content;
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
	/*************************************************************************/
	public int getForeignNumnber() {
		return foreignNumnber;
	}
	public void setForeignNumnber(int foreignNumnber) {
		this.foreignNumnber = foreignNumnber;
	}
	/***********************************************************************/
	/***********************************************************************/
	public foreignBean(){}
	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean init(String user){
		sql="select * from info_foreign where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				foreignNumnber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(foreignNumnber!=0){
			fId=new int[foreignNumnber];                        //1.键序号
			fName=new String[foreignNumnber];                   //2.姓名
			orgName=new String[foreignNumnber];                 //3.国外机构名称
			fDate=new String[foreignNumnber];                   //4.时间
			content=new String[foreignNumnber];                 //5.进修(合作)内容
			publisher=new String[foreignNumnber];               //6.上传人
			publishTime=new String[foreignNumnber];             //7.上传时间
			return true;
		}
		return false;
	}
	/**
	 * 
	 * @param user
	 * @param sign
	 */
	public void query(String user,boolean sign){
		if(sign){
			rs=DB.query(sql);
			int i=0;
			try {
				while(rs.next()){
					//
					setfId(rs.getInt("f_id"), i);                        //
					setfName(rs.getString("f_name"), i);                   //
					setOrgName(rs.getString("org_name"), i);                 //
					setfDate(rs.getString("f_date"), i);              //
					setContent(rs.getString("content"), i);               //
					setPublisher(rs.getString("publisher"), i);                 //
					setPublishTime(rs.getString("pub_date"), i);               //s
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
