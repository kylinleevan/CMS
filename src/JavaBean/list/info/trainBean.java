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
	private int []rId;                   
	private String []rName;           //项目名称
	private String []rSerial;         //项目编号
	private String []rSource;         //项目来源
	private String []startTime;       //项目开始时间
	private String []endTime;         //项目结束时间
	private String []person;          //承担人
	private double []fee;             //经费（万元）
	private int rsRowNumber;          //结果集数目编号
	private DBBean DB=new DBBean();   //连接数据库
	private ResultSet rs;             //查询结果集
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
	
	
	//构造函数
	public trainBean(){
		
	}
	/**
	 * 初始化
	 * @param user
	 */
	public void init(String user){

		String sql="select * from info_re_poj where person='"+user+"'";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			rs.first();        //光标指向第一行
			//初始化JavaBean数组
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
	 * 查询结果
	 * @param user
	 */
	public void query(String user){
		
		try {
			int i=0;
			do{
				//保存各个属性
				setrName(rs.getString("r_name"), i);                         //保存项目名称
				setrSerial(rs.getString("r_serial"), i);                     //保存项目编号
				setrSource(rs.getString("r_source"), i);                     //保存项目来源
				setStartTime(rs.getString("start_time"), i);                 //保存项目开始时间
				setEndTime(rs.getString("end_time"), i);                     //保存项目结束时间
				setPerson(rs.getString("person"), i);                        //保存责任人 
				setFee(rs.getDouble("fee"), i);                              //保存项目经费
				
			}while(rs.next());
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
