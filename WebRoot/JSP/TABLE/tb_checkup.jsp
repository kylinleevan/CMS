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
				<div class="col-md-7">
					<!-- 下面是表单代码 -->
					<form class="form-horizontal" action="../../Tb_checkup"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label for="c_name" class="col-sm-3 control-label">
								成果名称
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="c_name"
									Name="c_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="c_date_1" class="col-sm-3 control-label">
								取得时间
							</label>
							<div class="col-sm-9">
								<div class="input-group">
									<input type="number" class="form-control" id="c_date_1"
										name="c_date_1">
									<div class="input-group-addon">
										年
									</div>
									<input type="number" class="form-control" id="c_date_2"
										name="c_date_2">
									<div class="input-group-addon">
										月
									</div>
									<input type="number" class="form-control" id="c_date_3"
										name="c_date_3">
									<div class="input-group-addon">
										日
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="c_dep" class="col-sm-3 control-label">
								鉴定或验收单位
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="c_dep" Name="c_dep" />
							</div>
						</div>
						<div class="form-group">
							<label for="c_advise" class="col-sm-3 control-label">
								主要鉴定或验收意见
							</label>
							<div class="col-sm-9">
								<textarea type="text" class="form-control" id="c_advise"
									Name="c_advise" rows="4"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="c_person" class="col-sm-3 control-label">
								主要完成人/名次
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="c_person"
									Name="c_person" />
							</div>
						</div>
						<div class="col-sm-3"></div>
						<div class="col-sm-9">
							<div class="form-group">
								<button type="submit" class="btn btn-block btn-primary"
									onclick="return Confirm1()">
									保存
								</button>
							</div>
						</div>
						<div class="col-sm-3"></div>
						<div class="col-sm-9">
							<div class="form-group">
								<a href="../INFO/infomanage.jsp" class="btn btn-block btn-info"
									role="button"> 返回 </a>
							</div>
						</div>
						<%
								String flag = request.getParameter("inputbox");
								String tmp = "empty";
								String ertmp = "errordate";
								if (tmp.equals(flag)) {
									out
											.print("<div class=\"col-sm-3\"></div><div class=\"col-sm-9\">");
									out
											.print("<div class=\"alert alert-warning text-center form-group\" role=\"alert\">请输入完整的信息</div>");
									out.print("</div>");
								}
							%>
					</form>
					<!-- 表单代码到这里结束 -->
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</body>
</html>