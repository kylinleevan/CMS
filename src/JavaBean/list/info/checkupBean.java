package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 成果验收鉴定JavaBean
 * @author 小强
 *
 */


public class checkupBean {
	private int []cId;                          //1.键序号
	private String []cName;                     //2.成果名称
	private String []cDate;                     //3.取得时间
	private String []cDept;                     //4.鉴定或验收单位
	private String []cAdvise;                   //5.主要鉴定或验收意见
	private String []cPerson;                   //6.主要完成人
	private String []publisher;                 //7.上传人
	private String []publishTime;               //8.上传时间
	/************************************************************/
	private int checkupNumner;
	private DBBean DB=new DBBean();
	private ResultSet rs;
	private String sql;
	/************************************************************/
	/************************************************************/
	public int getcId(int i) {
		return cId[i];
	}
	public void setcId(int cId,int i) {
		this.cId[i] = cId;
	}
	public String getcName(int i) {
		return cName[i];
	}
	public void setcName(String cName,int i) {
		this.cName[i] = cName;
	}
	public String getcDate(int i) {
		return cDate[i];
	}
	public void setcDate(String cDate,int i) {
		this.cDate[i] = cDate;
	}
	public String getcDept(int i) {
		return cDept[i];
	}
	public void setcDept(String cDept,int i) {
		this.cDept[i] = cDept;
	}
	public String getcAdvise(int i) {
		return cAdvise[i];
	}
	public void setcAdvise(String cAdvise,int i) {
		this.cAdvise[i] = cAdvise;
	}
	public String getcPerson(int i) {
		return cPerson[i];
	}
	public void setcPerson(String cPerson,int i) {
		this.cPerson[i] = cPerson;
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
	public int getCheckupNumner() {
		return checkupNumner;
	}
	public void setCheckupNumner(int checkupNumner) {
		this.checkupNumner = checkupNumner;
	}
	/*************************************************************************/
	/*************************************************************************/
	public checkupBean(){}
	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean init(String user){
		sql="select * from info_checkup where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				checkupNumner++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(checkupNumner!=0){
			//初始化各数组
			cId=new int[checkupNumner];                  //1.键序号
			cName=new String[checkupNumner];             //2.成果名称
			cDate=new String[checkupNumner];             //3.取得时间
			cDept=new String[checkupNumner];             //4.鉴定或验收单位
			cAdvise=new String[checkupNumner];           //5.主要鉴定或验收意见
			cPerson=new String[checkupNumner];           //6.主要完成人
			publisher=new String[checkupNumner];         //7.上传人
			publishTime=new String[checkupNumner];       //8.上传时间
			return true;
		}
		else
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
					setcId(rs.getInt("c_id"), i);                       //1.保存键序号
					setcName(rs.getString("c_name"), i);                //2.保存成果名称
					setcDate(rs.getString("c_date"), i);                //3.保存取得时间
					setcDept(rs.getString("c_dep"), i);                 //4.保存鉴定或验收单位
					setcAdvise(rs.getString("c_advise"), i);            //5.保存主要鉴定或验收意见
					setcPerson(rs.getString("c_person"), i);            //6.保存主要完成人
					setPublisher(rs.getString("publisher"), i);         //7.保存上传人
					setPublishTime(rs.getString("pub_date"), i);        //8.保存上传时间
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
