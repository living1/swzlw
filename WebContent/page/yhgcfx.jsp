<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${pageContext.request.contextPath}/highcharts4/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/highcharts4/js/highcharts.js" type="text/javascript"></script> 
<script type="text/javascript">
	
	$(function(){
		var chart=new Highcharts.Chart({
			chart:{
				renderTo:'container',
				type: 'column',
				events:{
					load:function(event){
						//ajax请求后台加载数据
						$.post("${pageContext.request.contextPath}/user/findUserGc.do",{},function(result){
							var xArr=new Array();
							var yArr=new Array();//定义两个数组用来接收数据
							for(var i=0;i<result.length;i++){
								xArr.push(result[i].userLevel);
								yArr.push(result[i].userNum);
								chart.xAxis[0].categories=xArr;
								chart.series[0].setData(yArr);
							}
						},"json");
					}
				}
			},
			title:{
				text: '用户构成分析'
			},
			xAxis:{
				categories:[
					'A',
					'B',
					'C',//这边必须要放几个这个，不然会报错
				]
			},
			yAxis:{
				title:{
					text:'用户数量'
				}
			},
			series:[{//这边也要放几个初始化数据，不加就会报错，不过到时候都会把它覆盖掉
				name: '用户',
				data:[1,2,3]
			}]
		});
	});
	
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
<div id="container" style="min-width: 800px;min-height: 400px"></div>
</body>
</html>