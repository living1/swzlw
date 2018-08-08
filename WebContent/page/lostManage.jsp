<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	
	$(function(){//当页面加载完毕才执行
		$.post("${pageContext.request.contextPath}/user/findById.do",{id:'${param.pickId}'},function(result){
			$("#userName").val(result.userName);
            $("#userName1").val(result.userName);
            $("#trueName1").val(result.roleName);
			$("#isSchool").val(result.isSchool);
            $("#isSchool1").val(result.isSchool);
            $("#institute").val(result.institute);
            $("#institute1").val(result.institute);
            $("#roleName").val(result.roleName);
            $("#roleName1").val(result.roleName);
		},"json");
	//当文档加载完毕，需要对课表及表格进行一个初始化，定义执行的url
		$("#dg").edatagrid({
			url:'${pageContext.request.contextPath}/lost/list.do?pickId=${param.pickId}',
			saveUrl:'${pageContext.request.contextPath}/lost/save.do?user.id=${param.pickId}',//保存url
			updateUrl:'${pageContext.request.contextPath}/lost/save.do?',//修改url,和保存的url一样但是底层实现是添加不带主键值后台数据库生成，但是修改要把原始的主键值带过去
			destroyUrl:'${pageContext.request.contextPath}/lost/delete.do'//删除url,这个会自己把主键值id带过去
		});
	});
	
	function formatState(val, row){
		if(val==1){
			return "已回款";
		}else{
			return "未回款";
		}
	}
	
	function formatAction(val, row){
		return "<a href='javascript:openLostDetailsDialog("+row.id+")'>查看详细信息</a>";
	}
	
	function openLostDetailsDialog(lostId){
		//这里传过去的是id，是在订单表中查询的
		$.post("${pageContext.request.contextPath}/lost/findById.do",{id:lostId},function(result){
            $("#lostName").val(result.lostName);
            $("#lostNum").val(result.lostNum);
            $("#unit").val(result.unit);
            $("#address").val(result.address);
            $("#outline").val(result.outline);
            $("#detail").val(result.detail);
		},"json");
		$("#dlg").dialog("open").dialog("setTitle","爱心详情");
	}
	
	function closeLostDetailsDialog(){
		$("#dlg").dialog('close');
	}
</script>
<title>Insert title here</title>
</head>
<body style="margin: 15px">

<div id="p" class="easyui-panel" title="用户基本信息" style="width: 900px;height: 120px;padding: 10px">
	<table cellspacing="8px">
		<tr>
			<td>用户名:</td>
			<td><input type="text" id="userName" name="userName" readonly="readonly"/></td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>本校人员:</td>
			<td><input type="text" id="isSchool" name="isSchool" readonly="readonly"/></td>
		</tr>
		<tr>
			<td>所属学院:</td>
			<td><input type="text" id="institute" name="institute" readonly="readonly"/></td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>用户类型:</td>
			<td><input type="text" id="roleName" name="roleName" readonly="readonly"/></td>
		</tr>
	</table>
</div>
<br/>
<table id="dg" title="用户历史拾物" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/lost/list.do?pickId=${param.pickId}" style="width: 900px;height: 260px">
	<thead>
		<tr>
			<th field="id" width="60" align="center">编号</th>
			<th field="lostName" width="100" align="center">物品名称</th>
			<th field="pickDate" width="100" align="center">拾物日期</th>
			<th field="address" width="200" align="center">拾物地址</th>
			<th field="a" width="90" align="center" formatter="formatAction">操作</th>
		</tr>
	</thead>
</table>
<div id="dlg" class="easyui-dialog" style="width: 700px;height: 420px;padding: 10px 20px"
	closed="true" buttons="#dlg-buttons">

	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>用户名:</td>
				<td><input type="text" id="userName1" name="userName" readonly="readonly"/></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>真实姓名:</td>
				<td><input type="text" id="trueName1" name="trueName" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>本校人员:</td>
				<td><input type="text" id="isSchool1" name="isSchool" readonly="readonly"/></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>所属学院:</td>
				<td><input type="text" id="institute1" name="institute" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>用户类型:</td>
				<td><input type="text" id="roleName1" name="roleName" readonly="readonly"/></td>
				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
		</br>
		<div id="p1" class="easyui-panel" title="拾物详情" style="width: 600px;height: 200px;padding: 10px">
			<table cellspacing="8px">
				<tr>
					<td>物品名称:</td>
					<td><input type="text" id="lostName" name="lostName " readonly="readonly"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>物品数量:</td>
					<td><input type="text" id="lostNum" name="lostNum " readonly="readonly"/></td>
				</tr>
				<tr>
					<td>单位:</td>
					<td><input type="text" id="unit" name="unit " readonly="readonly"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>拾物地址:</td>
					<td><input type="text" id="address" name="address " readonly="readonly"/></td>
				</tr>
				<tr>
					<td>用户类型:</td>
					<td><input type="text" id="outline" name="outline" readonly="readonly"/></td>
					<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>细节描述:</td>
					<td><input type="text" id="detail" name="detail" readonly="readonly"/></td>
					<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:closeLostDetailsDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>