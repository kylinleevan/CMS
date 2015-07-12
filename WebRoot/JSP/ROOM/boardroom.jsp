<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="zh-CN">
	<head>
		<title>预订</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- bootstrap -->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<script src="../../bootstrap/js/jquery.min.js"></script>
		<script src="../../bootstrap/js/bootstrap.js"></script>
		
		<jsp:useBean id="room" class="JavaBean.DBBean" scope="page"></jsp:useBean>
		
		<% ResultSet rs=null; %>
	</head>
  
 <body>
  
  
  <%@ include file="../HEAD/header.jsp"%>
<form id="time_query" action="../../Boardroombytime" method="post" name="query"> 
  <div class="row">
  	<div class="col-md-4">
  		<div class="col-md-10">&nbsp;</div>
  		<div class="col-md-1" >
  			<h4><span class="label label-warning" style="font-size:25px">时间</span></h4>
  		</div>
  	</div>
  	<div class="col-md-2">
  	<input type="date" name="date" class="form-control input-lg" />
  	</div>
  	<div class="col-md-2">
  		
  			<select class="form-control input-lg" name="time">
  			<%
  			  	String sql1="select * from tb_time";
  				rs = room.query(sql1);
  				int i=1;
  			     while(rs.next())
  			     {
  			    	 if(i==1)
  			    	 	out.println("<option value='"+i+"' selected='selected'>"+rs.getString("start")+"~"+rs.getString("end")+"</option>");
  			    	 else
  			    		out.println("<option value='"+i+"'>"+rs.getString("start")+"~"+rs.getString("end")+"</option>");
  			         i++;
  			     }
  			%>
  			</select>
  		
 	</div>
  	<div class="col-md-4">
  		<div class="col-md-1"></div>
  		<div class="col-md-1"> 
  		<!--  	<button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='boardroombytime.jsp'">查询</button>-->
  			<input type="submit" class="btn btn-primary btn-lg" value="查询"/>
  		</div>
  		<div class="col-md-1">&nbsp;</div>
  		<div class="col-md-1"> 
  			<button type="button" class="btn btn-info btn-lg" onclick="window.location.href='boardroom.jsp'">重置</button>
  		</div>
  	</div>
  </div>
  </form>
  <br>
  <br>
  
  <% 
      String sql = "select * from tb_boardroom";
      rs=room.query(sql);
  %>
  <div class="row">
  	<div class="col-md-1">&nbsp;</div>
  	<div class="col-md-1">&nbsp;</div>
  	<div class="col-md-8">
 		<div class="table-responsive">
			<table class="table table-bordered">
    			<tr>
    				<td>房间号</td>
    				<td>容纳人数</td>
    				<td>是否有多媒体</td>
    				<td>备注</td>
    				<td></td>
    			</tr>
    			<%
    			    while(rs.next())
    			    {
    			    	out.println("<tr>");
    			    	out.println("<td>"+rs.getString("b_address")+"</td>");
    			    	out.println("<td>"+rs.getString("b_size")+"</td>");
    			    	if(rs.getString("media").equals("0"))
		    				out.println("<td>无多媒体</td>");
		    			else
		    				out.println("<td>有多媒体</td>");
    			    	out.println("<td>"+rs.getString("remarks")+"</td>");
    			    	out.println("<td><center><button type='button' class='btn btn-success'>"+"查看可预订时间"+"</button></center></td>");
    			    	out.println("</tr>");
    			    }
    			rs.close();
    			room.closeDB();
    			%>
			</table>
		</div>
	</div>
  	
  </div>
	
  </body>
</html>
