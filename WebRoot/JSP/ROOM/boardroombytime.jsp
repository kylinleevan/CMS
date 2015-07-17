<%@page import="javax.naming.spi.DirStateFactory.Result"%>
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
			Integer len = (Integer) request.getAttribute("length");
			int l = len.intValue();
			String bookroom[] = new String[l];
			for (int i = 1; i <= l; i++) {
				bookroom[i - 1] = new String();
				bookroom[i - 1] = (String) request.getAttribute("room" + i);
			}

			String date = (String) request.getAttribute("date");
			String time = (String) request.getAttribute("time");
		%>
	</head>

	<body>

		<%@ include file="../HEAD/header.jsp"%>
		<%
			Date[] date2 = new Date[7];
			String[] dateShow = new String[7];
			date2[0] = new Date(); //当前日期
			Calendar calendar = Calendar.getInstance();
			for (int i = 0; i < date2.length - 1; i++) {
				calendar.setTime(date2[i]); //当前日期加入日历
				calendar.add(Calendar.DAY_OF_MONTH, +1);
				date2[i + 1] = calendar.getTime(); //取得后一天的日期 
			}
			for (int i = 0; i < dateShow.length; i++) {
				dateShow[i] = (new SimpleDateFormat("yyyy-MM-dd"))
						.format(date2[i]);
			}
		%>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form id="time_query" action="Boardroombytime" method="post"
					name="query">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-10">
							<div class="btn-group" data-toggle="buttons">
								<%
									String[] active = new String[7];
									String[] checked = new String[7];
									for (int i = 0; i < 7; i++) {
										active[i] = "";
										checked[i] = "";
										if (date.equalsIgnoreCase(dateShow[i])) {
											active[i] = "active";
											checked[i] = "checked='checked'";
										}
									}
									for (int i = 0; i < 7; i++)
										out.print("<label class='btn btn-primary " + active[i]
												+ "'><input type='radio' name='date' id='date" + i
												+ "' value='" + dateShow[i] + "' " + checked[i] + ">"
												+ dateShow[i] + "</label>");
								%>
							</div>
						</div>
					</div>
					<br />
					<br />
						<div class="row">
							<div class="col-md-5"></div>
							<div class="col-md-3">

								<%
									String sql1 = "select * from tb_time";
									ResultSet rs1 = room.query(sql1);
								%>

								<select class="form-control input-lg" name="time">
									<%
										while (rs1.next()) {
											if (time.equals(rs1.getString("t_id"))) {
												out.println("<option value='" + rs1.getString("t_id")
														+ "' selected='selected'>" + rs1.getString("start")
														+ "~" + rs1.getString("end") + "</option>");
											} else
												out.println("<option value='" + rs1.getString("t_id")
														+ "'>" + rs1.getString("start") + "~"
														+ rs1.getString("end") + "</option>");

										}
									%>

								</select>

							</div>
							<div class="col-md-4">
								<div class="row">
									<div class="col-md-1">
										<input type="submit" class="btn btn-primary btn-lg" value="查询" />
									</div>
									<div class="col-md-2">
										&nbsp;
									</div>
									<div class="col-md-1">
									<button type="button" class="btn btn-info btn-lg"
										onclick="window.location.href= './JSP/ROOM/boardroom.jsp'";>
											重置
										</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<br/>
				<br/>
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
									String sql = "select * from tb_boardroom";
									rs = room.query(sql);
									boolean b = true;
									while (rs.next()) {
										for (int i = 0; i < l; i++) {
											if (bookroom[i].equals(rs.getString("b_id"))) {
												out.println("<form action='../CMS/JSP/ROOM/saveroom.jsp' Name='form"+i+"' method='post' onSubmit='return cheek()'> <tr>");
												out.print("<input type='hidden' id='Room'  name='Room' value='"+rs.getString("b_id")+"'/>");
												out.print("<input type='hidden' id='Date'  name='Date' value='"+date+"'/>");
												out.print("<input type='hidden' id='Time'  name='Time' value='"+time+"'/>");
												out.println("<td>" + rs.getString("b_id") + "</td>");
												out.println("<td>" + rs.getString("b_size") + "</td>");
												if (rs.getString("media").equals("0"))
													out.println("<td>无多媒体</td>");
												else
													out.println("<td>有多媒体</td>");
												out.println("<td>" + rs.getString("remarks") + "</td>");
												out
														.println("<td><center><button type='submit' class='btn btn-success'>现在预约</button></center></td>");
												out.println("</tr></form>");
												b = false;
											}
										}
										if (b) {
											out.println("<tr class='danger'>");
											out.println("<td>" + rs.getString("b_id") + "</td>");
											out.println("<td>" + rs.getString("b_size") + "</td>");
											if (rs.getString("media").equals("0"))
												out.println("<td>无多媒体</td>");
											else
												out.println("<td>有多媒体</td>");
											out.println("<td>" + rs.getString("remarks") + "</td>");
											out
													.println("<td><center><button type='button' class='btn btn-danger' disabled='disabled'>不可预约</button></center></td>");
											out.println("</tr>");
											b = false;
										}

									}
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

