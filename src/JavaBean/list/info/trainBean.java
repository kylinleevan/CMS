package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * �о������� ��ÿ�꣩JavaBean
 * @author Сǿ
 *
 */


public class trainBean {
	private int []rId;                   
	private String []rName;           //��Ŀ����
	private String []rSerial;         //��Ŀ���
	private String []rSource;         //��Ŀ��Դ
	private String []startTime;       //��Ŀ��ʼʱ��
	private String []endTime;         //��Ŀ����ʱ��
	private String []person;          //�е���
	private double []fee;             //���ѣ���Ԫ��
	private int rsRowNumber;          //�������Ŀ���
	private DBBean DB=new DBBean();   //�������ݿ�
	private ResultSet rs;             //��ѯ�����
	public int getrId(int i) {
		return rId[i];
	}
	public void setrId(int rId,int i) {
		this.rId[i] = rId;
	}
	public String getrName(int i) {
		return rName[i];
	}
	public void setrName(String rName,int i) {
		this.rName[i] = rName;
	}
	public String getrSerial(int i) {
		return rSerial[i];
	}
	public void setrSerial(String rSerial,int i) {
		this.rSerial[i] = rSerial;
	}
	public String getrSource(int i) {
		return rSource[i];
	}
	public void setrSource(String rSource,int i) {
		this.rSource[i] = rSource;
	}
	public String getStartTime(int i) {
		return startTime[i];
	}
	public void setStartTime(String startTime,int i) {
		this.startTime[i] = startTime;
	}
	public String getEndTime(int i) {
		return endTime[i];
	}
	public void setEndTime(String endTime,int i) {
		this.endTime[i] = endTime;
	}
	public String getPerson(int i) {
		return person[i];
	}
	public void setPerson(String person,int i) {
		this.person[i] = person;
	}
	public double getFee(int i) {
		return fee[i];
	}
	public void setFee(double fee,int i) {
		this.fee[i] = fee;
	}
	
	public int getRsRowNumber() {
		return rsRowNumber;
	}
	public void setRsRowNumber(int rsRowNumber) {
		this.rsRowNumber = rsRowNumber;
	}
	
	
	//���캯��
	public trainBean(){
		
	}
	/**
	 * ��ʼ��
	 * @param user
	 */
	public void init(String user){

		String sql="select * from info_re_poj where person='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			rs.first();        //���ָ���һ��
			//��ʼ��JavaBean����
			rName=new String[rsRowNumber];              //
			rSerial=new String[rsRowNumber];
			rSource=new String[rsRowNumber];
			startTime=new String[rsRowNumber];
			endTime=new String[rsRowNumber];
			person=new String[rsRowNumber];
			fee=new double[rsRowNumber];
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ��ѯ���
	 * @param user
	 */
	public void query(String user){
		
		try {
			int i=0;
			do{
				//�����������
				setrName(rs.getString("r_name"), i);                         //������Ŀ����
				setrSerial(rs.getString("r_serial"), i);                     //������Ŀ���
				setrSource(rs.getString("r_source"), i);                     //������Ŀ��Դ
				setStartTime(rs.getString("start_time"), i);                 //������Ŀ��ʼʱ��
				setEndTime(rs.getString("end_time"), i);                     //������Ŀ����ʱ��
				setPerson(rs.getString("person"), i);                        //���������� 
				setFee(rs.getDouble("fee"), i);                              //������Ŀ����
				
			}while(rs.next());
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
