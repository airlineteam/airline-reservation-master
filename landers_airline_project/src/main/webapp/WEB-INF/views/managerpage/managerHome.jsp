<%@page import="com.landers.airline.dto.ManagerDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
	
	
	 
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <!-- Chart.js CDN 포함 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
       
      .small--board {
	background-color: white;
	height: 80px;
	width: 300px;
	box-shadow: 0 0 3px 3px #e5e5e5;
	padding: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	float: left;
	margin: 30px 15px 20px 15px;
}

.icon--div {
	border-radius: 50%;
	background-color: #f0f0f0;
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.icon--div span {
	font-size: 27px;
	color: #657788;
	cursor: default;
}

.icon--div span:hover {
	color: #657788;
}

.middle--board {
	background-color: white;
	height: 400px;
	width: 660px;
	box-shadow: 0 0 3px 3px #e5e5e5;
	margin: 20px 15px 20px 15px;
	padding: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}


.long--board {
	background-color: white;
	height: 400px;
	width: 1290px;
	box-shadow: 0 0 3px 3px #e5e5e5;
	padding: 12px;
	margin: 20px 15px 20px 15px;
}

#salesChart {
	width: 1230px !important;
	
}
#customerFeedbackChart{
	width: 600px !important;
}
#customerFeedbackData{
	width: 600px !important;
}

    </style>
</head>

</head>
<body>

<div class="small--board">
			<div>
				<h5 class="small--board--title">월 매출액</h5>
				<p class="number--value--p">원</p>
			</div>
			<div class="icon--div">
				<span style="margin-left: 2px;" class="material-symbols-outlined material-symbols-outlined-fill"></span>
			</div>
		</div>	
		<div class="small--board">
			<div>
				<h5 class="small--board--title">월 신규 회원 수</h5>
				<p class="number--value--p">명</p>
			</div>
			<div class="icon--div">
				<span style="margin-left: 5px;" class="material-symbols-outlined material-symbols-outlined-fill"></span>
			</div>
		</div>	
		<div class="small--board">
			<div>
				<h5 class="small--board--title">월 탈퇴 회원 수</h5>
				<p class="number--value--p">명</p>
			</div>
			<div class="icon--div">
				<span style="margin-left: 5px;" class="material-symbols-outlined material-symbols-outlined-fill"></span>
			</div>
		</div>	
		<div class="small--board">
			<div>
				<h5 class="small--board--title">월 고객의 말씀</h5>
				<p class="number--value--p">건</p>
			</div>
			<div class="icon--div">
				<span class="material-symbols-outlined material-symbols-outlined-fill"></span>
			</div>
		</div>	
	
	
    <div class="d-flex justify-content-between" style="width: 100%; margin-bottom: 20px;">
        <div class="long--board">
            <canvas id="salesChart"></canvas>
              </div>
              	</div>
              	
             <div class="d-flex justify-content-between"style="width: 100%; margin-bottom: 20px;">
             	<div class="middle--board">
            <canvas id="travelCityChart"></canvas>
            	<div class="middle--board">
            <canvas id="customerFeedbackChart"></canvas>
            	</div>
        	</div>
		</div>
		
		
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // 매출 및 도시 랭킹을 위한 목 데이터
            const salesData = {
                labels: ['2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월'],
                datasets: [{
                    label: '월별 총 매출',
                    backgroundColor: '#9A161F',
                    borderColor: '#9A161F',
                    borderWidth: 2,
                    data: [45,40,20,30,70,80,40,50,70,10,20],
                }],
            };
            <%-- for (ManagerDto dto : list) { %><%= dto.getTotalPrice() %>, <% } --%>
            const travelCityData = {
                labels: ['뉴욕', '오사카', '런던', '다낭', '도쿄','방콕','호치민','삿포로'],
                datasets: [{
                    label: '도착지별 이용객 도시',
                    backgroundColor: '#BDBDBD',
                    borderColor: '#BDBDBD',
                    borderWidth: 1,
                    data: [30, 45, 60, 25, 50,80,30,40],
                }],
            };

            const customerFeedbackData = {
                labels: ['문의', '칭찬', '불만'],
                datasets: [{
                    label: '고객의 소리',
                    backgroundColor: ['#BDBDBD', '#78909C', '#8D6E63'],
                    borderColor: '#ffffff',
                    borderWidth: 2,
                    data: [20, 50, 30],
                }],
            };

            // 매출 차트 생성
            const salesCtx = document.getElementById('salesChart').getContext('2d');
            const salesChart = new Chart(salesCtx, {
                type: 'line',
                data: salesData,
                options: {
                    animations: {
                      tension: {
                        duration: 1000,
                        easing: 'linear',
                        from: 1,
                        to: 0,
                        loop: true
                      }
                    },
                    scales: {
                      y: { 
                        min: 0,
                        max: 100
                      }
                    }
                  }
            });

            // 도시 랭킹 차트 생성
            const travelCityCtx = document.getElementById('travelCityChart').getContext('2d');
            const travelCityChart = new Chart(travelCityCtx, {
                type: 'bar',
                data: travelCityData,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                        },
                    },
                    animation: {
                        duration: 2000, // 애니메이션 지속 시간 (ms)
                        easing: 'easeInOutQuart', // 애니메이션 효과 (예: 'linear', 'easeInOutQuart' 등)
                    },
                },
            });

            // 고객의 소리 차트 생성 (도넛 차트)
            const customerFeedbackCtx = document.getElementById('customerFeedbackChart').getContext('2d');
            const customerFeedbackChart = new Chart(customerFeedbackCtx, {
                type: 'doughnut',
                data: customerFeedbackData,
                options: {
                    animation: {
                        duration: 2000, // 애니메이션 지속 시간 (ms)
                        easing: 'easeInOutQuart', // 애니메이션 효과 (예: 'linear', 'easeInOutQuart' 등)
                    },
                },
            });
        });
    </script>
</body>
</html>