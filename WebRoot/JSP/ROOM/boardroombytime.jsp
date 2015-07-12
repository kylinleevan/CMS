<%@page import="javax.naming.spi.DirStateFactory.Result"%>
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
		
		<%
		   ResultSet rs=null;
		   Integer  len = (Integer)request.getAttribute("length");
		   int l = len.intValue();
		   String bookroom[] = new String[l];
		   for(int i=1;i<=l;i++)
		   {
			   bookroom[i-1] = new String();
			   bookroom[i-1] = (String)request.getAttribute("room"+i);
		   }
		   
		   String date = (String)request.getAttribute("date");
		   String time = (String)request.getAttribute("time");
		%>
	</head>
  
 <body>
  
  <%@ include file="../HEAD/header.jsp"%>
<form id="time_query" action="Boardroombytime" method="post" name="query">   
  <div class="row">
  	<div class="col-md-4">
  		<div class="col-md-10">&nbsp;</div>
  		<div class="col-md-1" >
  			<h4><span class="label label-warning" style="font-size:25px">时间</span></h4>
  		</div>
  	</div>
  	<div class="col-md-2">
  		 <%out.println("<input type='date' name='date' class='form-control input-lg' value='"+date+"'/>"); %>
  	<!--  	<input type="date" name="date" class="form-control input-lg"/>-->
  	</div>
  	<div class="col-md-2">
  		
  		    <%
  		        String sql1 = "select * from tb_time";
  		        ResultSet rs1 = room.query(sql1);%>
  		        
  		      <select class="form-control input-lg" name="time">
  		      <% 
  		        while(rs1.next())
  		        {
  		        	if(time.equals(rs1.getString("t_id")))
  		        	{
  	  			    	 out.println("<option value='"+rs1.getString("t_id")+"' selected='selected'>"+rs1.getString("start")+"~"+rs1.getString("end")+"</option>");
  		        	}
  	  			    else
  	  			    	out.println("<option value='"+rs1.getString("t_id")+"'>"+rs1.getString("start")+"~"+rs1.getString("end")+"</option>");
  		        	
  		        }
  				
  		    %>
  		
  			</select> 
  		
 	</div>
  	<div class="col-md-4">
  		<div class="col-md-1"></div>
  		<div class="col-md-1"> 
  			<input type="submit" class="btn btn-primary btn-lg" value="查询"/>
  		</div>
  		<div class="col-md-1">&nbsp;</div>
  		<div class="col-md-1"> 
  			<button type="button" class="btn btn-info btn-lg" onclick="window.location.href='JSP/ROOM/boardroom.jsp'">重置</button>
  		</div>
  	</div>
  </div>
  </form>
  <br>
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
    			String sql = "select * from tb_boardroom";
    			 rs = room.query(sql);
    			 boolean b=true;
    			while(rs.next())
    			{
    				for(int i = 0;i<l;i++)
    				{
    					if(bookroom[i].equals(rs.getString("b_address")))
    					{
			    			out.println("<tr>");
			    			out.println("<td>"+rs.getString("b_address")+"</td>");
			    			out.println("<td>"+rs.getString("b_size")+"</td>");
			    			if(rs.getString("media").equals("0"))
			    				out.println("<td>无多媒体</td>");
			    			else
			    				out.println("<td>有多媒体</td>");
			    			out.println("<td>"+rs.getString("remarks")+"</td>");
			    			out.println("<td><center><button type='button' class='btn btn-success'>预约</button></center></td>");
			    			out.println("</tr>");
			    			b=false;
    					}
    				}
    				if(b)
    				{
    					out.println("<tr class='danger'>");
		    			out.println("<td>"+rs.getString("b_address")+"</td>");
		    			out.println("<td>"+rs.getString("b_size")+"</td>");
		    			if(rs.getString("media").equals("0"))
		    				out.println("<td>无多媒体</td>");
		    			else
		    				out.println("<td>有多媒体</td>");
		    			out.println("<td>"+rs.getString("remarks")+"</td>");
		    			out.println("<td><center><span class='label label-danger' style='font-size:18px'>预约</span></center></td>");
		    			out.println("</tr>");
		    			b=false;
    				}
    				
    			}
    			%>
			</table>
		</div>
	</div>
  	
  </div>
  </body>
</html>

