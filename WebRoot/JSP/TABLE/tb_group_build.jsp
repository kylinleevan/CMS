<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<title>团队建设</title>
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
        			window.location.href="./tb_group_build.jsp?inputbox=empty";
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
					<form class="form-horizontal" action="../../Tb_group_build"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label class="control-label">
							</label>
							团队姓名:
							<input type="text" class="form-control" id="g_name"
								Name="g_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							出生年月:
							<input type="text" class="form-control" id="birth" Name="birth" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							获得学位:
							<input type="text" class="form-control" id="degreee"
								Name="degree" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							专业技术职务:
							<input type="text" class="form-control" id="protech"
								Name="prothch" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							人才称号:
							<input type="text" class="form-control" id="p_id" Name="p_id" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							主要学术职务:
							<input type="text" class="form-control" id="adpost" Name="adpost" />
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