<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<title>预订</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>

		<jsp:useBean id="room" class="JavaBean.DBBean" scope="page"></jsp:useBean>

		<%
			ResultSet rs = null;
		%>
	</head>

	<body>


		<%@ include file="../HEAD/header.jsp"%>
		<%
			Date[] date = new Date[7];
			String[] dateShow = new String[7];
			date[0] = new Date(); //当前日期
			Calendar calendar = Calendar.getInstance();
			for (int i = 0; i < date.length - 1; i++) {
				calendar.setTime(date[i]); //当前日期加入日历
				calendar.add(Calendar.DAY_OF_MONTH, +1);
				date[i + 1] = calendar.getTime(); //取得后一天的日期 
			}
			for (int i = 0; i < dateShow.length; i++) {
				dateShow[i] = (new SimpleDateFormat("yyyy-MM-dd"))
						.format(date[i]);
			}
		%>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form id="time_query" action="../../Boardroombytime" method="post"
					name="query">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-10">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date1"
										value="<%=dateShow[0]%>" checked>
									<%=dateShow[0]%>
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date2"
										value="<%=dateShow[1]%>">
									<%=dateShow[1]%>
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date3"
										value="<%=dateShow[2]%>">
									<%=dateShow[2]%>
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date4"
										value="<%=dateShow[3]%>">
									<%=dateShow[3]%>
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date5"
										value="<%=dateShow[4]%>">
									<%=dateShow[4]%>
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date6"
										value="<%=dateShow[5]%>">
									<%=dateShow[5]%>
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="date" id="date7"
										value="<%=dateShow[6]%>">
									<%=dateShow[6]%>
								</label>
							</div>
						</div>
					</div>
					<br />
					<br />
					<div class="row">
						<div class="col-md-5"></div>
						<div class="col-md-3">

							<select class="form-control input-lg" name="time">
								<%
									String sql1 = "select * from tb_time";
									rs = room.query(sql1);
									int i = 1;
									while (rs.next()) {
										if (i == 1)
											out.println("<option value='" + i
													+ "' selected='selected'>" + rs.getString("start")
													+ "~" + rs.getString("end") + "</option>");
										else
											out.println("<option value='" + i + "'>"
													+ rs.getString("start") + "~" + rs.getString("end")
													+ "</option>");
										i++;
									}
								%>
							</select>
						</div>
						<div class="col-md-4">
							<div class="row">
								<div class="col-md-1">
									<!--  	<button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='boardroombytime.jsp'">查询</button>-->
									<input type="submit" class="btn btn-primary btn-lg" value="查询" />
								</div>
								<div class="col-md-2">
									&nbsp;
								</div>
								<div class="col-md-1">
									<button type="button" class="btn btn-info btn-lg"
										onclick="window.location.href='boardroom.jsp'";>
										重置
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>

				<br>
				<br>

				<%
					String sql = "select * from tb_boardroom";
					rs = room.query(sql);
				%>
				<div class="row">
					<div class="col-md-2">
						&nbsp;
					</div>
					<div class="col-md-8">
						<div class="table-responsive">
							<table class="table table-bordered">
								<tr>
									<td>
										房间号
									</td>
									<td>
										容纳人数
									</td>
									<td>
										是否有多媒体
									</td>
									<td>
										备注
									</td>
									<td></td>
								</tr>
								<%
									while (rs.next()) {
										out.println("<tr>");
										out.println("<td>" + rs.getString("b_id") + "</td>");
										out.println("<td>" + rs.getString("b_size") + "</td>");
										if (rs.getString("media").equals("0"))
											out.println("<td>无多媒体</td>");
										else
											out.println("<td>有多媒体</td>");
										out.println("<td>" + rs.getString("remarks") + "</td>");
										out
												.println("<td><center><button type='button' class='btn btn-success'>"
														+ "查看可预订时间" + "</button></center></td>");
										out.println("</tr>");
									}
									rs.close();
									room.closeDB();
								%>
							</table>
						</div>

					</div>

				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</body>
</html>