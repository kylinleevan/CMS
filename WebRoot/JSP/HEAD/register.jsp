<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<style>body {	padding-top: 50px;}</style>
		<title>注册</title>
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
        			window.location.href="register.jsp?password=empty";
            		return false;
        		}
    		}
    		if(a[2].value != a[3].value)
        		{
        			window.location.href="register.jsp?password=false";
            		return false;
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
						<a class="navbar-brand" href="register.jsp">学院管理系统</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="login.jsp">直接登录</a>
							</li>

						</ul>
					</div>
				</div>
			</div>
			</nav>
			<div class="col-md-4 col-md-offset-4">
				<h1 class="center-block text-center"
					style="max-width: 400px; position: relative">
					注册
				</h1>
				<div class="form-group">

					<form class="form-horizontal" action="../../Register" Name="form"
						method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label class="control-label">
							</label>
							<div>
								<input type="text" class="form-control" id="userID" Name="newID"
									placeholder="职工号">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							<div>
								<input type="text" class="form-control" id="userID"
									Name="newName" placeholder="姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="control-label">
							</label>
							<div>
								<input type="password" class="form-control" id="userPwd"
									Name="newPwd" placeholder="密码">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="control-label">
							</label>
							<div>
								<input type="password" class="form-control" id="userPwd"
									Name="checkpwd" placeholder="确认密码">
							</div>
						</div>
						<br />
						<div class="form-group">
							<div>
								<button type="submit" class="btn btn-block btn-primary"
									onclick="return Confirm()">
									注册
								</button>
							</div>
						</div>
						<br />
						<%
							String flag = request.getParameter("password");
							String tmp1 = "empty";
							String tmp2 = "false";
							if (tmp1.equals(flag))
								out
										.print("<div class=\"alert alert-warning text-center form-group\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>请输入完整的信息</div>");
							if (tmp2.equals(flag))
								out
										.print("<div class=\"alert alert-danger text-center form-group\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>两次密码不一致</div>");
						%>
					</form>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>
