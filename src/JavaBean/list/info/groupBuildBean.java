package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * 团队建设JavaBean
 * @author 小强
 *
 */
public class groupBuildBean {
	private int []gId;                          //1.
	private String []gName;                     //2.
	private String []birth;                     //3.
	private String []degree;                    //4.
	private String []proTech;                   //5.
	private String []pId;                       //6.
	private String []adPost;                    //7.
	private String []publisher;                 //8.
	private String []publishTime;               //9.
	/*****************************************************************/
	private int groupBuildNumber;
	private DBBean DB=new DBBean();
	private ResultSet rs;
	private String sql;
	/*********************************************************************/
	/************************************************************************/
	 
	public int getgId(int i) {
		return gId[i];
	}
	public void setgId(int gId,int i) {
		this.gId[i] = gId;
	}
	public String getgName(int i) {
		return gName[i];
	}
	public void setgName(String gName,int i) {
		this.gName[i] = gName;
	}
	public String getBirth(int i) {
		return birth[i];
	}
	public void setBirth(String birth,int i) {
		this.birth[i] = birth;
	}
	public String getDegree(int i) {
		return degree[i];
	}
	public void setDegree(String degree,int i) {
		this.degree[i] = degree;
	}
	public String getProTech(int i) {
		return proTech[i];
	}
	public void setProTech(String proTech,int i) {
		this.proTech[i] = proTech;
	}
	public String getpId(int i) {
		return pId[i];
	}
	public void setpId(String pId,int i) {
		this.pId[i] = pId;
	}
	public String getAdPost(int i) {
		return adPost[i];
	}
	public void setAdPost(String adPost,int i) {
		this.adPost[i] = adPost;
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
	/*********************************************************************/
	public int getGroupBuildNumber() {
		return groupBuildNumber;
	}
	public void setGroupBuildNumber(int groupBuildNumber) {
		this.groupBuildNumber = groupBuildNumber;
	}
	/*****************************************************************/
	/*******************************************************************/
	public groupBuildBean(){}
	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean init(String user){
		sql="select * from info_group_build where publisher='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				groupBuildNumber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(groupBuildNumber!=0){
			//
			gId=new int[groupBuildNumber];
			gName=new String[groupBuildNumber];
			birth=new String[groupBuildNumber];
			degree=new String[groupBuildNumber];
			proTech=new String[groupBuildNumber];
			pId=new String[groupBuildNumber];
			adPost=new String[groupBuildNumber];
			publisher=new String[groupBuildNumber];
			publishTime=new String[groupBuildNumber];
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
			rs=DB.query(sql);
			int i=0;
			try {
				while(rs.next()){
					setgId(rs.getInt("g_id"), i);                    //1.
					setgName(rs.getString("g_name"), i);                //2.
					setBirth(rs.getString("birth"), i);               //3.
					setDegree(rs.getString("degree"), i);                //4.
					setProTech(rs.getString("protech"), i);               //5.
					setpId(rs.getString("p_id"), i);                   //6.
					setAdPost(rs.getString("adpost"), i);                 //7.
					setPublisher(rs.getString("publisher"), i);              //8. 
					setPublishTime(rs.getString("pub_date"), i);            //9.
					i++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
