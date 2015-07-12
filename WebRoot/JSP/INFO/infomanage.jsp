<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<title>学院管理系统</title>
	</head>
	<body>
		<%@ include file="../../JSP/HEAD/header.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="list-group">
						<a href="../TABLE/tb_article.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								研究生获优秀学位论文情况
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_book.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								出版教材
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_checkup.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								成果验收鉴定
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_foreign.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								教师境外进修（合作研究）情况
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_group_build.jsp"
							class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								团队建设
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_ipr.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								知识产权
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_meeting.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								学术会议
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_re_poj.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								科研训练
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_support.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								研究生获国家、江苏省科研创新计划资助情况
							</h1> </a>
					</div>
					<div class="list-group">
						<a href="../TABLE/tb_train.jsp" class="list-group-item active">
							<h1 class="list-group-item-heading text-center">
								研究生培养
							</h1> </a>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</body>
</html>