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
			chart: {
				renderTo:'container',
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
				events:{
					load:function(event){
						var series=this.series[0];
						//ajax请求后台加载数据
						$.post("${pageContext.request.contextPath}/lost/findLostGc.do",{},function(result){
							var xArr=new Array();//这里最终是要弄成键值对的形式,这边要弄成一个2维数组的形式
							for(var i=0;i<result.length;i++){
								xArr[i]=new Array();
								xArr[i][0]=result[i].lostType;
								xArr[i][1]=result[i].lostNum;
							}
							series.setData(xArr);
						},"json");
					}
				}
			},
			title: {
				text: '招领成果分析'
			},
			tooltip: {
				formatter: function(){
					return '<b>'+this.point.name+'</b>:'+Highcharts.numberFormat(this.percentage,1)+'% ('+this.y+'个)'
				}
			},
			plotOptions: {
				pie: {
					allowPointSelect: true,//允许选择
					cursor: 'pointer',//鼠标移上去有一个手的形状
					dataLabels: {
						enabled: true,
						color: '#000000',//数据的颜色
						connectorColor: '#000000',//数据和图之间的线的颜色
						format: '<b>{point.name}</b>:{point.percentage:.1f}%'//格式化数据  point.percentage百分比形式，.1f保留一位小数
					}
				}
			},
			series: [{
				type: 'pie',
				name: '比例',
				data: [
					       
				]
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