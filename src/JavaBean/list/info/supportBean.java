package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 研究生获国家、江苏省科研创新计划资助情况JavaBean
 * @author 小强
 *
 */
public class supportBean {
	private int []sId;
	private String []std;
	private String []pojName;
	private String []tutorName;
	private String [] year;
	private String []type;
	private double []money;
	private String []publisher;
	private String []publishTime;
	/*****************************************************************/
	private int supportNumber;
	private DBBean DB=new DBBean();
	private ResultSet rs;
	private String sql;
	/*********************************************************************/
	/**********************************************************************/
	public int  getsId(int i) {
		return sId[i];
	}
	public void setsId(int  sId,int i) {
		this.sId[i] = sId;
	}
	public String  getStd(int i) {
		return std[i];
	}
	public void setStd(String  std,int i) {
		this.std[i] = std;
	}
	public String  getPojName(int i) {
		return pojName[i];
	}
	public void setPojName(String  pojName,int i) {
		this.pojName[i] = pojName;
	}
	public String  getTutorName(int i) {
		return tutorName[i];
	}
	public void setTutorName(String  tutorName,int i) {
		this.tutorName[i] = tutorName;
	}
	public String  getYear(int i) {
		return year[i];
	}
	public void setYear(String  year,int i) {
		this.year[i] = year;
	}
	public String  getType(int i) {
		return type[i];
	}
	public void setType(int  type,int i) {
		switch (type) {
		case 0:
			this.type[i]="国家级";
			break;
		case 1:
			this.type[i]="省级";
			break;
		default:
			break;
		}
	}
	public double  getMoney(int i) {
		return money[i];
	}
	public void setMoney(double  money,int i) {
		this.money[i] = money;
	}
	public String  getPublisher(int i) {
		return publisher[i];
	}
	public void setPublisher(String  publisher,int i) {
		this.publisher[i] = publisher;
	}
	public String getPublishTime(int i) {
		return publishTime[i];
	}
	public void setPublishTime(String publishTime,int i) {
		this.publishTime[i] = publishTime;
	}
	/************************************************************************/
	public int getSupportNumber() {
		return supportNumber;
	}
	public void setSupportNumber(int supportNumber) {
		this.supportNumber = supportNumber;
	}
	/************************************************************************/
	/************************************************************************/
	public supportBean(){}
	public boolean init(String user){
		sql="select * from info_support where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				supportNumber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(supportNumber!=0){
			//
			sId=new int[supportNumber];
			std=new String[supportNumber];
			pojName=new String[supportNumber];
			tutorName=new String[supportNumber];
			year=new String[supportNumber];
			type=new String[supportNumber];
			money=new double[supportNumber];
			publisher=new String[supportNumber];
			publishTime=new String[supportNumber];
			return true;
		}
		return false;
	}
	public void query(String user,boolean sign){
		if(sign){
			rs=DB.query(sql);
			int i=0;
			try {
				while(rs.next()){
					//
					setsId(rs.getInt("s_id"), i);
					setStd(rs.getString("std_name"), i);
					setPojName(rs.getString("poj_name"), i);
					setTutorName(rs.getString("tutor_name"), i);
					setYear(rs.getString("s_year"), i);
					setType(rs.getInt("type"), i);
					setMoney(rs.getDouble("money"), i);
					setPublisher(rs.getString("publisher"), i);
					setPublishTime(rs.getString("pub_date"), i);
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
