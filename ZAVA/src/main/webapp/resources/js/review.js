/*//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성
*/
function getReviewsPage(pid, curPage, el){
   el.html("");
   
   $.getJSON("/review/"+pid+"/"+curPage, function(data){
      var arr = data["list"];
      console.log(arr);
      for(var i=0;i<arr.length;i++){
         var obj = arr[i];
         msg = reviewform(obj["rno"], obj["title"], obj["mid"], obj["updatedate"], obj["rating"]);
         el.append(msg);      
      }
      var strPage = `
      <nav aria-label="Page pagination-sm navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link reply_page_left" href="${data['curPage']}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
      
      `;
      
      
      for(var i = data.beginPageNum; i < data.endPageNum+1; i++){
         var activeOr = data.curPage == i?"active":"";
         strPage += `<li class="page-item ${activeOr}"><a class="page-link reply_page_no" href="#">${i}</a></li>`;
      }
      
      
      strPage +=`
          <li class="page-item">
      <a class="page-link reply_page_right" href="${data['curPage']}" data-totalPage="${data['totalPage']}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
      `;
      
         el.append(strPage);
      
   });
}



function getReviews(pid, el){
   el.html("");
   
   $.getJSON("/review/"+pid, function(data){
      for(var i=0;i<data.length;i++){
         var obj = data[i];
         msg = reviewform(obj["rno"], obj["title"], obj["mid"], obj["updatedate"], obj["rating"]);
         
         
         el.append(msg);
      }
   });
   }
   
function reviewform(rno, title, mid, updatedate, rating){
   var msg= `

            <tr>
               <td>${rno}</td>
				<td class="star2" style="float:left"> ${rating ==1 ? "★" : ""}
					${rating ==2 ? "★★" : ""}
					${rating ==3 ? "★★★" : ""}
					${rating ==4 ? "★★★★" : ""}
					${rating ==5 ? "★★★★★" : ""}</td>
               <td><a href="/review/read/${rno}/1">${title}</a></td>
               <td>${mid}</td>
               <td>${updatedate}</td>
               
            </tr>

   `;
   
   return msg;
}