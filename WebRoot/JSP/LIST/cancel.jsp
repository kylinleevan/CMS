<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>





<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery.min.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
<title>个人信息</title>
</head>
<body>
	<script type="text/javascript">
		function Submit()
		{
			
			if(document.getElementById("reasonId").value==""){
				window.location.href="./cancel.jsp?reason=empty";
            		return false;
			}
			return true;
		}
		function Clear()
		{
			document.getElementById("reason").value="";
		}
		</script>


	<%@ include file="../HEAD/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="alert alert-danger fade in hide" id="danger-block"
					role="alert" style="text-align: center">
					<button type="button" class="close" data-dismiss="alert">
						&times;</button>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-4">

				<h1 class="center-block text-center"
					style="max-width: 600px; position: relative">取消预约</h1>
				<div class="form-group">

					<form class="form-horizontal" action="../../Cancel" Name="form"
						method="post" onSubmit="return cheek()">

						<!-- 预定信息 -->

						<input class="form-control" id="bId" type="text"
							placeholder='房间号：<%=request.getParameter("Room")%>' disabled><br>
						<input class="form-control" id="Date" type="text"
							placeholder='预定日期：<%=request.getParameter("Date")%>' disabled><br>
						<input class="form-control" id="time" type="text"
							placeholder='预定时段：<%=request.getParameter("sTime")%>---<%=request.getParameter("eTime")%>'
							disabled> <br>
						<textarea class="form-control" rows="5" id="reasonId"
							name="reason" placeholder="请简述原因..."></textarea>
						<br /> 
						
						
						
						<!-- 上传参数 -->
						<input type="hidden" name="userid" value='<%=userID%>'>
						<input type="hidden" name="room" value='<%=request.getParameter("Room")%>'>
						<input type="hidden" name="date" value='<%=request.getParameter("Date")%>'>
						<input type="hidden" name="stime" value='<%=request.getParameter("sTime")%>'>
						<input type="hidden" name="etime" value='<%=request.getParameter("eTime")%>'>
						<input type="hidden" name="ordertime" value='<%=request.getParameter("orderTime")%>'>

						<!-- 上传按钮 -->
						<button type="submit" class="btn btn-danger"
							onclick="return Submit()">取消预定</button>
						<button type="button" class="btn" onclick="return Clear()">清空</button>

						<br />
						<%
							String flag = request.getParameter("reason");
							String tmp1 = "empty";
							if (tmp1.equals(flag))
								out.print("<div class=\"alert alert-warning text-center form-group\" role=\"alert\">请输入取消原因！</div>");
						%>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>