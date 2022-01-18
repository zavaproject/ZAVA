<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="../../../resources/css/style.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
.order {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}

.order .inputArea {
	margin: 10px 0;
}

.order .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.order .inputArea input {
	font-size: 14px;
	padding: 5px;
}

#address2, #address3 {
	width: 250px;
}

.order .inputArea:last-child {
	margin-top: 30px;
}

.order .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}
</style>

</head>
<body>
	<%-- <jsp:include page="../header.jsp" /> --%>

	<section>

		<div class="orderOpen">
			<button type="button" class="orderOpen_bnt">주문 정보 입력</button>
			<script>
			
			</script>
		</div>
		<div class="order">
			<form action="/order/orderList" method="post">

				<div class="inputArea">
					<label for="">제품 번호</label> <input type="text" name="pid" id="pid">
				</div>
				<div class="inputArea">
					<label for="">고객 ID</label> <input type="text" name="mid" id="mid">
				</div>
				<div class="inputArea">
					<label for="">배송 상태</label> <input type="text" name="ostatus"
						id="ostatus">
				</div>
				<div class="inputArea">
					<label for="">제품 가격</label> <input type="text" name="amount"
						id="amount">
				</div>			
				
				<div class="inputArea">
				<label for="">우편 번호</label> 
				<input name="postcode" type="text" id="postcode" readonly value="13494">
				<input type="button" onclick="execPostcode()" value="우편번호 찾기"><br>
				</div>
			
				<div class="inputArea">
				<label for="">주소</label> 
				<input name="address" type="text" style="width: 365px;" id="address" readonly value="경기 성남시 분당구 판교역로 235"><br>				
				</div>
				
				<div class="inputArea">
				<label for="">참고 항목</label> 
				<input name="extraAddress" type="text" style="width: 365px;" id="extraAddress" placeholder="참고항목" readonly value=" (삼평동)"><br>
				</div>		
						
				<div class="inputArea">
				<label for="">상세 주소</label> 				
				<input name="detailAddress" type="text" style="width: 365px;" id="detailAddress" value="101호">
				</div>			
				
				<div class="inputArea">
					<label for="">수령인</label> 
					<input type="text" name="oname" id="oname">
				</div>
				<div class="inputArea">
					<label for="">수령인 연락처</label> 
					<input type="text" name="ophone" id="ophone">
				</div>

				<td class="text-left">
				<input type="radio" id="bank" name="paymentWay" checked value="wayBank"	onclick="Select(this.value)"> 
				<label for="bank">무통장입금</label>
				<input type="radio" id="card" name="paymentWay" value="wayCard" onclick="Select(this.value)">
				<label for="card">카드결제</label>
				<br> 
				<span id="c1">
					<b>주문 후 12시간 이내에 입금 해주시기 바랍니다.</b>
					<br>
					<select	name="bank" id="bank">
						<option value="1">국민은행 123-45-67890</option>
						<option value="2">신한은행 110-430-128010</option>
					</select>
				</span>
				</td>
				<br>
				<input id="payment" type="submit" value="주문 결제" class="btn btn-success" /></td>
				<input id="payCancel" type="submit" value="취소" class="btn btn-danger" /></td>
		</form>
		</div>
	</section>

	<script type="text/javascript">
		$(function() {
			$(".orderOpen_bnt").click(function() {
				$(".order").slideDown();
				$(".orderOpen_bnt").slideUp();
			});
		});

		function Select(payWay) {
			
			if (payWay=="wayCard") {
				$('#c1').hide();

				$(function() {
					$("#payment").click(function() { 
						event.preventDefault();

						var IMP = window.IMP;
						IMP.init('imp67296218');//식별코드
						IMP.request_pay({
							pg : 'inicis',//결재방법(pg)
							pay_method : 'card',
							merchant_uid : 'merchant_' + new Date().getTime(),// 상점에서 관리하는 주문 번호
							name : '주문명:결제테스트',
							amount : 100, //실제 결제되는 가격
							buyer_email : 'iamport@siot.do',
							buyer_name : '구매자이름',
							buyer_tel : '010-1234-5678',
							buyer_addr : '서울 강남구 도곡동',
							buyer_postcode : '123-456'
						}, function(rsp) {
							console.log(rsp);
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.';
								msg += '고유ID : ' + rsp.imp_uid;
								msg += '상점 거래ID : ' + rsp.merchant_uid;
								msg += '결제 금액 : ' + rsp.paid_amount;
								msg += '카드 승인번호 : ' + rsp.apply_num;
							} else {
								var msg = '결제 실패';
								msg += '에러내용 : ' + rsp.error_msg;
							}
							alert(msg);
						});
					});
					
					$("#payCancel").click(function() {
						event.preventDefault();
						location.reload();
					});

				});
				
			} else if (payWay=="wayBank") {
				$('#c1').show();

				$(function() {
					$('#payment').click(function() {
						event.preventDefault();
					});

					$('#payCancel').click(function() {
						event.preventDefault();
						location.reload();
					});
				});
			}
		}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script>
	 function execPostcode() {
         new daum.Postcode({
             oncomplete: function (data) {
                 var addr = '';
                 var extraAddr = '';
                 if (data.userSelectedType === 'R') {
                     addr = data.roadAddress;
                 } else {
                     addr = data.jibunAddress;
                 }
                 if (data.userSelectedType === 'R') {
                     if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                         extraAddr += data.bname;
                     }
                     if (data.buildingName !== '' && data.apartment === 'Y') {
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     if (extraAddr !== '') {
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     document.getElementById("extraAddress").value = extraAddr;

                 } else {
                     document.getElementById("extraAddress").value = '';
                 }
                 document.getElementById('postcode').value = data.zonecode;
                 document.getElementById("address").value = addr;
                 document.getElementById("detailAddress").focus();
             }
         }).open();
     }
	 </script> 


	<jsp:include page="../footer.jsp" />
</body>
</html>