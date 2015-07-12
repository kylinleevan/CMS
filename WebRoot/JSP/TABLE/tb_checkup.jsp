<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<title>成果验收鉴定</title>
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
        			window.location.href="./tb_checkup.jsp?inputbox=empty";
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
					<form class="form-horizontal" action="../../Tb_checkup"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label class="control-label">
							</label>
							成果名称:
							<input type="text" class="form-control" id="c_name"
								Name="c_name" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							取得时间:
							<input type="text" class="form-control" id="c_date" Name="c_date" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							鉴定或验收单位:
							<input type="text" class="form-control" id="c_dep"
								Name="c_dep" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							主要鉴定或验收意见:
							<input type="text" class="form-control" id="c_advise"
								Name="c_advise" />
						</div>
						<div class="form-group">
							<label class="control-label">
							</label>
							主要完成人/名次:
							<input type="text" class="form-control" id="c_person" Name="c_person" />
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