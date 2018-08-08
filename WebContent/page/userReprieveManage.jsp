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
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

	
	$(function(){//当页面加载完毕才执行
		$.post("${pageContext.request.contextPath}/userLoss/findById.do",{id:'${param.lossId}'},function(result){
			$("#userName").val(result.userName);
			$("#isSchool").val(result.isSchool);
			$("#institute").val(result.institute);
			$("#roleName").val(result.roleName);
		},"json");
	//当文档加载完毕，需要对课表及表格进行一个初始化，定义执行的url
		$("#dg").edatagrid({
			url:'${pageContext.request.contextPath}/userReprieve/list.do?lossId=${param.lossId}',
			saveUrl:'${pageContext.request.contextPath}/userReprieve/save.do?userLoss.id=${param.lossId}',//保存url
			updateUrl:'${pageContext.request.contextPath}/userReprieve/save.do',//修改url,和保存的url一样但是底层实现是添加不带主键值后台数据库生成，但是修改要把原始的主键值带过去
			destroyUrl:'${pageContext.request.contextPath}/userReprieve/delete.do'//删除url,这个会自己把主键值id带过去
		});
	});
	
	function confirmLoss(){
		$.messager.prompt('系统提示','请输入流失原因',function(r){
			if(r){
				//这里的${param.lossId}是外层jsp传给内层jsp的参数
				$.post("${pageContext.request.contextPath}/userLoss/confirmLoss.do",{id:'${param.lossId}',lossReason:r},function(result){
					if(result.success){
						$.messager.alert("系统提示","执行成功!");
					}else{
						$.messager.alert("系统提示","执行失败!");
					}
				},"json");
			}
		});
	}
</script>
<title>Insert title here</title>
</head>
<body style="margin: 15px">

<div id="p" class="easyui-panel" title="用户基本信息" style="width: 800px;height: 130px;padding: 10px">
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

<br/><!-- 可编辑表格 -->
<table id="dg" title="暂缓移除措施管理" style="width: 800px;height: 250px"
	toolbar="#toolbar" idField="id" rowsnumbers="true" fitColumns="true" singleSelect="true"><!-- toolbar工具条 idField="id"主键的列到时候要自动找主键要带到后台去的  rowsnumbers行号  fitColumns自适应咧   singleSelect只能单选-->
	<thead>
		<tr>
			<th field="id" width="50">编号</th>
			<!-- datebox到时候编辑的时候就会出现一个日期框 ，required:true日期是必选的-->
			<th field="measure" width="300" editor="{type:'validatebox',options:{required:true}}">暂缓措施</th>
		</tr>
	</thead>
</table>
<!-- 工具条   javascript:void(0)什么也不执行,,plain="true"没有边框-->
<div id="toolbar">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">删除</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow');$('#dg').edatagrid('reload')">保存</a><!-- $('#dg').edatagrid('reload')保存完了在重新加载表格 -->
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">撤销行</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-confirm" plain="true" onclick="javascript:confirmLoss()">确认移除</a>
</div>
</body>
</html>