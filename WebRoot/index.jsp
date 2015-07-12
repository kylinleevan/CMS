<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
		<script src="./bootstrap/js/jquery.min.js"></script>
		<script src="./bootstrap/js/bootstrap.js"></script>
		<title>学院管理系统</title>
	</head>
	<body>
		<%@ include file="./JSP/HEAD/header.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-xs-6 col-md-4">
							<div class="list-group">
								<a href="./JSP/ROOM/boardroom.jsp"
									class="list-group-item active">
									<h1 class="list-group-item-heading text-center">
										会议室预订
									</h1> </a>
							</div>
						</div>
						<div class="col-xs-6 col-md-4">

							<div class="list-group">
								<a href="./JSP/INFO/infomanage.jsp"
									class="list-group-item active">
									<h1 class="list-group-item-heading text-center">
										信息发布
									</h1> </a>
							</div>
						</div>
						<div class="col-xs-6 col-md-4">
							<div class="list-group">
								<a href="./JSP/LIST/listroom.jsp" class="list-group-item active">
									<h1 class="list-group-item-heading text-center">
										信息管理
									</h1> </a>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</body>
</html>