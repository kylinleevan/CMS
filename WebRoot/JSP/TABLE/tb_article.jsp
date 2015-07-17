<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript" src="../../jQuery/jQuery.js"></script>
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

							<table class="table table-bordered">
								<tr>
									<td>
										<ul id="demo4"></ul>
										<a href="#" type="button" class="btn btn-primary">添加一个获奖信息</a>
									</td>
								</tr>
							</table>
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
<script type="text/javascript">
$(function(){
	$("#demo1").easyinsert();//最简单的应用
	$("#demo2").easyinsert({
		name: ["demo2", "demo2"],//可以同时添加两个（或更多），name值相同也必须分开设置，name数组的长度就是每组input的个数。type、value、maxlength、className四种属性，若同组组员的设置一样，可以只设置一次。
		value: ["默认值2-1", "默认值2-2"],//可以给同组input分别设置默认值
		maxlength: 15,//每组input的maxlength都一样，无需使用数组
		className: ["demo2_class1", "demo2_class2"],//不用我解释了吧
		toplimit: 5,//可以添加组数上限（默认是0，表示无上限），它是总管，so，name相当于小组组长
		initValue: [//初始化的时候，各input的value就是归它管，必须是数组
			["初始值2-1", "初始值2-2"]
		]
	});
	$("#demo3").easyinsert({
		name: "demo3",
		toplimit: 2,
		initValue: [
			["初始值3-1"],//必须是数组，就算每组只有一个input
			["初始值3-2"],
			["初始值3-3"]//小三儿，别想蒙混过关，总管只允许添加两组
		]
	});
	$("#demo4").easyinsert({
		name: ["win_year", "awards"],
		type: ["t1", "t2"],
		value: ["", ""]
	});
	$("#demo5").easyinsert({//type新增custom和select
		name: ["demo5", "demo5", "demo5", "demo5"],
		type: ["custom", "text", "custom", "select"],
		value: ["<strong style=\"color:#ff7b0e;\">科目：</strong>", "", "<strong style=\"color:#ff7b0e;\">类型：</strong>", { '理论': '1', '技能': '2', '上机': '3' }],
		initValue: [
			["<strong style=\"color:#ff7b0e;\">科目：</strong>", "初始值5-1", "<strong style=\"color:#ff7b0e;\">类型：</strong>", { '理论a': '1', '技能a': '2', '上机a': '3' }],
			["<strong style=\"color:#ff7b0e;\">科目：</strong>", "初始值5-1", "<strong style=\"color:#ff7b0e;\">类型：</strong>", { '理论b': '1', '技能b': '2', '上机b': '3' }]
		]
	});
});
;(function($){
	$.fn.extend({
		"easyinsert": function(o){
			o = $.extend({
				//触发器
				clicker: null,//根据class（或id）选择，默认.next()获取
				//父标签
				wrap: "li",
				name: "i-text",
				type: "text",
				value: "",
				maxlength: 20,
				className: "i-text",
				//新增上限值
				toplimit: 0,//0表示不限制
				//初始化值，二维数组
				initValue: null//用于修改某资料时显示已有的数据
			}, o || {});
			var oo = {
				remove: "<a href=\"#nogo\" class=\"remove btn btn-warning btn-xs\">移除此获奖信息</a>",
				error1: "参数配置错误，数组的长度不一致，请检查。",
				error2: "参数配置错误，每组初始化值都必须是数组，请检查。"
			}
			//容器
			var $container = $(this);
			var allowed = true;
			//把属性拼成数组（这步不知道是否可以优化？）
			var arrCfg = new Array(o.name, o.type, o.value, o.maxlength, o.className);
			//arr ==> [name, type, value, maxlength, className]
			var arr = new Array();
			$.each(arrCfg, function(i, n){
				if ( $.isArray(n) ) {
					arr[i] = n;
				} else {
					arr[i] = new Array();
					if ( i === 0 ) {
						arr[0].push(n);
					}else{
						//补全各属性数组（根据name数组长度）
						$.each(arr[0], function() {
							arr[i].push(n);
						});
					}
				}
				//判断各属性数组的长度是否一致
				if ( arr[i].length !== arr[0].length ) {
					allowed = false;
					$container.text(oo.error1);
				}
			});
			if ( allowed ) {
				//获取触发器
				var $Clicker = !o.clicker ? $container.next() : $(o.clicker);
				$Clicker.bind("click", function() {
					//未添加前的组数
					var len = $container.children(o.wrap).length;
					//定义一个变量，判断是否已经达到上限
					var isMax = o.toplimit === 0 ? false : (len < o.toplimit ? false : true);
					if ( !isMax ) {//没有达到上限才允许添加
						var $Item = $("<"+ o.wrap +">").appendTo( $container );
						$.each(arr[0], function(i) {
							switch ( arr[1][i] ) {
								case "select"://下拉框
									var option = "";
									$.each(arr[2][i], function(i, n) {
										option += "<option value='"+ n +"'>"+ i +"</option>";
									});
									$("<select>", {
										name: arr[0][i],
										className: arr[4][i]
									}).append( option ).appendTo( $Item );
									break;
								case "custom"://自定义内容，支持html
									$Item.append( arr[2][i] );
									break;
								case "t1"://自定义内容，支持html
									$("<input type='number' class='form-control' placeholder='获奖年份'><br/>", {//jQuery1.4新增方法
										name: arr[0][i],
										type: arr[1][i],
										value: arr[2][i],
										maxlength: arr[3][i],
										className: arr[4][i]
									}).appendTo( $Item );
									break;
								case "t2"://自定义内容，支持html
									$("<input type='text' class='form-control' placeholder='所获奖项'><br/>", {//jQuery1.4新增方法
										name: arr[0][i],
										type: arr[1][i],
										value: arr[2][i],
										maxlength: arr[3][i],
										className: arr[4][i]
									}).appendTo( $Item );
									break;
								default://默认是input
									$("<td><input class='form-control'></td><td>&nbsp;&nbsp;</td>", {//jQuery1.4新增方法
										name: arr[0][i],
										type: arr[1][i],
										value: arr[2][i],
										maxlength: arr[3][i],
										className: arr[4][i]
									}).appendTo( $Item );
							}
						});
						$Item = $container.children(o.wrap);
						//新组数
						len = $Item.length;
						if ( len > 1 ) {
							$Item.last().append(oo.remove);
							if ( len === 2 ) {//超过一组时，为第一组添加“移除”按钮
								$Item.first().append(oo.remove);
							}
						}
						$Item.find(".remove").click(function(){
							//移除本组
							$(this).parent().remove();
							//统计剩下的组数
							len = $container.children(o.wrap).length;
							if ( len === 1 ) {//只剩一个的时候，把“移除”按钮干掉
								$container.find(".remove").remove();
							}
							//取消“移除”按钮的默认动作
							return false;
						});
					}
					//取消触发器的默认动作
					return false;
				});
				//初始化
				if ( $.isArray(o.initValue) ) {//判断初始值是否是数组（必需的）
					$.each(o.initValue, function(i, n) {
						if ( !$.isArray(n) ) {
							$container.empty().text(oo.error2);
							return false;
						}else{
							if ( n.length !== arr[0].length ) {
								$container.empty().text(oo.error1);
								return false;
							}
						}
						var arrValue = new Array();
						//初始值替换默认值
						$.each(n, function(j, m) {
							arrValue[j] = arr[2][j]
							arr[2][j] = m;
						});
						$Clicker.click();
						//默认值替换初始值
						$.each(arrValue, function(j, m) {
							arr[2][j] = m;
						});
					});
				}else{
					$Clicker.click();
				}
			}
		}
	});
})(jQuery);
</script>
		<!-- 以上为测试代码  -->
	</body>
</html>