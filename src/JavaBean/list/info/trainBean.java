package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 研究生培养 （每年）JavaBean
 * @author 小强
 *
 */


public class trainBean {
	private int []year;
	private String []role;
	private int []rsAll;
	private int []rsOverStd;
	private int []degreeAll;
	private int []degreeOverStd;
	private String []publisher;
	private String []publishTime;
	/**************************************************************/
	private int trainNumber;
	private DBBean DB=new DBBean();
	private ResultSet rs;
	private String sql;
	/**************************************************************/
	/**************************************************************/
	public int getYear(int i) {
		return year[i];
	}
	public void setYear(int year,int i) {
		this.year[i] = year;
	}
	public String getRole(int i) {
		return role[i];
	}
	public void setRole(int  role,int i) {
		switch (role) {
		case 0:
			this.role[i]="博士生";
			break;
		case 1:
			this.role[i]="硕士生";
			break;
		default:
			break;
		}
	}
	public int  getRsAll(int i) {
		return rsAll[i];
	}
	public void setRsAll(int rsAll,int i) {
		this.rsAll[i] = rsAll;
	}
	public int  getRsOverStd(int i) {
		return rsOverStd[i];
	}
	public void setRsOverStd(int  rsOverStd,int i) {
		this.rsOverStd[i] = rsOverStd;
	}
	public int  getDegreeAll(int i) {
		return degreeAll[i];
	}
	public void setDegreeAll(int  degreeAll,int i) {
		this.degreeAll[i] = degreeAll;
	}
	public int getDegreeOverStd(int i) {
		return degreeOverStd[i];
	}
	public void setDegreeOverStd(int degreeOverStd,int i) {
		this.degreeOverStd[i] = degreeOverStd;
	}
	public String  getPublisher(int i) {
		return publisher[i];
	}
	public void setPublisher(String publisher,int i) {
		this.publisher[i] = publisher;
	}
	public String  getPublishTime(int i) {
		return publishTime[i];
	}
	public void setPublishTime(String publishTime,int i) {
		this.publishTime[i] = publishTime;
	}
	/*************************************************************/
	public int getTrainNumber() {
		return trainNumber;
	}
	public void setTrainNumber(int trainNumber) {
		this.trainNumber = trainNumber;
	}
	/**************************************************************/
	/**************************************************************/
	//构造函数
	public trainBean(){}
	
	/**
	 * 初始化
	 * @param user
	 */
	public boolean init(String user){

		sql="select * from info_train where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				trainNumber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(trainNumber!=0){
			//初始化JavaBean数组
			year=new int[trainNumber];
			role=new String[trainNumber];
			rsAll=new int[trainNumber];
			rsOverStd=new int[trainNumber];
			degreeAll=new int[trainNumber];
			degreeOverStd=new int[trainNumber];
			publisher=new String[trainNumber];
			publishTime=new String[trainNumber];
			return true;
		}
		else
			return false;
	}
	/**
	 * 查询结果
	 * @param user
	 */
	public void query(String user,boolean sign){

		if(sign){
			rs=DB.query(sql);
			try {
				int i=0;
				while(rs.next()){
					setYear(rs.getInt("year"), i);
					setRole(rs.getInt("role"), i);
					setRsAll(rs.getInt("rs_all"), i);
					setRsOverStd(rs.getInt("rs_overstd"), i);
					setDegreeAll(rs.getInt("degree_all"), i);
					setDegreeOverStd(rs.getInt("degree_overstd"), i);
					setPublisher(rs.getString("publisher"), i);
					setPublishTime(rs.getString("pub_date"), i);
					i++;
					System.out.println(rs.getInt("year"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
