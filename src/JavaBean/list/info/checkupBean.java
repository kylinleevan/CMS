package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * �ɹ����ռ���JavaBean
 * @author Сǿ
 *
 */


public class checkupBean {
	private int []cId;                          //1.�����
	private String []cName;                     //2.�ɹ�����
	private String []cDate;                     //3.ȡ��ʱ��
	private String []cDept;                     //4.���������յ�λ
	private String []cAdvise;                   //5.��Ҫ�������������
	private String []cPerson;                   //6.��Ҫ�����
	private String []publisher;                 //7.�ϴ���
	private String []publishTime;               //8.�ϴ�ʱ��
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
			//��ʼ��������
			cId=new int[checkupNumner];                  //1.�����
			cName=new String[checkupNumner];             //2.�ɹ�����
			cDate=new String[checkupNumner];             //3.ȡ��ʱ��
			cDept=new String[checkupNumner];             //4.���������յ�λ
			cAdvise=new String[checkupNumner];           //5.��Ҫ�������������
			cPerson=new String[checkupNumner];           //6.��Ҫ�����
			publisher=new String[checkupNumner];         //7.�ϴ���
			publishTime=new String[checkupNumner];       //8.�ϴ�ʱ��
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
					setcId(rs.getInt("c_id"), i);                       //1.��������
					setcName(rs.getString("c_name"), i);                //2.����ɹ�����
					setcDate(rs.getString("c_date"), i);                //3.����ȡ��ʱ��
					setcDept(rs.getString("c_dep"), i);                 //4.������������յ�λ
					setcAdvise(rs.getString("c_advise"), i);            //5.������Ҫ�������������
					setcPerson(rs.getString("c_person"), i);            //6.������Ҫ�����
					setPublisher(rs.getString("publisher"), i);         //7.�����ϴ���
					setPublishTime(rs.getString("pub_date"), i);        //8.�����ϴ�ʱ��
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
