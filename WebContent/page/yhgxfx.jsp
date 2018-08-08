<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	
	function search(){
		$("#dg").datagrid('load',{
			"name":$("#s_name").val()//意思就是带查询参数提交到后台然后再将查询的结果返回到页面上post请求在dg里面有
		});
	}
	
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="用户贡献分析" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/user/findUserGx.do" fit="true" toolbar="#tb">
	<thead>
		<tr>
		<!-- 这个是前面的复选框 -->
			<th field="name" width="280" align="center">用户名称</th>
			<th field="pickNum" width="170" align="center">拾物次数</th>
		</tr>
	</thead>
</table>
<div id="tb">
	<div>
		&nbsp;用户名称:&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) search()"/>
		<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
</div>

</body>
</html>