<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
		<script src="../bootstrap/js/jquery.min.js"></script>
		<script src="../bootstrap/js/bootstrap.js"></script>
		<title>研究生获优秀学位论文情况发布</title>
	</head>
	<body>
		<%@ include file="../HEAD/header.jsp"%>
		<!-- 下面是表单验证 -->
		<script type="text/javascript">
		function Confirm1()
		{
			var a = document.getElementsByTagName("input");
    		for(var i = 0; i < a.length; i++)
    		{
    			if(a[i].value == "")
        		{
        			window.location.href="./tb_article.jsp?inputbox=empty";
            		return false;
        		}
    		}
    		return true;
		}
		</script>
		<!-- 以上是表单验证 -->
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<!-- 下面是表单代码 -->
					<form class="form-horizontal" action="../../Tb_article"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label class="control-label">
							</label>
							研究生姓名:
							<input type="text" class="form-control" id="std_name"
								Name="std_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							论文名称:
							<input type="text" class="form-control" id="a_name" Name="a_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							导师姓名:
							<input type="text" class="form-control" id="tutor_name"
								Name="tutor_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							获奖年份:
							<input type="text" class="form-control" id="win_year"
								Name="win_year" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							所获奖项:
							<input type="text" class="form-control" id="awards" Name="awards" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-block btn-primary"
										onclick="return Confirm1()">
										保存
									</button>
						</div>
					<%
						String flag = request.getParameter("inputbox");
						String tmp = "empty";
						if (tmp.equals(flag))
							out
									.print("<div class=\"alert alert-warning text-center form-group\" role=\"alert\">请输入完整的信息</div>");
					%>
					</form>
					<!-- 表单代码到这里结束 -->
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</body>
</html>