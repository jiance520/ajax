<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			//alert(0);
			$('.ajax2').click(function(){
				//alert($(this).val());
				//发送ajax;
				$.ajax({
					type:"POST",
					url:"AjaxAction",
					data:"name=John&location=Boston",
					async:false,/* 默认异步，是true,false是先执行ajax,再执行后面的内容 */
					dataType:"text",
					success:function(msg){
						alert("服务器信息"+msg);
					}
				});
				alert('end ajax');/* 异步时先弹出 */
			});
			$('.post2').click(function(){
				$.post('AjaxAction',{name:'Tom',location:'USA'},function(data){/* function(data){}相当于success部分,data=msg */
					alert("服务器信息"+data);
				},'text');
			});
		})
	</script>
  </head>
  
  <body>
    This is my JSP page. <br>
    <p>
    	<input type="button" class="ajax2" value="$.ajax方法测试"/>
    	<input type="button" class="post2" value="$.post方法测试"/>
    </p>
  </body>
</html>
