package JavaBean.list;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;


/**
 * 会议室预定情况
 * @author 小强
 *
 */
public class listroomBean {

	private String []roomId;         //房间号
	private String []userId;          //预订人
	private String []orderDate;       //预定日期
	private int []orderTime;          //预定时间段
	private String []start;       	//时段起始点
	private String []end;             //时段终止点
	private int []approved;        //预定状态  
	private String []reason;          //预定原因
	private String []college;         //所属学院
	private String []remarks;         //备注
	private int []size;               //房间大小
	private String []media;           //媒体情况
	private String []address;         //地址
	private int rsRowNumber;           //结果集中记录的数目
	private DBBean DB=new DBBean(); //连接数据库
	private ResultSet rs;           //结果集
	
	public void setOrderTime(int orderTime,int i){
		this.orderTime[i] =orderTime;
	}
	public int getOrderTime(int i){
		return orderTime[i];
	}
	public String getStart(int i) {
		return start[i];
	}
	public void setStart(String start,int i) {
		this.start[i] = start;
	}
	public String getEnd(int i) {
		return end[i];
	}
	public void setEnd(String end,int i) {
		this.end[i] = end;
	}
	public String getRemarks(int i) {
		return remarks[i];
	}
	public void setRemarks(String remarks,int i) {
		this.remarks[i] = remarks;
	}
	public int getSize(int i) {
		return size[i];
	}
	public void setSize(int size,int i) {
		this.size[i] = size;
	}
	public String getMedia(int i) {
		return media[i];
	}
	//保存媒体信息
	public void setMedia(int media,int i) {
		switch (media) {
		case 1:
			this.media[i]="<font color=green ><b>可用</b></font>";
			break;
		case 0:
			this.media[i]="<font color=red ><b>不可用</b></font>";
			break;
		default:
			break;
		}
	}
	public String getAddress(int i) {
		return address[i];
	}
	public void setAddress(String addresss,int i) {
		this.address[i] = addresss;
	}
	public String getUserId(int i) {
		return userId[i];
	}
	public void setUserId(String userId,int i) {
		this.userId[i] = userId;
	}
	public String getOrderDate(int i) {
		return orderDate[i];
	}
	public void setOrderDate(String orderDate,int i) {
		this.orderDate[i] = orderDate;
	}

	public String getRoomId(int i) {
		return roomId[i];
	}
	public void setRoomId(String roomId,int i){
		this.roomId[i]=roomId;
	}
	//保存预约状态
	public void setApproved(int approved,int i) {
		this.approved[i]=approved;
	}
	public int getApproved(int i) {
		return approved[i];
	}
	public String getReason(int i) {
		return reason[i];
	}
	public void setReason(String reason,int i) {
		this.reason[i] = reason;
	}
	public String getCollege(int i) {
		return college[i];
	}
	public void setCollege(String college,int i) {
		this.college[i] = college;
	}
	public int getrsRowNumber() {
		return rsRowNumber;
	}
	public void setrsRowNumber(int rsRowNumber) {
		this.rsRowNumber = rsRowNumber;
	}
	//构造函数
	public listroomBean(){

	}//查询用户
	public boolean init(String user){
		String sql="select * from tb_order ,tb_boardroom,tb_time " +
				"where  tb_order.order_time=tb_time.t_id and " +
				"tb_order.b_id=tb_boardroom.b_id and " +
				"user_id='"+user+"' and  tb_order.state=1 order by order_date";
		//获取结果集

		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			rs.first();        //光标指向第一行
			//初始化JavaBean数组
			if(rsRowNumber!=0){
				roomId=new String[rsRowNumber];
				userId=new String[rsRowNumber];
				orderDate=new String[rsRowNumber];
				orderTime=new int[rsRowNumber];
				start=new String[rsRowNumber];
				end=new String[rsRowNumber];
				approved=new int[rsRowNumber];
				reason=new String[rsRowNumber];
				college=new String[rsRowNumber];
				remarks=new String[rsRowNumber];
				size=new int[rsRowNumber];
				media=new String[rsRowNumber];
				address=new String[rsRowNumber];
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	public void query(String user,boolean sign){
		//找出 房间号，用户ID，预定日期，预定起止时间，**，预定状态，预定原因，所属学院，备注，地址，媒体情况，房间大小，
		if(sign){
			try {
				int i=0;
				do {
					setRoomId(rs.getString("tb_order.b_id"),i);    //保存房间号
					setUserId(rs.getString("user_id"),i);          //保存用户名
					setOrderDate(rs.getString("order_date"),i);    //保存预定日期
					setOrderTime(rs.getInt("tb_order.order_time"), i);  //保存时间段
					setStart(rs.getString("start").toString(),i);  //保存时段起始点
					setEnd(rs.getString("end").toString(),i);      //保存时段终止点
					setApproved(rs.getInt("approved"),i);          //保存预约状态
					setReason(rs.getString("reason"),i);           //保存申请原因
					setCollege(rs.getString("college"),i);         //保存所属学院
					setRemarks(rs.getString("remarks"),i);         //保存备注信息
					setMedia(rs.getInt("media"),i);                //保存媒体信息
					setAddress(rs.getString("b_address"),i);       //保存学院地址
					setSize(rs.getInt("b_size"),i);                //保存房间大小
					i++;

				}while(rs.next());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}