<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
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
				<div class="col-md-3"></div>
				<div class="col-md-5">
					<!-- 下面是表单代码 -->
					<form class="form-horizontal" action="../../Tb_article"
						Name="form_article" method="post" onSubmit="return cheek()">
						<div class="form-group">
							<label for="std_name" class="col-sm-3 control-label">
								研究生姓名
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="std_name"
									Name="std_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="a_name" class="col-sm-3 control-label">
								论文名称
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="a_name"
									Name="a_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="tutor_name" class="col-sm-3 control-label">
								导师姓名
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="tutor_name"
									Name="tutor_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="win_year" class="col-sm-3 control-label">
								获奖年份
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="win_year"
									Name="win_year" />
							</div>
						</div>
						<div class="form-group">
							<label for="awards" class="col-sm-3 control-label">
								所获奖项
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="awards"
									Name="awards" />
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
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>

		<!-- 以下为测试代码 -->
<script>
        var row_count = 2;    //因为页面已经有一行了，为了和谐，所以直接从2开始。详细见pic

        function addNewRow() {
            var table1 = $("#time_table");
            var firstTr = table1.find("tbody>tr:first");
            var row = $("<tr></tr>");
            var td_1 = $("<td style='text-align: center;'></td>");
            td_1.append($("<input type='text' class='span1' id='onetime_start_nick' value='时段"+row_count+"' />"));
            row.append(td_1);
              table1.append(row);
            row_count++;
        }
        function addNewRow() {
            var table1 = $("#time_table");
            var firstTr = table1.find("tbody>tr:first");
            var row = $("<tr></tr>");
            var td = $("<input type='text' class='form-control' id='awards' Name='awards' />");
             row.append(td);
            table1.append(row);
            row_count++;
        }
        function del(e) {
            //获取选中的复选框，然后循环遍历删除
            var ckbs = $("#"+e+"");
            ckbs.each(function() {
                $(this).parent().parent().remove();
            });
        }
    </script>
    <form id="advForm">
                    <table id="time_table" class="table table-bordered">
                        <tbody>
                        <tr>
                        <input type="text" class="form-control" id="awards"
									Name="awards" />
									</tr><tr><button class="btn" onclick="addNewRow()">添加</button></tr>
                         </tbody>
                    </table>
                     <p align="center">
                         <button class="btn" style="width: 120px;" type="reset">  重置  </button>
                         <button class="btn btn-primary" style="width: 120px;" type="button">  保存  </button>
                     </p>
                </form>
            
		<!-- 以上为测试代码  -->
	</body>
</html>