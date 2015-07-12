<%@page import="JavaBean.list.listroomBean"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 声明listroomBean -->
<jsp:useBean id="mylist" class="JavaBean.list.listroomBean"
	scope="request"></jsp:useBean>


<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- bootstrap -->

<title>个人信息[会议室预定]</title>
</head>
<body>
	<%@ include file="../HEAD/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="listroom.jsp">我的预约</a>
					</li>
					<li role="presentation"><a href="listinfo.jsp">我的上传</a>
					</li>
				</ul>




				<%
					int i = 0;
					String approvedString; //会议室状态
				%>
				<!-- 获取查询结果集合 -->
				<%
					boolean sign = mylist.init(userID);
					mylist.query(userID, sign);
				%>

				<div class="container">
					<%
						if (sign) {
							out.println("<br><h3><b>您好，您有" + mylist.getrsRowNumber()
									+ "条预约信息。</b></h3>"
									+ "<font color=red>(绿色为已经通过的预定，蓝色预定待管理员批准。)</font><br>");
							for (; i < mylist.getrsRowNumber(); i++) {
								if (mylist.getApproved(i) == 1) {
									request.setAttribute("color", "btn btn-success");
									approvedString = "<font color=green><b>已通过</b></font>";
								} else {
									request.setAttribute("color", "btn btn-primary");
									approvedString = "<font color=red><b>待审核</b></font>";
								}
					%>
					<br>

					<button type="button" class='<%=request.getAttribute("color")%>'
						data-toggle="collapse" data-target='#<%=i%>'><%=mylist.getRoomId(i)%><br><%=mylist.getOrderDate(i)%></button>

					<div id='<%=i%>' class="collapse">
						<b>房间号：</b>
						<%=mylist.getRoomId(i)%>
						<br> <b>预订人：</b>
						<%=session.getAttribute("userName")%><br> <b>预定日期：</b>
						<%=mylist.getOrderDate(i)%><br> <b>预定时段：</b>
						<%=mylist.getStart(i)%>
						---
						<%=mylist.getEnd(i)%><br> <b>预定状态：</b>
						<%=approvedString%><br> <b>预约原因：</b>
						<%=mylist.getReason(i)%><br> <b>所属学院：</b>
						<%=mylist.getCollege(i)%><br> <b>媒体设备：</b>
						<%=mylist.getMedia(i)%><br> <b>会议室地址：</b>
						<%=mylist.getAddress(i)%><br> <b>房间大小：</b>
						<%=mylist.getSize(i)%><br> <b>备注：</b>
						<%=mylist.getRemarks(i)%><br>


						<form class="form-horizontal" action="cancel.jsp" Name="form"
							method="post" onSubmit="return cheek()">
							<input type="hidden" name="Room" value='<%=mylist.getRoomId(i)%>'>
							<input type="hidden" name="Date"
								value='<%=mylist.getOrderDate(i)%>'> <input
								type="hidden" name="sTime" value='<%=mylist.getStart(i)%>'>
							<input type="hidden" name="eTime" value='<%=mylist.getEnd(i)%>'>
							<input type="hidden" name="orderTime"
								value='<%=mylist.getOrderTime(i)%>'>
							<button type="submit" class="btn btn-danger">取消预约</button>
						</form>

					</div>
					<br>
					<%
						}
						} else {
							out.print("<br><br><br><br><br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
									+ "<h2><b>您目前还没有预约任何会议室！</b></h2></div>");
							out.println("<a href='../ROOM/boardroom.jsp'><button type='button' class='btn btn-primary'>立即预约</button></a>");
						}
					%>
					<br> <a href='../ROOM/boardroom.jsp'><button type='button'
							class='btn btn-warning'>继续预约</button></a>
				</div>



				</a>


			</div>
			<div class="col-md-1"></div>
		</div>

	</div>




</body>
</html>