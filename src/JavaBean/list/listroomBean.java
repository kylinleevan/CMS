package JavaBean.list;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;


/**
 * ������Ԥ�����
 * @author Сǿ
 *
 */
public class listroomBean {

	private String []roomId;         //�����
	private String []userId;          //Ԥ����
	private String []orderDate;       //Ԥ������
	private int []orderTime;          //Ԥ��ʱ���
	private String []start;       	//ʱ����ʼ��
	private String []end;             //ʱ����ֹ��
	private int []approved;        //Ԥ��״̬  
	private String []reason;          //Ԥ��ԭ��
	private String []college;         //����ѧԺ
	private String []remarks;         //��ע
	private int []size;               //�����С
	private String []media;           //ý�����
	private String []address;         //��ַ
	private int[]futureDays;          //���鿪ʼǰ������
	/****************************************************************************/
	private int rsRowNumber;           //������м�¼����Ŀ
	private DBBean DB=new DBBean(); //�������ݿ�
	private ResultSet rs;           //�����
	private String sql;
	
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
	//����ý����Ϣ
	public void setMedia(int media,int i) {
		switch (media) {
		case 1:
			this.media[i]="<font color=green ><b>����</b></font>";
			break;
		case 0:
			this.media[i]="<font color=red ><b>������</b></font>";
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
	//����ԤԼ״̬
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
	
	public int getFutureDays(int i) {
		return futureDays[i];
	}
	public void setFutureDays(int futureDays,int i) {
		this.futureDays[i] = futureDays;
	}
	/**********************************************************************/
	public int getrsRowNumber() {
		return rsRowNumber;
	}
	public void setrsRowNumber(int rsRowNumber) {
		this.rsRowNumber = rsRowNumber;
	}
	/*********************************************************************/
	/****************************************************************************/
	//���캯��
	public listroomBean(){

	}//��ѯ�û�
	public boolean init(String user){
		sql="select * from tb_order ,tb_boardroom,tb_time " +
				"where  tb_order.order_time=tb_time.t_id and " +
				"tb_order.b_id=tb_boardroom.b_id and " +
				"user_id='"+user+"' and  tb_order.state=1 order by order_date";
		//��ȡ�����

		rs=DB.query(sql);
		try {
			while(rs.next()){
				rsRowNumber++;
			}
			rs.first();        //���ָ���һ��
			//��ʼ��JavaBean����
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
				futureDays=new int[rsRowNumber];
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
		//�ҳ� ����ţ��û�ID��Ԥ�����ڣ�Ԥ����ֹʱ�䣬**��Ԥ��״̬��Ԥ��ԭ������ѧԺ����ע����ַ��ý������������С��
		if(sign){
			try {
				rs=DB.query(sql);
				int i=0;
				while(rs.next()){
					setRoomId(rs.getString("tb_order.b_id"),i);    //���淿���
					setUserId(rs.getString("user_id"),i);          //�����û���
					setOrderDate(rs.getString("order_date"),i);    //����Ԥ������
					setOrderTime(rs.getInt("tb_order.order_time"), i);  //����ʱ���
					setStart(rs.getString("start").toString(),i);  //����ʱ����ʼ��
					setEnd(rs.getString("end").toString(),i);      //����ʱ����ֹ��
					setApproved(rs.getInt("approved"),i);          //����ԤԼ״̬
					setReason(rs.getString("reason"),i);           //��������ԭ��
					setCollege(rs.getString("college"),i);         //��������ѧԺ
					setRemarks(rs.getString("remarks"),i);         //���汸ע��Ϣ
					setMedia(rs.getInt("media"),i);                //����ý����Ϣ
					setAddress(rs.getString("b_address"),i);       //����ѧԺ��ַ
					setSize(rs.getInt("b_size"),i);                //���淿���С
					i++;

				};
				for(i=0;i<rsRowNumber;i++){
					sql="select to_days('"+getOrderDate(i)+"')-to_days(now()) commingdays";
					rs=DB.query(sql);
					rs.next();
					setFutureDays(rs.getInt("commingdays"), i);   //��������
					System.out.println(getFutureDays(i));
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}