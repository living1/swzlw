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

	
	function searchUserLoss(){
		$("#dg").datagrid('load',{
			"userName":$("#s_userName").val()//意思就是带查询参数提交到后台然后再将查询的结果返回到页面上post请求在dg里面有
		});
	}
	
	function formatState(val, row){
		if(val=='确认移除'){
			return "确认移除";
		}else{
			return "暂缓移除";
		}
	}
	
	function formatAction(val, row){
		if(row.state==1){
			return "用户确认移除";
		}else{
			//否则添加暂缓流失功能
			return "<a href='javascript:openUserReprieve("+row.id+")'>暂缓移除</a>"
		}
	}
	
	function openUserReprieve(id){
		window.parent.openTab('客户流失暂缓措施管理','userReprieveManage.jsp?lossId='+id,'icon-khlsgl')
	}
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="用户移除管理" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/userLoss/list1.do" fit="true" toolbar="#tb">
	<thead>
		<tr>
		<!-- 这个是前面的复选框 -->
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="50" align="center">编号</th>
			<th field="userName" width="50" align="center">用户名</th>
			<th field="confirmLossDate" width="100" align="center">移除日期</th>
			<th field="lossReason" width="100" align="center">移除原因</th>
			<th field="removeState" width="80" align="center" formatter="formatState">移除状态</th><!-- 因为这边传过来的是0和1所以需要转换一下 -->
			<th field="a" width="100" align="center" formatter="formatAction">操作</th>
		</tr>
	</thead>
</table>
<div id="tb">
	<div>
		
	</div>
	<div>
		&nbsp;用户名:&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUserLoss()"/>
		<%--&nbsp;本校人员:&nbsp;<select class="easyui-combobox" id="s_isSchool" editable="false" panelHeight="auto">
								<option value="">请选择...</option>
								<option value="是">是</option>
								<option value="否">否</option>
							</select>
		&nbsp;所属学院:&nbsp;<select class="easyui-combobox" id="s_institute" editable="false" panelHeight="auto">
								<option value="">请选择...</option>
								<option value="通信">通信</option>
								<option value="自动化">自动化</option>
								<option value="软件工程">软件工程</option>
								<option value="传媒">传媒</option>
								<option value="光电">光电</option>
								<option value="国际">国际</option>
								<option value="外国语">外国语</option>
							</select>--%>
		<a href="javascript:searchUserLoss()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
</div>


</body>
</html>