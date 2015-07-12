<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<title>研究生培养</title>
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
        			window.location.href="./tb_train.jsp?inputbox=empty";
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
					<form class="form-horizontal" action="../../Tb_train"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label class="control-label">
							</label>
							年份:
							<input type="text" class="year" id="year"
								Name="std_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							招生人数合计:
							<input type="text" class="form-control" id="rs_all"
								Name="rs_all" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							招生人中留学生合计:
							<input type="text" class="form-control" id="rs_overstd" Name="rs_overstd" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							已授学位数合计:
							<input type="text" class="form-control" id="degree_all"
								Name="degree_all" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							已授学位中留学生合计:
							<input type="text" class="form-control" id="degree_overstd"
								Name="degree_overstd" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							<form action="" method="get"> 
							研究生类型<br /> 
							<label><input type="radio" name="role" id="role" value="1">博士生</label>
							<label><input type="radio" name="role" id="role" value="2">硕士生</label>
							</form> 
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-block btn-primary"
										onclick="return Confirm1()">
										保存
									</button>
						</div>
						<div class="form-group">
							<a href="../INFO/infomanage.jsp" class="btn btn-block btn-info" role="button">
								返回
							</a>
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