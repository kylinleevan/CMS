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
	private int []aId;                           //1.�����
	private String []stdName;                    //2.�о�������
	private String []aName;                      //3.��������
	private String []tutorName;                  //4.��ʦ����
	private String []winYear;                    //5.�����
	private String []awards;                     //6.������
	private String []publisher;                  //7.�ϴ���
	private String []publishTime;                //8.�ϴ�ʱ��
	/*****************************************************************/
	
	private int articleNumber;                     //������м�¼����Ŀ
	private DBBean DB=new DBBean();              //�������ݿ�
	private ResultSet rs;                        //����� 
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
	 * ���캯��
	 */
	public articleBean(){}
	/**
	 * ��ʼ��JavaBean����
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
			//��ʼ��JavaBean����
			aId=new int[articleNumber];                        //1.��������
			stdName=new String[articleNumber];                 //2.�����о�������
			aName=new String[articleNumber];                   //3.������������
			tutorName=new String[articleNumber];               //4.���浼ʦ����
			winYear=new String[articleNumber];                 //5.��������
			awards=new String[articleNumber];                  //6.����������
			publisher=new String[articleNumber];               //7.�����ϴ���
			publishTime=new String[articleNumber];             //8.�����ϴ�ʱ��
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
					//���������
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

