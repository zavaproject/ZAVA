<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
	div#chart{
		height: 700px;
		width: 700px;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<section>


<div id="chart">
	<canvas id="myChartOne" width="500" height="300"></canvas>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
let myChartOne = document.getElementById('myChartOne').getContext('2d');

let barChartOne = new Chart(myChartOne,{
    type: 'bar',
    data: {
        labels: ['나흘전', '사흘전', '이틀전', '하루전', '오늘'],
        datasets: [{
            data: [1,2,3,4,5,6,7],
            backgroundColor: [
				'rgba(255, 80, 80, 0.3)',
				'rgba(255, 255, 0, 0.3)',
				'rgba(51, 204, 51, 0.3)',
				'rgba(51, 204, 204, 0.3)',
				'rgba(51, 102, 255, 0.3)'
              ],
              borderWidth: 3,
              borderColor: [
				'rgb(255, 80, 80)',
				'rgb(255, 255, 0)',
				'rgb(51, 204, 51)',
				'rgb(51, 204, 204)',
				'rgb(51, 102, 255)'
              ],
        }]
    },
    options:{
		plugins:{
			title:{
				display:true,
				text:'일별 매출 수',
		        color: '#911',
				font:{
					size:30,
			        family: 'Comic Sans MS',
			        weight: 'bold',
			        lineHeight: 1.2
				}
			},
			legend:{
				display: false
			},
			tooltip:{
				displayColors:false,
				backgroundColor:'#000',
				titleColor:'#fff',
				titleFont:	{weight: 'bold'},
				borderColor:'#ff0000',
				intersect:false
			}
		},
		scales: {
			x: {
				grid:{
					color:'#000'
				},
				title:{
			        display: true,
					text:'일별',
			        color: '#911',
			        font: {
			        	family: 'Comic Sans MS',
			            size: 20,
			            weight: 'bold',
			            lineHeight: 1.2
			          }
				}
			},
			y: {
				ticks: {
					stepSize: 1
				},
				title:{
			        display: true,
					text:'매출수',
			        color: '#911',
			        font: {
			        	family: 'Comic Sans MS',
			            size: 20,
			            weight: 'bold',
			            lineHeight: 1.2
			    	}
				}
			}
		}
	}
});
</script>


	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>