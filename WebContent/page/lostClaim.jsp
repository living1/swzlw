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
		$.post("${pageContext.request.contextPath}/lost/findById.do",{id:'${param.lostId}'},function(result){
			$("#lostId").val(result.id);
			$("#lostName").val(result.lostName);
			$("#detail").val(result.detail);
		},"json");
		
		$("#claimDate").val(getCurrentDate());
	
	});

	
	function resetValue(){
		$("#identify").val("");
	}
	
	function saveClaim(){
		var url="${pageContext.request.contextPath}/claim/save.do";
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

<div id="p" class="easyui-panel" title="申领创建" style="width: 600px;height: 190px;padding: 10px">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>物品名称:</td>
				<td>
					<input type="hidden" id="lostId" name="lostId" readonly="readonly"/>
					<input type="text" id="lostName" name="lostName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
					<input type="hidden" type="text" id="detail" name="detail" readonly="readonly"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>身份验证:</td>
				<td><input type="text" id="identify" name="identify" class="easyui-validatebox" required="true"/>&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>申领人:</td>
				<td>
					<input type="hidden" id="claimId" name="claimId" readonly="readonly" value="${currentUser.id }"/>
					<input type="text" id="claimName" name="claimName" readonly="readonly" value="${currentUser.trueName }"/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>申领日期:</td>
				<td><input type="text" id="claimDate" name="claimDate" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="4"></td>
				<td>
					<a href="javascript:saveClaim()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>&nbsp;&nbsp;
					<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">重置</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>