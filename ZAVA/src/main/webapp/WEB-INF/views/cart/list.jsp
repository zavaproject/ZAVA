<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>바스켓백</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
  
  <link rel="stylesheet" href="/resources/css/cart.css">
  <link href="../../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>


    <form name="cart" id="cart" method="post" class="orderform" action="/cart/list">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">
                        	<input type="checkbox" class="allCheck" name="allCheck" id="allCheck" checked>&nbsp;
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
                
                <c:set var="sum_amount" value="0"/>
                <c:set var="sum" value="0"/>
                
        
        		<c:forEach items="${cartList}" var="cartList" varStatus="status">
        
                <div class="row data" id="item_list">
                    <div class="subdiv">
                        <div class="check">
                        	<input type="checkbox" class="checkbox" name="buy" data-cId="${cartList.cid}" checked>&nbsp;
                        </div>
                        <div class="img"><img src="../../resources/img/cartTest.jpg" width="60"></div>
                        <div class="pname">
                        	<!-- 상품 자세히보기 연결 -->
                            <span><a href="#">${cartList.pname}</a></span>
                            <span>${cartList.pid}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">
                        <fmt:formatNumber pattern="###,###,###" value="${cartList.price}"/>원
                        </div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num" id="p_num" size="2" data-pId="${cartList.pid}" class="p_num" value="${cartList.pcnt}" readonly>                                
                                <span id="plma">
                                	<button type="button" name="plus_btn" class="plus_btn abutton" data-pcnt="${cartList.cid}">+</button>
                                	<button type="button" name="minus_btn" class="minus_btn abutton" data-pcnt="${cartList.cid}">-</button>
                                </span>
                            </div>
                        </div>
                        <div>
          				  	<c:set var="p_sum" value="${cartList.price * cartList.pcnt}"/>
                    	    <fmt:formatNumber pattern="###,###,###" value="${p_sum}"/>원
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="delete"><button type="button" class="delete_btn abutton" data-cId="${cartList.cid}">삭제하기</button></div>
            	</div>
            </div>
            	<c:set var="sum_amount" value="${sum_amount + (cartList.pcnt)}"/>
            	<c:set var="sum" value="${sum + (cartList.price * cartList.pcnt)}"/>
        	    </c:forEach>
        	    
    
            <div class="right-align basketrowcmd">
                <button type="button" class="selectDelete_btn abutton">선택상품삭제</button>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum">
            	<input type="hidden" name="sum_p_num" id="sum_p_num" class="sum_p_num" value="${sum_amount}">${sum_amount}개
			</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="/order/list">선택한 상품 주문</a>
                </div>
            </div>
            </div>
        </form>
        
        
<jsp:include page="../footer.jsp"/>


<script type="text/javascript">

	$(document).ready(function() {
		
		/* 수량 변경 */
		/* + */
		$(".plus_btn").on("click", function() {
			var pid = $(this).closest("div").find("input").attr("data-pId");
			
			var p_num = $(this).closest("div").find("input").val();
			$(this).closest("div").find("input").val(++p_num);
			
			$.ajax({
				url : "/cart/update",
				type : "post",
				data : {
					pid : pid,
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
			var pid = $(this).closest("div").find("input").attr("data-pId");
			var p_num = $(this).closest("div").find("input").val();
			
			if(p_num > 1){
				$(this).closest("div").find("input").val(--p_num);
				
				$.ajax({
					url : "/cart/update",
					type : "post",
					data : {
						pid : pid,
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
							/* location.assign = "/cart/list"; */
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
							/* location.assign = "/cart/list"; */
							alert("상품이 삭제되었습니다.");
							location.reload();
						}else{
							alert("삭제 실패");
						}
					}
				});
			}
		});
		
		
		/* 나중에 product read의 장바구니 버튼으로 코드 옮기기 */
		/* $(".addCart_btn").click(function() {
			var pid = $("#pid").val();
			var pcnt = $(".#").val();
			
			var data = {
					pid : pid,
					pcnt : pcnt
			};
			
			$.ajax({
				url : "/cart/insert",
				type : "post",
				data : data,
				success : function() {
					alert("카트 담기 성공");
					$(".#").val("1");
				},
				error : function() {
					alert("카트 담기 실패");
				}
			});
			
		}); */
		
		
		
		/* 상품의 장바구니 추가 버튼 누르면 장바구니에 추가하는 기능, 나중에 장바구니 버튼 구현되어있는곳에 옮기기*/
		/* 서버로 전송할 데이터 */
		/* const form = {
				mid : "${map.mid}",
				pid : "${map.pid}",
				pcnt : ''
		}
		
		$(".#").on("click", function(e) {
			form.pcnt = $(".p_num").val();
			
			$.ajax({
				url : "/cart/insert",
				type : "POST",
				data : form,
				success : function(result) {
					cartAlert(result);
				}
			});
			
		});
		
		function cartAlert(result){
			if(result == 0){
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if(result == 1){
				alert("장바구니에 추가되었습니다.");
			} else if(result == 2){
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if(result == 5){
				alert("로그인이 필요합니다.");
			}
		} */
		
	});

</script>

</body>

</html>