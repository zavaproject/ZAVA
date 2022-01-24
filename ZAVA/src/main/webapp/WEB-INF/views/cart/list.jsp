<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바스켓백</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

<link rel="stylesheet" href="/resources/css/cart.css">
<link href="../../../resources/css/style.css" rel="stylesheet"
	type="text/css">
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
	<jsp:include page="../header.jsp" />
	<section>

		<div class="container" style="margin-top: 20px;">
			<form name="cart" id="cart" method="post" class="orderform"
				action="/cart/list">
				<div class="right-align basketrowcmd">
					<button type="button" class="selectDelete_btn abutton">선택상품삭제</button>
				</div>
				<input type="hidden" name="cmd" value="order">
				<div class="basketdiv" id="basket">
					<div class="row head">
						<div class="subdiv">
							<div class="check">
								<input type="checkbox" class="allCheck" name="allCheck"
									id="allCheck" checked>&nbsp;
							</div>
							<div class="img">이미지</div>
							<div class="pname">상품명</div>
						</div>
						<div class="subdiv">
							<div class="basketprice">판매가</div>
							<div class="num">수량</div>
							<div class="sum">주문금액</div>
						</div>
						<div class="subdiv">
							<div class="basketcmd">주문관리</div>
						</div>
						<div class="split"></div>
					</div>

					<c:set var="sum_amount" value="0" />
					<c:set var="sum" value="0" />

					<c:choose>
						<c:when test="${empty cartList}">
							<div align="center" style="font-size: 30px;">장바구니가 비었습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${cartList}" var="cartList" varStatus="status">

								<div class="row data" id="item_list">
									<div class="subdiv">
										<div class="check">
											<input type="checkbox" class="checkbox" name="buy"
												data-cId="${cartList.cid}" checked>&nbsp;
										</div>
										<div class="img">
											<a href="/product/read/${cartList.pid}"> <img
												alt="thumbnail"
												src="/resources/productupload/${cartList.filename}"
												width="40">
											</a>
										</div>
										<div class="pname">
											<!-- 상품 자세히보기 연결 -->
											<span><a href="/product/read/${cartList.pid}">${cartList.pname}</a></span><br>
											<span style="font-size: 12px;">옵션:${cartList.pname},
												${cartList.ocolor}, ${cartList.osize}</span>
										</div>
									</div>
									<div class="subdiv">
										<div class="basketprice">
											<fmt:formatNumber pattern="###,###,###"
												value="${cartList.price}" />
											원
										</div>
										<div class="num">
											<div class="updown">
												<button type="button" name="minus_btn"
													class="minus_btn abutton" data-pcnt="${cartList.cid}">-</button>
												<input type="text" name="p_num" id="p_num" size="2"
													data-ocode="${cartList.ocode}" class="p_num"
													value="${cartList.pcnt}" readonly>
												<button type="button" name="plus_btn"
													class="plus_btn abutton" data-pcnt="${cartList.cid}">+</button>
											</div>
										</div>
										<div>
											<c:set var="p_sum" value="${cartList.price * cartList.pcnt}" />
											<fmt:formatNumber pattern="###,###,###" value="${p_sum}" />
											원
										</div>
									</div>
									<div class="subdiv">
										<div class="delete">
											<button type="button" class="delete_btn abutton"
												data-cId="${cartList.cid}">삭제하기</button>
										</div>
									</div>
								</div>
								<c:set var="sum_amount" value="${sum_amount + (cartList.pcnt)}" />
								<c:set var="sum"
									value="${sum + (cartList.price * cartList.pcnt)}" />
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<div class="bigtext right-align sumcount" id="sum">
						<input type="hidden" name="sum_p_num" id="sum_p_num"
							class="sum_p_num" value="${sum_amount}">${sum_amount}개
					</div>
					<div class="bigtext right-align box blue summoney" id="sum_p_price">
						합계금액:
						<fmt:formatNumber pattern="###,###,###" value="${sum}" />
						원
					</div>
		
					<div class="orderOpen">
						<button type="button" class="orderOpen_bnt">주문 정보 입력</button>
					</div>
				</div>
				
		</div>

		<div class="order">
			<form action="/cart/List" method="post" autocomplete="off">


				<input type="hidden" name="mid" id="mid" value="${login.mid}">
				<input type="hidden" name="amount" id="amount" value="${sum}">
				<div>

					<input type="radio" id="originRadio" name="selectAddress" checked
						value="originAddress" onclick="Select(this.value)"> 기존 배송지

					<input type="radio" id="newRadio" name="selectAddress"
						value="newAddress" onclick="Select(this.value)"> 신규 배송지
				</div>

				<div class="addressdiv" id="origin">

					<div class="inputArea">
						<label for="">우편 번호</label> <input name="postcode" type="text"
							id="postcode" readonly value="${login.postcode}">
						<input type="button" onclick="execPostcode()" value="우편번호 찾기"><br>
					</div>

					<div class="inputArea">
						<label for="">주소</label> <input name="address" type="text"
							style="width: 365px;" id="address" readonly
							value="${login.address}"><br>
					</div>

					<div class="inputArea">
						<label for="">참고 항목</label> <input name="extraAddress" type="text"
							style="width: 365px;" id="extraAddress" placeholder="참고항목"
							readonly value="${login.extraAddress}"><br>
					</div>

					<div class="inputArea">
						<label for="">상세 주소</label> <input name="detailAddress"
							type="text" style="width: 365px;" id="detailAddress"
							value="${login.detailAddress}">
					</div>

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="oname"
							id="oname">
					</div>
					<div class="inputArea">
						<label for="">수령인 연락처</label> <input type="text" name="ophone"
							id="ophone">
					</div>
				</div>


				<div class="addressdiv" id="new">

					<div class="inputArea">
						<label for="">우편 번호</label> <input name="postcode" type="text"
							id="postcode" value="">
						<input type="button" onclick="execPostcode()" value="우편번호 찾기"><br>
					</div>

					<div class="inputArea">
						<label for="">주소</label> <input name="address" type="text"
							style="width: 365px;" id="address"
							value=""><br>
					</div>

					<div class="inputArea">
						<label for="">참고 항목</label> <input name="extraAddress" type="text"
							style="width: 365px;" id="extraAddress" placeholder="참고항목"
							 value=""><br>
					</div>

					<div class="inputArea">
						<label for="">상세 주소</label> <input name="detailAddress"
							type="text" style="width: 365px;" id="detailAddress"
							value="">
					</div>

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="oname"
							id="oname">
					</div>
					<div class="inputArea">
						<label for="">수령인 연락처</label> <input type="text" name="ophone"
							id="ophone">
					</div>
				</div>

				<input type="radio" id="bank" name="paymentWay" checked
					value="wayBank" onclick="Select(this.value)"> <label
					for="bank">무통장입금</label> <input type="radio" id="card"
					name="paymentWay" value="wayCard" onclick="Select(this.value)">
				<label for="card">카드결제</label> <br> <span id="c1"> <b>주문
						후 12시간 이내에 입금 해주시기 바랍니다.</b> <br> <select name="bank" id="bank">
						<option value="1">국민은행 123-45-67890</option>
						<option value="2">신한은행 110-430-128010</option>
				</select>
				</span> <br> <input id="payment" type="submit" value="주문 결제"
					class="btn btn-success" /> <input id="payCancel" type="submit"
					value="취소" class="btn btn-danger" />
			</form>
		</div>

	</section>

	<script type="text/javascript">

   $(document).ready(function() {
      
      /* 수량 변경 */
      /* + */
      $(".plus_btn").on("click", function() {
         var ocode = $(this).closest("div").find("input").attr("data-ocode");
         
         var p_num = $(this).closest("div").find("input").val();
         $(this).closest("div").find("input").val(++p_num);
         
         $.ajax({
            url : "/cart/update",
            type : "post",
            data : {
               ocode : ocode,
               pcnt : p_num
            },
            dataType : "text",
            success : function(result) {
               if(result == 1){
                  alert("수량이 변경되었습니다.");
                  location.reload();
               }
            }
         });
      });
      
      /* - */
      $(".minus_btn").on("click", function() {
         var ocode = $(this).closest("div").find("input").attr("data-ocode");
         var p_num = $(this).closest("div").find("input").val();
         
         if(p_num > 1){
            $(this).closest("div").find("input").val(--p_num);
            
            $.ajax({
               url : "/cart/update",
               type : "post",
               data : {
                  ocode : ocode,
                  pcnt : p_num
               },
               dataType : "text",
               success : function(result) {
                  if(result == 1){
                     alert("수량이 변경되었습니다.");
                     location.reload();
                  }
               }
            });
         }
      });
      
      /* 모두선택 체크박스 */
      $("#allCheck").click(function() {
         var chk = $("#allCheck").prop("checked");
         
         if(chk){
            $(".checkbox").prop("checked", true);
         }else{
            $(".checkbox").prop("checked", false);
         }
      });
      
      /* 체크박스 */
      $(".checkbox").click(function() {
         $("#allCheck").prop("checked", false);
      });
      
      /* 선택 상품 삭제 */
      $(".selectDelete_btn").click(function() {
         var confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");
         
         if(confirm_val){
            var checkArr = new Array();
            
            $("input[class='checkbox']:checked").each(function() {
               checkArr.push($(this).attr("data-cId"));
            });
            
            $.ajax({
               url : "/cart/delete",
               type : "post",
               data : {checkArr : checkArr},
               success : function(result) {
                  if(result == 1){
                     alert("선택한 상품이 삭제되었습니다.");
                     location.reload();
                  }else{
                     alert("삭제 실패");
                  }
               }
            });
         }
      });
      
      
      /* 그냥 삭제 버튼 delete_btn */
      $(".delete_btn").click(function() {
         var confirm_val = confirm("상품을 삭제하시겠습니까?");
         
         if(confirm_val){
            var checkArr = new Array();
            
            checkArr.push($(this).attr("data-cId"));
            
            $.ajax({
               url : "/cart/delete",
               type : "post",
               data : {checkArr : checkArr},
               success : function(result) {
                  if(result ==1){
                     alert("상품이 삭제되었습니다.");
                     location.reload();
                  }else{
                     alert("삭제 실패");
                  }
               }
            });
         }
      });
   });

</script>

	<!-- order================================== -->

	<script type="text/javascript">
      $(function() {
         $(".orderOpen_bnt").click(function() {
            $(".order").slideDown();
            $(".orderOpen_bnt").slideUp();
         });
      });
      
      $("#new").hide();

      function Select(payWay) {
         
         if (payWay=="wayCard") {
            $('#c1').hide();

            $(function() {
               $("#payment").click(function(event) { 
                  event.preventDefault();

                  var IMP = window.IMP;
                  IMP.init('imp45175040');//식별코드
                  IMP.request_pay({
                     pg : 'inicis',//결재방법(pg)
                     pay_method : 'card',
                     merchant_uid : 'merchant_' + new Date().getTime(),// 상점에서 관리하는 주문 번호
                     name : 'inicis 결제',
                     amount : ${sum}, //실제 결제되는 가격
                     buyer_name : oname,
                     buyer_tel : ophone,
                     buyer_addr : address,
                     buyer_postcode : postcode
                  }, function(rsp) {
                     console.log(rsp);
                     if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        $("form").submit();
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
               $('#payment').click(function(event) {
                  event.preventDefault();
               });

               $('#payCancel').click(function(event) {
                  event.preventDefault();
                  location.reload();
               });
            });
         }
      }
      
      $('input[name="selectAddress"]').on("change", function() {
         $(".addressdiv").hide();
         var id = $(this).attr("id");
         if(id=="originRadio") {
            $("#origin").show();
         } else {
            $("#new").show();
         }
      })         
   </script>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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


	</section>
	<jsp:include page="../footer.jsp" />
</body>

</html>