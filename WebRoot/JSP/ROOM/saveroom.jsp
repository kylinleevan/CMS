<%@page import="JavaBean.DBBean"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>

		<jsp:useBean id="room" class="JavaBean.DBBean" scope="request"></jsp:useBean>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
		<script src="../bootstrap/js/jquery.min.js"></script>
		<script src="../bootstrap/js/bootstrap.js"></script>
		<title>会议室预约</title>
	</head>
	<body>
		<%@ include file="../HEAD/header.jsp"%>
		<%
			String itime;
			itime = request.getParameter("Time");
			String sql1 = "select * from tb_time where t_id = " + itime;
			ResultSet rs1 = room.query(sql1);
			String stime="", etime="";
			while(rs1.next())
			{
				stime = rs1.getString("start");
				etime = rs1.getString("end");
			}
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="alert alert-danger fade in hide" id="danger-block"
						role="alert" style="text-align: center">
						<button type="button" class="close" data-dismiss="alert">
							&times;
						</button>
					</div>
				</div>
				<div class="col-md-4 col-md-offset-4">
					<h1 class="center-block text-center"
						style="max-width: 600px; position: relative">
						预约
					</h1>
					<div class="form-group">
						<form class="form-horizontal" action="../../Saveroom" Name="form"
							method="post" onSubmit="return cheek()">

							<!-- 预定信息 -->
							<input class="form-control" id="bId" type="text"
								placeholder='房间号：<%=request.getParameter("Room")%>' disabled>
							<br>
							<input class="form-control" id="Date" type="text"
								placeholder='预约日期：<%=request.getParameter("Date")%>' disabled>
							<br>
							<input class="form-control" id="time" type="text"
								placeholder='预约时段：<%= stime%>---<%= etime%>' disabled>
							<br>
							<input class="form-control" id="peason" type="text"
								placeholder='预约负责人：<%= userName%>' disabled>
							<br>
							<input class="form-control" id="college" type="text" name="college"
								placeholder='所属学院' required="required">
							<br>
							<textarea class="form-control" rows="5" id="reason"
								required="required" name="reason" placeholder="预约原因..."></textarea>
							<br />

							<!-- 上传参数 -->
							<input type="hidden" name="userid" value='<%=userID%>'>
							<input type="hidden" name="room"
								value='<%=request.getParameter("Room")%>'>
							<input type="hidden" name="date"
								value='<%=request.getParameter("Date")%>'>
							<input type="hidden" name="ordertime"
								value='<%=itime%>'>

							<!-- 上传按钮 -->
							<button type="submit" class="btn btn-danger">
								预定
							</button>
							<button type="button" class="btn" onclick=returnClear();
>
								清空
							</button>
							<br />
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>