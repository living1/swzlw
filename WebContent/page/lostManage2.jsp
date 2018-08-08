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
	
	function searchLost(){
		$("#dg").datagrid('load',{
			"lostName":$("#s_lostName").combobox("getValue")//意思就是带查询参数提交到后台然后再将查询的结果返回到页面上post请求在dg里面有
		});
	}
	
	function formatState(val, row){
		if(val=='归还'){
			return "归还";
		}else{
			return "未归还";
		}
	}
	
	function formatAction(val, row){
		if(row.returnState=='归还'){
			return "<a href='javascript:openLostDetailsDialog("+row.id+")'>查看详细信息</a>";
		}else{
			//否则添加申请认领功能
			return "<a href='javascript:openLostClaimDialog("+row.id+")'>申请认领</a>";
		}
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
	
	function openLostClaimDialog(id){
		window.parent.openTab('申请认领管理','lostClaim.jsp?lostId='+id,'icon-khlsgl')
	}
	
	function closeLostDialog(){
		$("#dlg").dialog('close');
	}
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<table id="dg" title="失物信息管理" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/lost/list1.do?checkState=通过" fit="true" toolbar="#tb">
	<thead>
		<tr>
		<!-- 这个是前面的复选框 -->
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="50" align="center">编号</th>
			<th field="pickId" width="50" align="center" hidden="true">拾物人编号</th>
			<th field="lostName" width="120" align="center">物品名称</th>
			<th field="address" width="200" align="center">拾物地址</th>
			<th field="outline" width="300" align="center">概述</th>
			<th field="pickDate" width="150" align="center">拾物日期</th>
			<th field="returnDate" width="150" align="center">归还日期</th>
			<th field="returnState" width="80" align="center" formatter="formatState">归还状态</th>
			<th field="a" width="100" align="center" formatter="formatAction">操作</th>
		</tr>
	</thead>
</table>
<div id="tb">
	<div>
		
	</div>
	<div>
		&nbsp;物品名称:&nbsp;<input class="easyui-combobox" id="s_lostName" data-options="panelHeight:'auto',valueField:'lostName',textField:'lostName',url:'${pageContext.request.contextPath }/lost/findLostName.do'"/>
		<a href="javascript:searchLost()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
</div>


<div id="dlg" class="easyui-dialog" style="width: 600px;height: 250px;padding: 10px 20px"
	closed="true" buttons="#dlg-buttons">

	<form id="fm" method="post">
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
	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:closeLostDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>