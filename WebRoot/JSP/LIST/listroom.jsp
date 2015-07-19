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
					<li role="presentation"><a href="listinfo.jsp">我的上传</a></li>
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
				<br> <br>
				<!-- 显示会议室预定统计信息 -->
				<%
					if (sign) {
				%>
				<div class='alert alert-success text-center form-group' role='alert'>
					<h2>
						<b>您好，您共有<%=mylist.getrsRowNumber()%>张预约卡。</b>
					</h2>
					<font color=red>(绿色为已经通过的预定，蓝色预定待管理员批准。)</font><br>
				</div>
				<%
					for (; i < mylist.getrsRowNumber(); i++) {
							if (mylist.getApproved(i) == 1) {
								request.setAttribute("color", "btn btn-success");
								approvedString = "<font color=green><b>已通过</b></font>";
							} else {
								request.setAttribute("color", "btn btn-primary");
								approvedString = "<font color=red><b>待审核</b></font>";
							}
				%>
				<!-- 显示预约卡到期期限 -->
				<%
					if (i == 0) {
								if (mylist.getFutureDays(i) < 0) {
				%>
				<font size=5 color="gray"><b>已过期的预约卡</b> </font>
				<hr style="height:3px;border:none;border-top:3px double green;" />

				<%
					request.setAttribute("color", "btn ");
									approvedString = "<font color=gray><b>已过期</b></font>";
								} else {
				%>
				<font size=10 color="orange"><b><%=mylist.getFutureDays(0)%></b>
				</font><font size=5><b>日内到期的预约卡</b> </font>
				<hr style="height:3px;border:none;border-top:3px double green;" />
				<%
					}
							} else if (mylist.getFutureDays(i) != mylist
									.getFutureDays(i - 1)) {
				%>
				<font size=10 color="orange"><b><%=mylist.getFutureDays(i)%></b>
				</font><font size=5><b>日内到期的预约卡</b> </font>
				<hr style="height:3px;border:none;border-top:3px double green;" />
				<%
					}
				%>
				<br>
				<!-- 预约卡片的定制详情 -->
				<button type="button" class='<%=request.getAttribute("color")%>'
					data-toggle="collapse" data-target='#<%=i%>'><%=mylist.getRoomId(i)%><br><%=mylist.getOrderDate(i)%></button>
				<div id='<%=i%>' class="collapse">
					<br>
					<table class="table table-bordered">
						<tr class="success">
							<th colspan=4><p class="text-center">
									<font size=10><%=mylist.getRoomId(i)%>预约卡</font><font size=6
										color=purple>--<%=mylist.getOrderDate(i)%>日</font>
								</p>
							</th>
						</tr>
						<tr class="info">
							<td rowspan=2>使用时段：<br>
								<p class="text-center">
									<font size=6 color=blue> <%=mylist.getStart(i)%> --- <%=mylist.getEnd(i)%></font>
								</p></td>
							<td colspan=3><b>预约人：<font size=4><%=session.getAttribute("userName")%></font>
							</b>
							</td>

						</tr>

						<tr class="info">
							<td colspan=4><b>预约原因：</b><font color=red><b><%=mylist.getReason(i)%></b>
							</font>
							</td>
						</tr>
						<tr class="warning">
							<td colspan=4><b>会议室资料明细：</b>
							</td>
						</tr>
						<tr class="warning">
							<td>地址：<%=mylist.getAddress(i)%></td>
							<td>所属学院：<%=mylist.getCollege(i)%></td>
							<td>大小：<%=mylist.getSize(i)%></td>
							<td>媒体设备：<%=mylist.getMedia(i)%></td>
						</tr>
						<tr class="warning">
							<td colspan=4>备注：<%=mylist.getRemarks(i)%></td>
						</tr>
						<tr class="danger">

							<td colspan=2><b>核定状态：</b><%=approvedString%></td>
							<td><form class="form-horizontal" action="cancel.jsp"
									Name="form" method="post" onSubmit="return cheek()">
									<input type="hidden" name="Room"
										value='<%=mylist.getRoomId(i)%>'> <input type="hidden"
										name="Date" value='<%=mylist.getOrderDate(i)%>'> <input
										type="hidden" name="sTime" value='<%=mylist.getStart(i)%>'>
									<input type="hidden" name="eTime" value='<%=mylist.getEnd(i)%>'>
									<input type="hidden" name="orderTime"
										value='<%=mylist.getOrderTime(i)%>'>
									<%
										if (mylist.getFutureDays(i) < 0) {
									%>
									<button type="submit" class="btn btn-danger" disabled>取消预约</button>
									<%
										} else {
									%>
									<button type="submit" class="btn btn-danger">取消预约</button>
									<%
										}
									%>

								</form>
							</td>
							<td><a href='../ROOM/boardroom.jsp'><button
										type='button' class='btn btn-warning'>继续预约</button> </a></td>
						</tr>
					</table>
					<br> <br>
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

			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>