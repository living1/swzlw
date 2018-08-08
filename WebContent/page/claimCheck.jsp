<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="com.swzlw.model.User"%>
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

	var url;
	
	
	function openClaimCheckDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要审核的失物数据!");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","认领审核");
		$("#fm").form("load",row);
		$("#handleDate").val(getCurrentDate());
		
		url="${pageContext.request.contextPath}/claim/save.do?id="+row.id;
	}
	
	function saveClaimCheck(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","处理成功!");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","处理失败!");
					return;
				}
			}
		});
	}
	
	function resetValue(){//这里因为其他的值是没有权限更改的，这边也被设置成了只读形式，只能修改任务分配给谁,所以也只需要将下拉框置为空
		$("#handleResult").combobox("setValue","");
	}
	
	function closeClaimDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="认领审核管理" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/claim/list.do?handleResult=未处理" fit="true" toolbar="#tb">
	<thead>
		<tr>
		<!-- 这个是前面的复选框 -->
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="80" align="center">编号</th>
			<th field="lostName" width="200" align="center">物品名称</th>
			<th field="detail" width="300" align="center">细节描述</th>
			<th field="claimName" width="150" align="center">申领人</th>
			<th field="identify" width="300" align="center">身份验证</th>
			<th field="claimDate" width="200" align="center">申领日期</th>
		</tr>
	</thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openClaimCheckDialog()" class="easyui-linkbutton" iconCls="icon-fwfp" plain="true">认领审核</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 600px;height: 320px;padding: 10px 20px"
	closed="true" buttons="#dlg-buttons">
	
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>物品名称:</td>
				<td>
					<input type="hidden" id="lostId" name="lostId" readonly="readonly"/>
					<input type="text" id="lostName" name="lostName" readonly="readonly" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>细节描述:</td>
				<td colspan="4">
					<input type="text" id="detail"  style="width: 430px" name="detail" readonly="readonly"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>身份验证:</td>
				<td colspan="4"><input type="text"  style="width: 430px" id="identify" name="identify" readonly="readonly" class="easyui-validatebox" required="true"/>&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>申领人:</td>
				<td>
					<input type="hidden" id="claimId" name="claimId" readonly="readonly"/>
					<input type="text" id="claimName" name="claimName" readonly="readonly"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>申领日期:</td>
				<td><input type="text" id="claimDate" name="claimDate" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>处理人:</td>
				<!-- 这里是分配给客户经理，但是这边的话id是assignr 但取值依旧是取的客户经理 -->
				<td>
					<%-- <input type="text" id="handleName" name="handleName" readonly="readonly" value="${currentUser.trueName}"/> --%>
					<input type="text"name="handleName" readonly="readonly" value="${currentUser.trueName }"/>
				</td>
				
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>处理日期:</td>
				<td>
					<input type="text" id="handleDate" name="handleDate" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>处理状态:</td>
				<td>
					<select class="easyui-combobox" id="handleResult" name="handleResult" style="width: 154px" editable="false" panelHeight="auto">
						<option value="">未处理</option>
						<option value="通过">通过</option>
						<option value="未通过">未通过</option>
					</select>&nbsp;<font color="red">*</font>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>处理方法:</td>
				<td>
					<select class="easyui-combobox" id="handleItem" name="handleItem" style="width: 154px" editable="false" panelHeight="auto">
						<option value="">未处理</option>
						<option value="给联系电话">给联系电话</option>
						<option value="给邮箱">给邮箱</option>
					</select>&nbsp;<font color="red">*</font>
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:saveClaimCheck()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeClaimDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>