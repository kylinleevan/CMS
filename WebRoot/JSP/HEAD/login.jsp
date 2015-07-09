<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<title>登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<style>body {	padding-top: 50px;}</style>
		<title>登录</title>
	</head>

	<body>
		<script type="text/javascript">
		function Confirm()
		{
			var a = document.getElementsByTagName("input");
    		for(var i = 0; i < a.length; i++)
    		{
    			if((a[i].type == "text" || a[i].type == "password") && a[i].value == "")
        		{
        			window.location.href="./login.jsp?password=empty";
            		return false;
        		}
    		}
    		return true;
		}
		</script>

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
						<a class="navbar-brand" href="login.jsp">学院管理系统</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a data-toggle="modal" data-target="#myModal"><p class="text-success">提示</p></a>
							</li>
							<li>
								<a href="register.jsp"><p class="text-success">注册</p></a>
							</li>

						</ul>
					</div>
				</div>
			</div>
			</nav>
			<div class="modal fade" id="myModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span>&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								提示
							</h4>
						</div>
						<div class="modal-body">
							<ul>
								<li>
									初始的用户名为 10000
								</li>
								<li>
									密码为 123456
								</li>
								<li>
									忘记密码请联系管理员
								</li>
							</ul>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">
								确定
							</button>
						</div>
					</div>
				</div>
			</div>
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
							style="max-width: 400px; position: relative">
							请先登录
						</h1>
						<div class="form-group">

							<form class="form-horizontal" action="../../Login" Name="form"
								method="post" onSubmit="return cheek()">
								<div class="form-group">
									<label class="control-label">
									</label>
									<input type="text" class="form-control" id="userID"
										Name="userID" placeholder="登录账号">
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="control-label">
									</label>
									<input type="password" class="form-control warning"
										id="userPwd" Name="userPwd" placeholder="密码">
								</div>
								<br />
								<div class="form-group">
									<button type="submit" class="btn btn-block btn-primary"
										onclick="return Confirm()">
										登录
									</button>
								</div>
								<br />
								<%
									String flag = request.getParameter("password");
									String tmp1 = "empty";
									String tmp2 = "false";
									if (tmp1.equals(flag))
										out
												.print("<div class=\"alert alert-warning text-center form-group\" role=\"alert\">请输入完整的用户名和密码</div>");
									if (tmp2.equals(flag))
										out
												.print("<div class=\"alert alert-danger text-center form-group\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>登录名或密码错误</div>");
								%>
							</form>
						</div>
					</div>
				</div>
			</div>
	</body>
</html>