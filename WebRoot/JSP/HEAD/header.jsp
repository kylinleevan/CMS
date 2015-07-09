<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet"
			href="http://localhost:8080/CMS/bootstrap/css/bootstrap.min.css">
		<script src="http://localhost:8080/CMS/bootstrap/js/jquery.min.js"></script>
		<script src="http://localhost:8080/CMS/bootstrap/js/bootstrap.js"></script>
		<style>body {padding-top: 50px;}</style>
	</head>
	<body>
		<%
			String s = (String) session.getAttribute("isLogined");
			String t = "true";
			if (!t.equals(s))
				response
						.sendRedirect("http://localhost:8080/CMS/JSP/HEAD/login.jsp");
		%>
		<nav class="navbar navbar-default navbar-fixed-top"
			style="height: 50px">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="http://localhost:8080/CMS/index.jsp">主页</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="http://localhost:8080/CMS/JSP/LIST/listroom.jsp"><p
										class="text-success">
										个人信息
									</p>
								</a>
							</li>
							<li>
								<a href="http://localhost:8080/CMS/Logout"><p
										class="text-danger">
										退出系统
									</p>
								</a>
							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<div class="col-md-2"></div>
				</div>
				<!-- /.container-fluid -->
				</nav>
			</div>
			<br />
		</div>
	</body>
</html>