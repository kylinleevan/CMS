<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<title>知识产权</title>
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
        			window.location.href="./tb_ipr.jsp?inputbox=empty";
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
					<form class="form-horizontal" action="../../Tb_ipr"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label class="control-label">
							</label>
							授权发明专利名称:
							<input type="text" class="form-control" id="ipr_name"
								Name="ipr_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							专利号:
							<input type="text" class="form-control" id="ipr_num" Name="ipr_num" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							发明人:
							<input type="text" class="ipr_person" id="ipr_person"
								Name="tutor_name" />
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