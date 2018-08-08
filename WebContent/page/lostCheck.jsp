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
	
	
	function openLostCheckDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要审核的失物数据!");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","失物审核");
		$("#fm").form("load",row);
		$("#checkDate").val(getCurrentDate());
		url="${pageContext.request.contextPath}/lost/save.do?id="+row.id;
	}
	
	function saveLostCheck(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","审核成功!");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","审核失败!");
					return;
				}
			}
		});
	}
	
	function resetValue(){//这里因为其他的值是没有权限更改的，这边也被设置成了只读形式，只能修改任务分配给谁,所以也只需要将下拉框置为空
		$("#checkState").combobox("setValue","");
	}
	
	function closeLostDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="失物审核管理" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/lost/list1.do?checkState=未审核" fit="true" toolbar="#tb">
	<thead>
		<tr>
		<!-- 这个是前面的复选框 -->
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="80" align="center">编号</th>
			<th field="lostName" width="200" align="center">物品名称</th>
			<th field="lostNum" width="100" align="center">物品数量</th>
			<th field="address" width="200" align="center">拾物地址</th>
			<th field="outline" width="300" align="center">概述</th>
			<th field="pickName" width="150" align="center">拾物人</th>
			<th field="pickDate" width="200" align="center">拾物日期</th>
		</tr>
	</thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openLostCheckDialog()" class="easyui-linkbutton" iconCls="icon-fwfp" plain="true">失物审核</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 600px;height: 320px;padding: 10px 20px"
	closed="true" buttons="#dlg-buttons">
	
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>物品名称:</td>
				<td>
					<input type="text" id="lostName" name="lostName" readonly="readonly" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>失物数量:</td>
				<td>
					<input type="text" id="lostNum" name="lostNum" class="easyui-validatebox" required="true" readonly="readonly"/>&nbsp;<font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td>单位:</td>
				<td><input type="text" id="unit" name="unit" class="easyui-validatebox" readonly="readonly"/>&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>拾物地址:</td>
				<td><input type="text" id="address" name="address" class="easyui-validatebox" required="true" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
			</tr>
		
			<tr>
				<td>概述:</td>
				<td colspan="4">
					<input type="text" id="outline" name="outline" style="width: 419px" class="easyui-validatebox" required="true" readonly="readonly"/>&nbsp;<font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td>细节描述:</td>
				<td colspan="4">
					<input type="text" id="detail" name="detail" style="width: 419px" class="easyui-validatebox" required="true" readonly="readonly"/>&nbsp;<font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td>拾物人:</td>
				<td>
					<input type="hidden"name="pickId1" readonly="readonly" value="${currentUser.id }"/>
					<input type="text" id="pickName" name="pickName" readonly="readonly" value="${currentUser.trueName }"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>拾物日期:</td>
				<td><input type="text" id="pickDate" name="pickDate" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>审核人:</td>
				<!-- 这里是分配给客户经理，但是这边的话id是assignr 但取值依旧是取的客户经理 -->
				<td>
					<input type="text" id="checkName" name="checkName" readonly="readonly" value="${currentUser.trueName }"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>审核时间:</td>
				<td>
					<input type="text" id="checkDate" name="checkDate" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>审核状态:</td>
				<td>
					<select class="easyui-combobox" id="checkState" name="checkState" style="width: 154px" editable="false" panelHeight="auto">
						<option value="">未审核</option>
						<option value="通过">通过</option>
						<option value="未通过">未通过</option>
					</select>&nbsp;<font color="red">*</font>
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:saveLostCheck()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeLostDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>