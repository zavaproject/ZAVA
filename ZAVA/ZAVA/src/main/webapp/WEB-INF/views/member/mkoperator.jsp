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
<title>운영자 등록</title>
</head>
<body>

	<jsp:include page="../member/header.jsp" />
		<section>
	
<form action="/member/mkoperator" method="post" id="insert">
<input name="mid" placeholder="아이디"><button id="idcheck" class="button">중복검사</button><i id="idCheckResult" style="margin-left: 0"></i><br>
<input name="mpw" type="password" placeholder="비밀번호"><br>
<input name="mname" placeholder="이름"><br>

<div class="radiotoggle">
	성별
<label class="radio">
  <input type="radio" name='mgender' value='남' checked>
  <i></i>남
</label>
<label class="radio">
  <input type="radio" name='mgender' value='여'>
  <i></i>여
</label>
</div>

<br>
<input type="tel" name="mphonenumber" id="telInput" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder="전화번호"/><br>
<input name="memail" type="email" placeholder="이메일"><br>

<input name="postcode" type="text" id="postcode" placeholder="우편번호" readonly>
<input type="submit" onclick="execPostcode()" value="우편번호 찾기"><br>
<input name="address" type="text" style="width: 365px;" id="address" placeholder="주소" readonly><br>
<input name="extraAddress" type="text" style="width: 365px;" id="extraAddress" placeholder="참고항목" readonly><br>
<input name="detailAddress" type="text" style="width: 365px;" id="detailAddress" placeholder="상세주소">

<br>
<input type="submit" value="회원 등록">
</form>

<script type="text/javascript">
$(document).ready(function() {
	
	$("input[type='submit']").click(function(event) {
		event.preventDefault();
		
		var mid = $("[name='mid']").val();
		if(mid==''){
			$("[name='mid']").focus();
			return;
		}
		
		var mname = $("[name='mname']").val();
		if(mname==''){
			$("[name='mname']").focus();
			return;
		}
		
		var mphonenumber = $("[name='mphonenumber']").val();
		if(mphonenumber==''){
			$("[name='mphonenumber']").focus();
			return;
		}
		
		var memail = $("[name='memail']").val();
		if(memail==''){
			$("[name='memail']").focus();
			return;
		}
		
		var postcode = $("[name='postcode']").val();
		if(postcode==''){
			$("[name='postcode']").focus();
			return;
		}
		
		var detailAddress = $("[name='detailAddress']").val();
		if(detailAddress==''){
			$("[name='detailAddress']").focus();
			return;
		}
		
		
		$("form").submit();
	});
	
	$("#idcheck").click(function(event) {
		event.preventDefault();
		
		var mid = $("[name='mid']").val();
		
		if(mid == ''){
			$("[name ='mid']").focus();
		}else{
			$.ajax({
				type : 'post',
				url : '/member/idcheck',
				data : {
					'mid' : mid
				},
				dataType : 'text',
				success : function(result) {
					
					$("i#idCheckResult").text(result);
					
				}
			});
		}
		
	})		
});

$('#telInput').keyup(function (event) {
	  event = event || window.event;
	  var _val = this.value.trim();
	  this.value = autoHypenTel(_val);
	});

function autoHypenTel(str) {
	  str = str.replace(/[^0-9]/g, '');
	  var tmp = '';

	  if (str.substring(0, 2) == 02) {
	    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
	    if (str.length < 3) {
	      return str;
	    } else if (str.length < 6) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2);
	      return tmp;
	    } else if (str.length < 10) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 3);
	      tmp += '-';
	      tmp += str.substr(5);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 4);
	      tmp += '-';
	      tmp += str.substr(6, 4);
	      return tmp;
	    }
	  } else {
	    // 핸드폰 및 다른 지역 전화번호 일 경우
	    if (str.length < 4) {
	      return str;
	    } else if (str.length < 7) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3);
	      return tmp;
	    } else if (str.length < 11) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 3);
	      tmp += '-';
	      tmp += str.substr(6);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 4);
	      tmp += '-';
	      tmp += str.substr(7);
	      return tmp;
	    }
	  }

	  return str;
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
	
		</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>