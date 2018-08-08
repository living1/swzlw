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
		
		$("#pickDate").val(getCurrentDate());
		
		
	});
	
	function resetValue(){
		$("#lostName").combobox("setValue","");
		$("#lostNum").val("");
		$("#unit").val("");
		$("#address").val("");
		$("#outline").val("");
		$("#detail").val("");
	}
	
	function saveLost(){
		var url="${pageContext.request.contextPath}/lost/save.do";
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功!");
					resetValue();
				}else{
					$.messager.alert("系统提示","保存失败!");
					return;
				}
			}
		});
	}

</script>
<title>Insert title here</title>
</head>
<body style="margin: 15px">

<div id="p" class="easyui-panel" title="失物创建" style="width: 600px;height: 250px;padding: 10px">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>物品名称:</td>
				<td>
					<input class="easyui-combobox" id="lostName" name="lostName" style="width: 154px"  data-options="panelHeight:'auto',required:true,editable:false,valueField:'lostName',textField:'lostName',url:'${pageContext.request.contextPath }/lost/findLostName.do'"/>&nbsp;<font color="red">*</font>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>失物数量:</td>
				<td><input type="text" id="lostNum" name="lostNum" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
			</tr>
			<tr>
				<td>单位:</td>
				<td><input type="text" id="unit" name="unit" class="easyui-validatebox"/>&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>拾物地址:</td>
				<td><input type="text" id="address" name="address" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
			</tr>
		
			<tr>
				<td>概述:</td>
				<td colspan="4">
					<input type="text" id="outline" name="outline" style="width: 419px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
				</td>
			</tr>
			<tr>
				<td>细节描述:</td>
				<td colspan="4">
					<input type="text" id="detail" name="detail" style="width: 419px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
				</td>
			</tr>
			<!-- <tr>
				<td>服务请求:</td>easyui-numberbox这个控件 规定只能输入数字
				<td colspan="4">
					<textarea id="servicerequest" name="servicerequest" rows="5" cols="49" class="easyui-validatebox" required="true"></textarea>&nbsp;<font color="red">*</font>
				</td>
			</tr> -->
			<tr>
				<td>拾物人:</td>
				<td>
					<input type="hidden" id="pickId" name="pickId" readonly="readonly" value="${currentUser.id }"/>
					<input type="text" id="pickName" name="pickName" readonly="readonly" value="${currentUser.trueName }"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>拾物日期:</td>
				<td><input type="text" id="pickDate" name="pickDate" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="4"></td>
				<td>
					<a href="javascript:saveLost()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>&nbsp;&nbsp;
					<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">重置</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>