package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 主办学术会议情况JavaBean
 * @author 小强
 *
 */
public class meetingBean {
	private int []mId;
	private String []mName;
	private String []mTime;
	private String []mPlace;
	private String []publisher;
	private String []publishTime;
	/****************************************************************/
	private int meetingNumber;
	private DBBean DB=new DBBean();
	private ResultSet rSet;
	private String sql;
	/*****************************************************************/
	/****************************************************************/

	public int getmId(int i) {
		return mId[i];
	}
	public void setmId(int mId,int i) {
		this.mId[i] = mId;
	}
	public String  getmName(int i) {
		return mName[i];
	}
	public void setmName(String  mName,int i) {
		this.mName[i] = mName;
	}
	public String  getmTime(int i) {
		return mTime[i];
	}
	public void setmTime(String  mTime,int i) {
		this.mTime[i] = mTime;
	}
	public String  getmPlace(int i) {
		return mPlace[i];
	}
	public void setmPlace(String  mPlace,int i) {
		this.mPlace[i] = mPlace;
	}
	public String  getPublisher(int i) {
		return publisher[i];
	}
	public void setPublisher(String  publisher,int i) {
		this.publisher[i] = publisher;
	}
	public String  getPublishTime(int i) {
		return publishTime[i];
	}
	public void setPublishTime(String  publishTime,int i) {
		this.publishTime[i] = publishTime;
	}
	/*******************************************************************/
	public int getMeetingNumber() {
		return meetingNumber;
	}
	public void setMeetingNumber(int meetingNumber) {
		this.meetingNumber = meetingNumber;
	}
	/*******************************************************************/
	/********************************************************************/
	/**
	 * 
	 */
	public meetingBean(){}
	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean init(String user){
		sql="select * from info_meeting where publisher='"+user+"'";
		rSet=DB.query(sql);
		try {
			while(rSet.next()){
				meetingNumber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(meetingNumber!=0){
			//
			mId=new int[meetingNumber];
			mName=new String[meetingNumber];
			mTime=new String[meetingNumber];
			mPlace=new String[meetingNumber];
			publisher=new String[meetingNumber];
			publishTime=new String[meetingNumber];
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
			rSet=DB.query(sql);
			try {
				int i=0;
				while(rSet.next()){
					//
					setmId(rSet.getInt("m_id"), i);
					setmName(rSet.getString("m_name"), i);
					setmTime(rSet.getString("m_time"), i);
					setmPlace(rSet.getString("m_place"), i);
					setPublisher(rSet.getString("publisher"), i);
					setPublishTime(rSet.getString("pub_date"), i);
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
