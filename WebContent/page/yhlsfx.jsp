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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

	
	function searchUserLoss(){
		$("#dg").datagrid('load',{
			"userName":$("#s_userName").val(),//意思就是带查询参数提交到后台然后再将查询的结果返回到页面上post请求在dg里面有
			"confirmLossDatefrom":$("#s_confirmLossDatefrom").datebox("getValue"),//这里是datebox所以要用datebox的方法来取值
			"confirmLossDateto":$("#s_confirmLossDateto").datebox("getValue")
		});
	}

	
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="用户流失分析" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/userLoss/list2.do" fit="true" toolbar="#tb">
	<thead>
		<tr>
		<!-- 这个是前面的复选框 -->
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="80" align="center">编号</th>
			<th field="userName" width="150" align="center">用户名</th>
			<th field="confirmLossDate" width="200" align="center">确认移除日期</th>
			<th field="lossReason" width="300" align="center">流失原因</th>
			<th field="removeState" width="150" align="center">移除状态</th>
		</tr>
	</thead>
</table>
<div id="tb">

	<div>
		&nbsp;用户名:&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUserLoss()"/>
		&nbsp;确认移除日期:&nbsp;<input type="text" id="s_confirmLossDatefrom" class="easyui-datebox"/>&nbsp;-&nbsp;<input type="text" id="s_confirmLossDateto" class="easyui-datebox"/>&nbsp;
		<a href="javascript:searchUserLoss()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
</div>

</body>
</html>