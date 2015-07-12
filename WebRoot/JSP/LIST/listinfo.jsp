<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 声明listroomBean -->
<!-- 科研项目 -->
<jsp:useBean id="myRePoj" class="JavaBean.list.info.rePojBean"
	scope="request"></jsp:useBean>
<!--  研究生培养 （每年）-->
<jsp:useBean id="myTrain" class="JavaBean.list.info.trainBean"
	scope="request"></jsp:useBean>
<!--  研究生获优秀学位论文情况-->
<jsp:useBean id="myArticle" class="JavaBean.list.info.articleBean"
	scope="request"></jsp:useBean>
<!--  研究生获国家、江苏省科研创新计划资助情况-->
<jsp:useBean id="mySupport" class="JavaBean.list.info.supportBean"
	scope="request"></jsp:useBean>
<!--  团队建设-->
<jsp:useBean id="myGroupBuild" class="JavaBean.list.info.groupBuildBean"
	scope="request"></jsp:useBean>
<!--  出版教材-->
<jsp:useBean id="myBook" class="JavaBean.list.info.bookBean"
	scope="request"></jsp:useBean>
<!--  知识产权-->
<jsp:useBean id="myIpr" class="JavaBean.list.info.iprBean"
	scope="request"></jsp:useBean>
<!--  成果验收鉴定-->
<jsp:useBean id="myCheckup" class="JavaBean.list.info.checkupBean"
	scope="request"></jsp:useBean>
<!--  简主办学术会议情况-->
<jsp:useBean id="myMeeting" class="JavaBean.list.info.meetingBean"
	scope="request"></jsp:useBean>
<!--  教师境外进修（合作研究）情况-->
<jsp:useBean id="myForeign" class="JavaBean.list.info.foreignBean"
	scope="request"></jsp:useBean>

<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<title>个人信息[学院信息上传]</title>
</head>

<body>
	<%@ include file="../HEAD/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation"><a href="listroom.jsp">我的预约</a></li>
					<li role="presentation" class="active"><a href="listinfo.jsp">我的上传</a>
					</li>
				</ul>


				<!-- 获取查询结果集合 -->
				<%
					boolean sign = myRePoj.init(userID);
					myRePoj.query(userID, sign);
				%>

				<%
					if (sign) {
						out.println("<br><h3><b>您好，您共有" + myRePoj.getrePojNumber()
								+ "条上传信息。</b></h3>"
								+ "<font color=red>(绿色为已上传信息，蓝色为未上传信息。)</font><br>");
						if (myRePoj.getrePojNumber() > 0) {
							request.setAttribute("color", "btn btn-success");
						} else {
							request.setAttribute("color", "btn btn-primary");
						}
				%>
				<br>
				<div class="container">
					<button type="button" class='<%=request.getAttribute("color")%>'
						data-toggle="collapse" data-target="#rePoj">科研项目<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="rePoj" class="collapse">
						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>项目编号</th>
								<th>项目名称</th>
								<th>项目来源</th>
								<th>起讫时间</th>
								<th>承担人</th>
								<th>经费（万元）</th>
								<th><font color=red>上传日期</font></th>
								<th><font color=blue><p class="text-center">操作</p></font></th>
								
							</tr>
							<%
								for (int i = 0; i < myRePoj.getrePojNumber(); i++) {
							%>
							<tr>
								<td><%=myRePoj.getrId(i)%></td>
								<td><%=myRePoj.getrSerial(i)%></td>
								<td><%=myRePoj.getrName(i)%></td>
								<td><%=myRePoj.getrSource(i)%></td>
								<td><%=myRePoj.getStartTime(i)%>---<%=myRePoj.getEndTime(i)%></td>
								<td><%=myRePoj.getPerson(i)%></td>
								<td><%=myRePoj.getFee(i)%></td>
								<td></td>
								<td><p class="text-center"><a href='../ROOM/boardroom.jsp'><button
								type='button' class='btn btn-warning'>更新信息</button></a>
								<a href='../ROOM/boardroom.jsp'><button
								type='button' class='btn btn-danger'>删除信息</button></a></p>
								</td>
							</tr>
							<%
								}
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button>
						</a>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#train">研究生培养 （每年）<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="train" class="collapse">
						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>项目编号</th>
								<th>项目名称</th>
								<th>项目来源</th>
								<th>起讫时间</th>
								<th>承担人</th>
								<th>经费（万元）</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#article">优秀学位论文<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="article" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>研究生姓名</th>
								<th>论文名称</th>
								<th>导师姓名</th>
								<th>获奖年份</th>
								<th>奖项</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#support">资助情况<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="support" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>研究生姓名</th>
								<th>项目名称</th>
								<th>导师姓名</th>
								<th>年份</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#groupBuild">团队建设<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="groupBuild" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>姓名</th>
								<th>出生年月</th>
								<th>最后学位、学历</th>
								<th>专业技术职务</th>
								<th>人才称号</th>
								<th>主要学术职务</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#book">出版教材<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="book" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>名称</th>
								<th>出版时间</th>
								<th>出版单位</th>
								<th>作者/名次</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#ipr">知识产权<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="ipr" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>授权发明专利（含国际专利）</th>
								<th>专利号</th>
								<th>发明人</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#checkup">成果验收鉴定<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="checkup" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>成果名称</th>
								<th>取得时间</th>
								<th>鉴定或验收单位</th>
								<th>主要鉴定或验收意见</th>
								<th>主要完成人/名次</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#meeting">学术会议<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="meeting" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>会议名称</th>
								<th>时间</th>
								<th>地点</th>
							</tr>
						</table>
					</div>
				</div>
				<br>

				<div class="container">
					<button type="button" class="btn btn-primary"
						data-toggle="collapse" data-target="#foreign">境外进修<h2><%=myRePoj.getrePojNumber() %></h2></button>
					<div id="foreign" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>姓名</th>
								<th>国外机构名称</th>
								<th>时间</th>
								<th>进修（合作）内容</th>
							</tr>
						</table>
					</div>
				</div>
				<br>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>