<%@page import="dao.dbhelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript" src="JS/jquery-1.8.3.js"></script>
	 <script>
	 
	 $(function () {
	 
	 	$("a").mouseover(function(){
				var pid = $(this).attr("lang");
				
				$.ajax({
					type:"post",
					url:"showSvl",
					data:{pId:pid},
					dataType:"html",
					success:function(data){
						
						$("#dvContent").html("<img src='"+data+"'/><br/>"+data);
					}
				});
			});
		
	 
	 
            $("#uid").blur(function () {
                var uid = $(this).val();
                $.ajax({
                    type: "post",
                    url: "querySvl",//请求后台服务对象
                    data: {account: $("#uid").val()},//客户端提交给服务器的数据
                    dataType: "html",//定义返回给客户端的数据格式
                    success: function (data) {
                        $("#sp").html(data);//呈现结果
                    }
                })
            })
        })
	 </script>
  </head>
  
  <body>
    <form id="form01" action="01.jsp" method="post">
    <table width="500" align="center" style="line-height: 50px">
        <tr>
            <td colspan="2" height="100" align="center">用户注册</td>

        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" id="uid" name="username"size="30"
                       maxlength="
                10"/></td>
                <td>
                <span id="sp"></span>
                </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="pwd1" size="30" maxlength="12"/>
            </td>
        </tr>
            </table>

</form>

<div>
    	<%
    		String sql = "select top 5 * from product";
    		ResultSet rs = dbhelper.query(sql,null);
    		while(rs.next()){
    		%>
    		<a href="#" lang="<%=rs.getInt("pid") %>"><%=rs.getString("pName") %></a>&nbsp;&nbsp;
    		<%
    		}
    	 %>
    	
    </div>
    <div id="dvContent"></div>
  </body>
</html>
