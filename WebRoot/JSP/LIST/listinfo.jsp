<%@page import="JavaBean.list.info.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 声明listinfoBeans -->
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
					<li role="presentation"><a href="listroom.jsp">我的预约</a>
					</li>
					<li role="presentation" class="active"><a href="listinfo.jsp">我的上传</a>
					</li>
				</ul>
				<!-- 获取查询结果集合 -->
				<%
					//科研项目
					boolean rePojSign = myRePoj.init(userID);
					myRePoj.query(userID, rePojSign);
					//研究生培养 （每年）
					boolean trainSign = myTrain.init(userID);
					myTrain.query(userID, trainSign);
					//研究生获优秀学位论文情况
					boolean articleSign = myArticle.init(userID);
					myArticle.query(userID, articleSign);
					//研究生获国家、江苏省科研创新计划资助情况
					boolean supportSign = mySupport.init(userID);
					mySupport.query(userID, supportSign);
					//团队建设
					boolean groupBuildsign = myGroupBuild.init(userID);
					myGroupBuild.query(userID, groupBuildsign);
					//出版教材
					boolean bookSign = myBook.init(userID);
					myBook.query(userID, bookSign);
					//知识产权
					boolean iprSign = myIpr.init(userID);
					myIpr.query(userID, iprSign);
					//成果验收鉴定
					boolean checkupSign = myCheckup.init(userID);
					myCheckup.query(userID, checkupSign);
					//简主办学术会议情况
					boolean meetingSign = myMeeting.init(userID);
					myMeeting.query(userID, meetingSign);
					//教师境外进修（合作研究）情况
					boolean foreignSign = myForeign.init(userID);
					myForeign.query(userID, foreignSign);
				%>
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->
				<%
					int totalNumber = myRePoj.getrePojNumber()
							+ myTrain.getTrainNumber() + myArticle.getArticleNumber()
							+ mySupport.getSupportNumber()
							+ myGroupBuild.getGroupBuildNumber()
							+ myBook.getBookNumber() + myIpr.getIprNumber()
							+ myCheckup.getCheckupNumner()
							+ myMeeting.getMeetingNumber()
							+ myForeign.getForeignNumnber();
				%><br><br>
				<div class='alert alert-info text-center form-group' role='alert'>
					<h2>
						<b>您好，您共有<%=totalNumber %>条上传信息。</b>
					</h2>
					<font color=red>(绿色为已上传信息，蓝色为未上传信息。)</font><br>
				</div>
				<div class="container">

					<%
						//00000000000000000000000000000000000000000000000000
						if (myRePoj.getrePojNumber() > 0) {
							request.setAttribute("rePojColor", "btn btn-success");
						} else {
							request.setAttribute("rePojColor", "btn btn-primary");
						}
					%>
					<%
						//1111111111111111111111111
						if (myTrain.getTrainNumber() > 0) {
							request.setAttribute("trainColor", "btn btn-success");
						} else {
							request.setAttribute("trainColor", "btn btn-primary");
						}
					%>
					<%
						//2222222222222222222222222222222222
						if (myArticle.getArticleNumber() > 0) {
							request.setAttribute("articleColor", "btn btn-success");
						} else {
							request.setAttribute("articleColor", "btn btn-primary");
						}
					%>
					<%
						//3333333333333333333333333333333333333333333333333333
						if (mySupport.getSupportNumber() > 0) {
							request.setAttribute("supportColor", "btn btn-success");
						} else {
							request.setAttribute("supportColor", "btn btn-primary");
						}
					%>
					<%
						//4444444444444444444444444444444444444444444444444444444444
						if (myGroupBuild.getGroupBuildNumber() > 0) {
							request.setAttribute("groupBuildColor", "btn btn-success");
						} else {
							request.setAttribute("groupBuildColor", "btn btn-primary");
						}
					%>
					<%
						//5555555555555555555555555555555555555555555555555
						if (myBook.getBookNumber() > 0) {
							request.setAttribute("bookColor", "btn btn-success");
						} else {
							request.setAttribute("bookColor", "btn btn-primary");
						}
					%>
					<%
						//66666666666666666666666666666666666666666666666666
						if (myIpr.getIprNumber() > 0) {
							request.setAttribute("iprColor", "btn btn-success");
						} else {
							request.setAttribute("iprColor", "btn btn-primary");
						}
					%>
					<%
						//77777777777777777777777777777777777777777777777777777777
						if (myCheckup.getCheckupNumner() > 0) {
							request.setAttribute("checkupColor", "btn btn-success");
						} else {
							request.setAttribute("checkupColor", "btn btn-primary");
						}
					%>
					<%
						//888888888888888888888888888888888888888888888888888888888888
						if (myMeeting.getMeetingNumber() > 0) {
							request.setAttribute("meetingColor", "btn btn-success");
						} else {
							request.setAttribute("meetingColor", "btn btn-primary");
						}
					%>
					<%
						//999999999999999999999999999999999999999999999
						if (myForeign.getForeignNumnber() > 0) {
							request.setAttribute("foreignColor", "btn btn-success");
						} else {
							request.setAttribute("foreignColor", "btn btn-primary");
						}
					%>
					<button type="button"
						class='<%=request.getAttribute("rePojColor")%>'
						data-toggle="collapse" data-target="#rePoj">
						科研项目
						<h2><%=myRePoj.getrePojNumber()%></h2>
					</button>
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
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作 </font></p>
								</th>

							</tr>
							<%
								if (rePojSign) {
							%>
							<%
								for (int i = 0; i < myRePoj.getrePojNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myRePoj.getrSerial(i)%></td>
								<td><%=myRePoj.getrName(i)%></td>
								<td><%=myRePoj.getrSource(i)%></td>
								<td><%=myRePoj.getStartTime(i)%>---<%=myRePoj.getEndTime(i)%></td>
								<td><%=myRePoj.getPerson(i)%></td>
								<td><%=myRePoj.getFee(i)%></td>
								<td><%=myRePoj.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form0<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key" value='<%=myRePoj.getrId(i)%>'>
										<input type="hidden" name="flag" value="0">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form0<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form0<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>
				<!-- 111111111111111111111111111111111111111111111111111111111111111111111111111 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->

				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("trainColor")%>"
						data-toggle="collapse" data-target="#train">
						研究生培养 （每年）
						<h2><%=myTrain.getTrainNumber()%></h2>
					</button>
					<div id="train" class="collapse">
						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>年份</th>
								<th>角色</th>
								<th>招生数（合计）</th>
								<th>留学生比重</th>
								<th>已授学位数（合计）</th>
								<th>留学生比重</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>

							<%
								if (trainSign) {
							%>
							<%
								for (int i = 0; i < myTrain.getTrainNumber(); i++) {
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><%=myTrain.getYear(i)%></td>
								<td><%=myTrain.getRole(i) %></td>
								<td><%=myTrain.getRsAll(i) %></td>
								<td><%=myTrain.getRsOverStd(i) %></td>
								<td><%=myTrain.getDegreeAll(i) %></td>
								<td><%=myTrain.getDegreeOverStd(i) %></td>
								<td><%=myTrain.getPublishTime(i) %></td>
								<td><form class="form-horizontal" name="form1<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=myTrain.getYear(i)%>'> <input type="hidden"
											name="flag" value="1">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form1<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form1<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>



						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>
				<!-- 33333333333333333333333333333333333333333333333333333333333333333333333 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->
				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("articleColor")%>"
						data-toggle="collapse" data-target="#article">
						优秀学位论文
						<h2><%=myArticle.getArticleNumber()%></h2>
					</button>
					<div id="article" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>研究生姓名</th>
								<th>论文名称</th>
								<th>导师姓名</th>
								<th>获奖年份</th>
								<th>奖项</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%
								if (articleSign) {
							%>
							<%
								for (int i = 0; i < myArticle.getArticleNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myArticle.getStdName(i)%></td>
								<td><%=myArticle.getaName(i)%></td>
								<td><%=myArticle.getTutorName(i)%></td>
								<td><%=myArticle.getAwards(i)%></td>
								<td><%=myArticle.getWinYear(i)%></td>
								<td><%=myArticle.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form2<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=myArticle.getaId(i)%>'> <input
											type="hidden" name="flag" value="2">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form2<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form2<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>

				<!-- 333333333333333333333333333333333333333333333333333333333333333333 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->


				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("supportColor")%>"
						data-toggle="collapse" data-target="#support">
						资助情况
						<h2><%=mySupport.getSupportNumber()%></h2>
					</button>
					<div id="support" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>研究生姓名</th>
								<th>项目名称</th>
								<th>项目等级</th>
								<th>导师姓名</th>
								<th>年份</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%
								if (supportSign) {
							%>
							<%
								for (int i = 0; i < mySupport.getSupportNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=mySupport.getStd(i)%></td>
								<td><%=mySupport.getPojName(i)%></td>
								<td><%=mySupport.getType(i)%></td>
								<td><%=mySupport.getTutorName(i)%></td>
								<td><%=mySupport.getYear(i)%></td>
								<td><%=mySupport.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form3<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=mySupport.getsId(i)%>'> <input
											type="hidden" name="flag" value="3">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form3<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form3<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>

				<!-- 4444444444444444444444444444444444444444444444444444444444444444444 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->

				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("groupBuildColor")%>"
						data-toggle="collapse" data-target="#groupBuild">
						团队建设
						<h2><%=myGroupBuild.getGroupBuildNumber()%></h2>
					</button>
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
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%
								if (groupBuildsign) {
							%>
							<%
								for (int i = 0; i < myGroupBuild.getGroupBuildNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myGroupBuild.getgName(i)%></td>
								<td><%=myGroupBuild.getBirth(i)%></td>
								<td><%=myGroupBuild.getDegree(i)%></td>
								<td><%=myGroupBuild.getProTech(i)%></td>
								<td><%=myGroupBuild.getpId(i)%></td>
								<td><%=myGroupBuild.getAdPost(i)%></td>
								<td><%=myGroupBuild.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form4<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=myGroupBuild.getgId(i)%>'> <input
											type="hidden" name="flag" value="4">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form4<%=i%>.action='updateinfo.jsp">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form4<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>

				<!-- 55555555555555555555555555555555555555555555555555555555555555555555555555555 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->


				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("bookColor")%>"
						data-toggle="collapse" data-target="#book">
						出版教材
						<h2><%=myBook.getBookNumber()%></h2>
					</button>
					<div id="book" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>名称</th>
								<th>条码号</th>
								<th>出版时间</th>
								<th>出版单位</th>
								<th>作者/名次</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%
								if (bookSign) {
							%>
							<%
								for (int i = 0; i < myBook.getBookNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myBook.getBookName(i)%></td>
								<td><%=myBook.getBookId(i)%></td>
								<td><%=myBook.getpDate(i)%></td>
								<td><%=myBook.getpDep(i)%></td>
								<td><%=myBook.getAuthor(i)%></td>
								<td><%=myBook.getPublisherTime(i)%></td>

								<td><form class="form-horizontal" name="form5<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key" value='<%=myBook.getbId(i)%>'>
										<input type="hidden" name="flag" value="5">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form5<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form5<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br> <br>

				<!--  6666666666666666666666666666知识产权66666666666666666666666666666666666666666666666666666666666-->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->

				<div class="container">
					<button type="button" class='<%=request.getAttribute("iprColor")%>'
						data-toggle="collapse" data-target="#ipr">
						知识产权
						<h2><%=myIpr.getIprNumber()%></h2>
					</button>
					<div id="ipr" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>授权发明专利（含国际专利）</th>
								<th>专利号</th>
								<th>发明人</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%=myIpr.getIprNumber()%>
							<%
								if (iprSign) {
							%>
							<%
								for (int i = 0; i < myIpr.getIprNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myIpr.getIprName(i)%></td>
								<td><%=myIpr.getIprNum(i)%></td>
								<td><%=myIpr.getIprPerson(i)%></td>
								<td><%=myIpr.getPublishTime(i)%></td>
								<td>
									<form class="form-horizontal" name="form6<%=i%>" method="post"
										onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key" value='<%=myIpr.getIprId(i)%>'>
										<input type="hidden" name="flag" value="6">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form6<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form6<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>

						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>


				<!-- 77777777777777777777777777成果验收鉴定77777777777777777777777777777777777777777777777777777777777 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->


				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("checkupColor")%>"
						data-toggle="collapse" data-target="#checkup">
						成果验收鉴定
						<h2><%=myCheckup.getCheckupNumner()%></h2>
					</button>
					<div id="checkup" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>成果名称</th>
								<th>取得时间</th>
								<th>鉴定或验收单位</th>
								<th>主要鉴定或验收意见</th>
								<th>主要完成人/名次</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p> 
							</tr>
							<%
								if (checkupSign) {
							%>
							<%
								for (int i = 0; i < myCheckup.getCheckupNumner(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myCheckup.getcName(i)%></td>
								<td><%=myCheckup.getcDate(i)%></td>
								<td><%=myCheckup.getcDept(i)%></td>
								<td><%=myCheckup.getcAdvise(i)%></td>
								<td><%=myCheckup.getcPerson(i)%></td>
								<td><%=myCheckup.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form7<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=myCheckup.getcId(i)%>'> <input
											type="hidden" name="flag" value="7">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form7<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form7<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>
				<!-- 88888888888888888888888888888888888888888888888888888888888888888888888888888888 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->

				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("meetingColor")%>"
						data-toggle="collapse" data-target="#meeting">
						学术会议
						<h2><%=myMeeting.getMeetingNumber()%></h2>
					</button>
					<div id="meeting" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>会议名称</th>
								<th>时间</th>
								<th>地点</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%
								if (meetingSign) {
							%>
							<%
								for (int i = 0; i < myMeeting.getMeetingNumber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myMeeting.getmName(i)%></td>
								<td><%=myMeeting.getmPlace(i)%></td>
								<td><%=myMeeting.getmPlace(i)%></td>
								<td><%=myMeeting.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form8<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=myMeeting.getmId(i)%>'> <input
											type="hidden" name="flag" value="8">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form8<%=i%>.action='updateinfo.jsp'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form8<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>

				<!-- 999999999999999999999999999999999999999999999999999999999999999999999999999 -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->

				<div class="container">
					<button type="button"
						class="<%=request.getAttribute("foreignColor")%>"
						data-toggle="collapse" data-target="#foreign">
						境外进修
						<h2><%=myForeign.getForeignNumnber()%></h2>
					</button>
					<div id="foreign" class="collapse">

						<table class="table table-hover">
							<tr>
								<th>#</th>
								<th>姓名</th>
								<th>国外机构名称</th>
								<th>时间</th>
								<th>进修（合作）内容</th>
								<th><font color=red>上传日期</font>
								</th>
								<th><p class="text-center"><font color=blue>操作</font></p>
							</tr>
							<%
								if (foreignSign) {
							%>
							<%
								for (int i = 0; i < myForeign.getForeignNumnber(); i++) {
							%>
							<tr>
								<td><%=i + 1%></td>
								<td><%=myForeign.getfName(i)%></td>
								<td><%=myForeign.getOrgName(i)%></td>
								<td><%=myForeign.getfDate(i)%></td>
								<td><%=myForeign.getContent(i)%></td>
								<td><%=myForeign.getPublishTime(i)%></td>
								<td><form class="form-horizontal" name="form9<%=i%>"
										method="post" onSubmit="return cheek()">
										<!-- 传递接收数据表的键参数及表的标识 -->
										<input type="hidden" name="key"
											value='<%=myForeign.getfId(i)%>'> <input
											type="hidden" name="flag" value="9">
										<p class="text-center">
											<button type='submit' class='btn btn-warning'
												onclick="document.form9<%=i%>.action='../../DeleteInfo'">更新信息</button>
											<button type='submit' class='btn btn-danger'
												onClick="document.form9<%=i%>.action='../../DeleteInfo'">删除信息</button>
										</p>
									</form></td>
							</tr>
							<%
								}
								} else {
									out.print("<br><br><div class=\"alert alert-danger text-center form-group\" role=\"alert\">"
											+ "<h2><b>您目前还没有上传相关信息！</b></h2></div>");
								}
							%>
						</table>
						<br> <a href='../INFO/infomanage.jsp'><button
								type='button' class='btn btn-danger'>继续上传</button> </a>
					</div>
				</div>
				<br>
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->
				<!-- ******************************************************************************************** -->
			</div>

			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>