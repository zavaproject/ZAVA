/**
 * 
 */

function form(){
	var msg =`
	<form>
	<h3>옵션</h3>
			재품 코드 : <input class="ocode" name="ocode" maxlength="33"> ex) aa제품 빨강 90사이즈 = aa-r-90<br>
			재고 : <input class="ostock" name="ostock" type="number" maxlength="33"><br>
			사이즈 : <input class="ocolor" name="ocolor" maxlength="33"><br>
			색상 : <input class="osize" name="osize" maxlength="33"><br>
			
	</form>
			`;
			
			return msg;
}