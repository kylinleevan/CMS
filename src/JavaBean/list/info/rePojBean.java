package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * ������ĿJavaBean
 * @author Сǿ
 *
 */
public class rePojBean {
	private int []rId;                   
	private String []rName;           //��Ŀ����
	private String []rSerial;         //��Ŀ���
	private String []rSource;         //��Ŀ��Դ
	private String []startTime;       //��Ŀ��ʼʱ��
	private String []endTime;         //��Ŀ����ʱ��
	private String []person;          //�е���
	private double []fee;             //���ѣ���Ԫ��
	private int rePojNumber;          //�������Ŀ���
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

	public int getrePojNumber() {
		return rePojNumber;
	}
	public void setrePojNumber(int rePojNumber) {
		this.rePojNumber = rePojNumber;
	}
	public  rePojBean(){}
	/**
	 * ��ʼ��
	 * @param user
	 */
	public boolean init(String user){

		String sql="select * from info_re_poj where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				rePojNumber++;
			}
			rs.first();        //���ָ���һ��
			//��ʼ��JavaBean����
			if(rePojNumber!=0){
				rId=new int[rePojNumber];
				rName=new String[rePojNumber];              //
				rSerial=new String[rePojNumber];
				rSource=new String[rePojNumber];
				startTime=new String[rePojNumber];
				endTime=new String[rePojNumber];
				person=new String[rePojNumber];
				fee=new double[rePojNumber];
			}
			else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * ��ѯ���
	 * @param user
	 */
	public void query(String user,boolean sign){
		if(sign){
			try {
				int i=0;
				do{
					//�����������
					setrId(i+1, i);
					setrName(rs.getString("r_name"), i);                         //������Ŀ����
					setrSerial(rs.getString("r_serial"), i);                     //������Ŀ���
					setrSource(rs.getString("r_source"), i);                     //������Ŀ��Դ
					setStartTime(rs.getString("start_time"), i);                 //������Ŀ��ʼʱ��
					setEndTime(rs.getString("end_time"), i);                     //������Ŀ����ʱ��
					setPerson(rs.getString("person"), i);                        //���������� 
					setFee(rs.getDouble("fee"), i);                              //������Ŀ����
					i++;
				}while(rs.next());

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
