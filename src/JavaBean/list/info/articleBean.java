package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * �о���������ѧλ�������JavaBean
 * @author Сǿ
 *
 */

public class articleBean {
	
	private String []stdName;                    //�о�������
	private String []aName;                      //��������
	private String []tutorName;                  //��ʦ����
	private String []winYear;                    //�����
	private String []awards;                     //������
	private int rsRowNumber;                     //������м�¼����Ŀ
	private DBBean DB=new DBBean();              //�������ݿ�
	private ResultSet rs;                        //����� 
	
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
	 * ��ʼ��JavaBean����
	 * @param user
	 */
	public void init(String user){

		String sql="";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			//��ʼ��JavaBean����
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
			rs.first();        //���ָ���һ��
			//��ʼ��JavaBean����
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

