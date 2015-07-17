package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * ֪ʶ��ȨJavaBean
 * @author Сǿ
 *
 */
public class iprBean {
	private int []iprId;              //���
	private String []iprName;         //��Ȩ����ר�� 
	private String []iprNum;          //ר����
	private String []iprPerson;       //������
	private String []publisher;       //�ϴ���
	private String []publishTime;
	/*********************************************************************/
	private int iprNumber;
	private DBBean DB = new DBBean();
	private ResultSet rs;
	private String sql;
	/************************************************************************/
	/**********************************************************************/

	public int getIprId(int i) {
		return iprId[i];
	}

	public void setIprId(int iprId,int i) {
		this.iprId[i] = iprId;
	}

	public String getIprName(int i) {
		return iprName[i];
	}

	public void setIprName(String iprName,int i) {
		this.iprName[i] = iprName;
	}

	public String getIprNum(int i) {
		return iprNum[i];
	}

	public void setIprNum(String iprNum,int i) {
		this.iprNum[i] = iprNum;
	}

	public String getIprPerson(int i) {
		return iprPerson[i];
	}

	public void setIprPerson(String iprPerson,int i) {
		this.iprPerson[i] = iprPerson;
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

	/******************************************************************/
	public int getIprNumber() {
		return iprNumber;
	}

	public void setIprNumber(int iprNumber) {
		this.iprNumber = iprNumber;
	}
	/***********************************************************************/
	/***********************************************************************/
	public iprBean(){}
	/**
	 * ��ʼ��
	 * @param user
	 */
	public boolean init(String user){
		sql="select * from info_ipr where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				iprNumber++;
			}
			//��ʼ��JavaBean����
			if(iprNumber!=0){
				iprId=new int[iprNumber];
				iprName=new String[iprNumber];              //
				iprNum=new String[iprNumber];
				iprPerson=new String[iprNumber];
				publisher=new String[iprNumber];
				publishTime=new String[iprNumber];
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
				rs=DB.query(sql);
				int i=0;
				while(rs.next()){
					//�����������
					setIprId(rs.getInt("ipr_id"), i);                          //���
					setIprName(rs.getString("ipr_name"), i);                   //������Ȩ����ר��
					setIprNum(rs.getString("ipr_num"), i);                     //����ר�����
					setIprPerson(rs.getString("ipr_person"), i);               //���淢����
					setPublisher(rs.getString("publisher"), i);                //�����ϴ���
					setPublishTime(rs.getString("pub_date"), i);
					i++;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
