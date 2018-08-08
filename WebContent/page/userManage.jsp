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

	var url;
	
	function searchUser(){
		$("#dg").datagrid('load',{
			"userName":$("#s_userName").val(),//意思就是带查询参数提交到后台然后再将查询的结果返回到页面上post请求在dg里面有
			"isSchool":$("#s_isSchool").val(),//搜索框的参数
            "institute":$("#s_institute").val(),//意思就是带查询参数提交到后台然后再将查询的结果返回到页面上post请求在dg里面有
            "roleName":$("#s_roleName").val()
		});
	}
	
	function openUserAddDialog(){
		resetValue();
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		url="${pageContext.request.contextPath}/user/save.do";
	}
	
	function openUserModifyDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据!");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		$("#fm").form("load",row);
		url="${pageContext.request.contextPath}/user/save.do?id="+row.id;
	}
	
	function saveUser(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#isSchool").combobox("getValue")==""){
					$.messager.alert("系统提示","请选择本校人员!");
					return false;
				}
				if($("#institute").combobox("getValue")==""){
					$.messager.alert("系统提示","请选择所属学院!");
					return false;
				}
				if($("#roleName").combobox("getValue")==""){
					$.messager.alert("系统提示","请选择用户类型!");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功!");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败!");
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#userName").val("");
        $("#password").val("");
        $("#trueName").val("");
		$("#isSchool").combobox("setValue","");
		$("#institute").combobox("setValue","");
		$("#email").val("");
		$("#phone").val("");
        $("#roleName").combobox("setValue","");
	}
	
	function closeUserDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deleteUser(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择需要删除的数据!");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");//将数据变成一个用逗号隔开的字符串
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗?",function(r){
			//r是boolean类型的，用户点了确认就是true，否则就是false
			if(r){
				$.post("${pageContext.request.contextPath}/user/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已成功删除!");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败，请联系管理员!");
					}
				},"json");
			}
		});
	}

	
	function openUserPick(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条需要管理的数据!");
			return;
		}
		//调用父页面的openTab方法
		window.parent.openTab('用户历史拾物查询','lostManage.jsp?pickId='+selectedRows[0].id,'icon-lsdd');
	}
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="用户信息查询" class="easyui-datagrid"
	 pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/user/list.do" fit="true" toolbar="#tb">
	<thead data-options="frozen:true">  <!-- frozen:true变成冻结状态,要把上面的自适应给去掉才有用fitColumns -->
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center" hidden="true">编号</th>
	 		<th field="userName" width="150" align="center">用户名称</th>
			<th field="trueName" width="150" align="center">真实姓名</th>
	 		<th field="isSchool" width="100" align="center">本校人员</th>
	 		<th field="institute" width="150" align="center">所属学院</th>
	 		<th field="email" width="200" align="center">邮箱</th>
	 		<th field="phone" width="150" align="center">联系电话</th>
			<th field="roleName" width="150" align="center">用户类型</th>
		</tr>
	</thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
		<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:openUserPick()" class="easyui-linkbutton" iconCls="icon-lsdd" plain="true">历史拾物查看</a>
	</div>
	<div>
		&nbsp;用户名:&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
		&nbsp;本校人员:&nbsp;<input type="text" id="s_isSchool" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
		&nbsp;所属学院:&nbsp;<input type="text" id="s_institute" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
		&nbsp;用户类型:&nbsp;<input type="text" id="s_roleName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
</div>


<div id="dlg" class="easyui-dialog" style="width: 600px;height: 250px;padding: 10px 20px"
	closed="true" buttons="#dlg-buttons">
	
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>用户名称:</td>
				<td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>密码:</td>
				<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
			</tr>
			<tr>
				<td>真实姓名:</td>
				<td><input type="text" id="trueName" name="trueName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>本校人员:</td><!-- 使用下拉框选择 -->
				<td>
					<select class="easyui-combobox" id="isSchool" name="isSchool" style="width: 100px" editable="false" panelHeight="auto">
						<option value="">请选择...</option>
						<option value="是">是</option>
						<option value="否">否</option>
					</select>&nbsp;<font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td>所属学院:</td><!-- 使用下拉框选择 -->
				<td>
					<select class="easyui-combobox" id="institute" name="institute" style="width: 154px" editable="false" panelHeight="auto">
						<option value="">请选择...</option>
						<option value="通信">通信</option>
						<option value="自动化">自动化</option>
						<option value="软件工程">软件工程</option>
						<option value="传媒">传媒</option>
						<option value="光电">光电</option>
						<option value="国际">国际</option>
						<option value="外国语">外国语</option>
					</select>&nbsp;<font color="red">*</font>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>邮箱:</td>
				<td><input type="text" id="email" name="email" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
			</tr>
			<tr>
				<td>联系电话:</td>
				<td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>用户类型:</td><!-- 使用下拉框选择 -->
				<td>
					<select class="easyui-combobox" id="roleName" name="roleName" style="width: 154px" editable="false" panelHeight="auto">
						<option value="">请选择...</option>
						<option value="系统管理员">系统管理员</option>
						<option value="普通用户">普通用户</option>
					</select>&nbsp;<font color="red">*</font>
				</td>
			</tr>

	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>