package JavaBean.list.info;

import java.sql.ResultSet;
import java.sql.SQLException;

import JavaBean.DBBean;

/**
 * ����̲�
 * @author Сǿ
 *
 */
public class bookBean {
	private int []bId;                     //1.�����
	private String []bookId;               //2.�̲ı��
	private String []bookName;             //3.�̲�����
	private String []pDate;                //4.����ʱ��
	private String []pDep;                 //5.���浥λ
	private String [] author;              //6.����
	private String []publisher;            //7.�ϴ���
	private String []publisherTime;        //8.�ϴ�ʱ��
	/*********************************************************************/
	private int bookNumber;
	private DBBean DB=new DBBean();
	private ResultSet rs;
	private String sql;
	/*********************************************************************/
	/*********************************************************************/


	public int getbId(int i) {
		return bId[i];
	}
	public String getAuthor(int i) {
		return author[i];
	}
	public void setAuthor(String author,int i) {
		this.author[i] = author;
	}
	public void setbId(int bId,int i) {
		this.bId[i] = bId;
	}
	public String getPublisherTime(int i) {
		return publisherTime[i];
	}
	public void setPublisherTime(String publisherTime,int i) {
		this.publisherTime[i] = publisherTime;
	}

	public String getBookId(int i) {
		return bookId[i];
	}

	public void setBookId(String bookId,int i) {
		this.bookId[i] = bookId;
	}
	public String getBookName(int i) {
		return bookName[i];
	}
	public void setBookName(String bookName,int i) {
		this.bookName[i] = bookName;
	}
	public String getpDate(int i) {
		return pDate[i];
	}
	public void setpDate(String pDate,int i) {
		this.pDate[i] = pDate;
	}
	public String getpDep(int i) {
		return pDep[i];
	}
	public void setpDep(String pDep,int i) {
		this.pDep[i] = pDep;
	}
	public String getPublisher(int i) {
		return publisher[i];
	}
	public void setPublisher(String publisher,int i) {
		this.publisher[i] = publisher;
	}
	/******************************************************************/
	public int getBookNumber() {
		return bookNumber;
	}
	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}
	/******************************************************************/
	/******************************************************************/
	/**
	 * ���캯��
	 */
	public bookBean(){}
	/**
	 * ��ʼ�� 
	 * @param user
	 * @return
	 */
	public boolean init(String user){
		sql="select * from info_book,info_book_writer where publisher='"+user+"' "+ 
				"and info_book.b_id=info_book_writer.b_id";
		rs=DB.query(sql);
		try {
			while(rs.next()){
				bookNumber++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if(bookNumber!=0){
			//��ʼ��JavaBean����
			bId=new int[bookNumber];                                //1.��������
			bookId=new String[bookNumber];                          //2.����̲ı��
			bookName=new String[bookNumber];                        //3.����̲�����
			pDate=new String[bookNumber];                           //4.�������ʱ��
			pDep=new String[bookNumber];                            //5.������浥λ
			author=new String[bookNumber];
			publisher=new String[bookNumber];                       //6.�����ϴ���
			publisherTime=new String[bookNumber];                   //7.�����ϴ�ʱ��	
			return true;
		}
		else
			return false;
	}
	/**
	 * ������
	 * @param user
	 * @param sign
	 */
	public void query(String user,boolean sign){
		if(sign){
			rs=DB.query(sql);
			int i=0;
			try {
				while(rs.next()){
					//���������
					setbId(rs.getInt("b_id"), i);                         //  
					setBookId(rs.getString("book_id"), i);                   //
					setBookName(rs.getString("book_name"), i);                 //
					setpDate(rs.getString("p_date"), i);                    //
					setpDep(rs.getString("p_dep"), i);          
					setAuthor(rs.getString("author"), i);                           //
					setPublisher(rs.getString("publisher"), i);                //
					setPublisherTime(rs.getString("pub_date"), i);            //
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
