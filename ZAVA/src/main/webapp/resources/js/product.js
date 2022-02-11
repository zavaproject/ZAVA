/**
 * 
 */

function form(){
	var msg =`
	<form>
	<h3>옵션</h3>
			옵션 코드 : <input class="ocode" name="ocode" maxlength="33"> ex)제품ID-색상-사이즈<br>
			재고 : <input class="ostock" name="ostock" type="number" maxlength="33"><br>
			색상 : <input class="ocolor" name="ocolor" maxlength="33"><br>
			사이즈 : <input class="osize" name="osize" maxlength="33"><br>			
	</form>
			`;
			
			return msg;
}


//---------------------------------------------------이미지업로드

function uploadedItemForRead2(filename,keyarr){
	
	var originalFilename = getOriginalFilename(filename);
	var arr = keyarr
//	var msg = `
//		<div class='uploadedItemForRead2 col-sm-3 text-center'>
//			<img src='${getImageUrl(filename)}'>
//			<p class='uploadedItemForReadP'><a href='/product/read/${arr[0]}'>${arr[1]}</a></p>
//		</div>
//	`;
	var msg = `
		 <div class="uploadedItemForRead2">
          <div class="prdimg card">
			<a href='/product/read/${arr[0]}'>
          	<img src='${getImageUrl(filename)}'>
			</a>

  				<a href='/product/read/${arr[0]}'><div class="namebody">
    			${arr[1]}
 				 </div></a>
          </div>  
          
        </div>
	`;
	
	return msg;
}


function uploadedItemForRead(filename,pid){
	
	var originalFilename = getOriginalFilename(filename);
	var linkfilename = getLinkUrl(filename);
	var msg = `
		<div class='uploadeditem text-center'>
			<img src='${getImageUrl(linkfilename)}'>
			
		</div>
	`;
	
	return msg;
}

function uploadedItem(filename){
	
	var originalFilename = getOriginalFilename(filename);
	var linkfilename = getLinkUrl(filename);
	var msg = `
		<div class='uploadeditem text-center'>
			<img src='${getImageUrl(linkfilename)}'>
			<p class='uploadedItemP'>${originalFilename}</p>  
			<div><button data-filename='${filename}' class="btn btn-danger btn-sm deleteitem">삭제</button></div>
		</div>
	`;
	
	return msg;
}


function getLinkUrl(filename){
	
	if(checkImageFile(filename)){
		var prefix = filename.substring(0, 12);
		var suffix = filename.substring(14);
		filename = prefix + suffix;
	}
	
	
	return filename;
}


function getImageUrl(filename){
	var url = "";
	
	if(checkImageFile(filename)){
		url="/productimg/displayfile?filename="+filename;
	}else{
		url="/resources/img/imgNO.jpg";
	}
	
	return url;
}


function getOriginalFilename(filename){
	var idx = -1;
	
	if(checkImageFile(filename)){
		idx = filename.indexOf("_", 14);
		
	}else{
		idx = filename.indexOf("_");
		
	}
	
	return filename.substring(idx+1);
}



function checkImageFile(filename){
	
	var idx = filename.lastIndexOf(".")+1;
	var formatName = filename.substring(idx);
	
	formatName = formatName.toUpperCase();
	
	if(formatName=="PNG" || formatName == "JPG" || formatName == "JPEG" 
												|| formatName == "GIF"){
		return true;
	}else{
		return false;
	}
}



function deleteFile(filename){
	var msg = `
		<input type='hidden' name="deletefiles" value="${filename}">
	`;
	return msg;
}


function insertFile(filename){
	var msg = `
		<input type='hidden' name="insertfiles" value="${filename}" class="insertfiles">
	`;
	return msg;
}

function newHtml(){
   var msg = `
   <div class="inputArea">
                  <label for="">우편 번호</label> <input name="postcode" type="text"
                     id="postcode" value=""> <input type="button"
                     onclick="execPostcode()" value="우편번호 찾기"><br>
               </div>

               <div class="inputArea">
                  <label for="">주소</label> <input name="address" type="text"
                     style="width: 365px;" id="address" value=""><br>
               </div>

               <div class="inputArea">
                  <label for="">참고 항목</label> <input name="extraAddress" type="text"
                     style="width: 365px;" id="extraAddress" placeholder="참고항목"
                     value=""><br>
               </div>

               <div class="inputArea">
                  <label for="">상세 주소</label> <input name="detailAddress"
                     type="text" style="width: 365px;" id="detailAddress" value="">
               </div>

               <div class="inputArea">
                  <label for="">수령인</label> <input type="text" name="oname"
                     id="oname">
               </div>
               <div class="inputArea">
                  <label for="">수령인 연락처</label> <input type="text" name="ophone"
                     id="ophone">
               </div>

`;

return msg;
}

function originHtml(postcode, address,extraAddress, detailAddress ){
   var msg = `
<div class="inputArea">
                  <label for="">우편 번호</label> <input name="postcode" type="text"
                     id="" readonly value="${postcode}">
               </div>

               <div class="inputArea">
                  <label for="">주소</label> <input name="address" type="text"
                     style="width: 365px;" id="" readonly
                     value="${address}"><br>
               </div>

               <div class="inputArea">
                  <label for="">참고 항목</label> <input name="extraAddress" type="text"
                     style="width: 365px;" id="" placeholder="참고항목"
                     readonly value="${extraAddress}"><br>
               </div>

               <div class="inputArea">
                  <label for="">상세 주소</label> <input name="detailAddress"
                     type="text" style="width: 365px;" id=""
                     value="${detailAddress}">
               </div>

               <div class="inputArea">
                  <label for="">수령인</label> <input type="text" name="oname"
                     id="oname">
               </div>
               <div class="inputArea">
                  <label for="">수령인 연락처</label> <input type="text" name="ophone"
                     id="ophone">
               </div>

`;

return msg;
}

















