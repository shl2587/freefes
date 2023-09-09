<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>

<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">Message-List</span>
		</h3>
	</div>
</div>
<hr>

<div class="message_dropdown" id="drag_wrap">
    <button class="message_dropbtn" id="drag_btn"> 
	   <span class="message_dropbtn_icon"></span>
	   <i class="fa-solid fa-envelope" style="color: #ff8838;"></i>
    </button>
    <div class="message_dropdown-content">
	   <a href="${cpath }/admin_board/management_message_list/${login.idx}">Message-List</a>
	   <a href="${cpath }/admin_board/management_receivedMessage_list/${login.idx}">ReceiveMessage-List</a>
	   <a class="sendm_btn" id="management_message_openModalBtn" href="${cpath }/admin_board/management_send_message/${login.idx} ">SendMessage</a>
	   <a href="${cpath }/admin_board/management_sendMessage_list/${login.idx}">SendMessage-List</a>
    </div>
</div>

<div id="management_message_main">
	<table class="management_message_table">
	  <thead>
	    <tr>
			<th>Sender</th>
			<th>Reciever</th>
	      	<th>Title</th>
			<th>Category</th>
			<th>Date</th>
	     	<th class="listMessage_table_th"><input type="checkbox" class="message-checkbox_All" data-idx="${dto.idx}"></th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach var="dto" items="${list}">
	      <tr>
	        <td><div class="writer">${dto.writer_nickname}</div></td>
	        <td><div class="receiver">${dto.receiver_nickname}</div></td>
	        <td><div class="title"><a href="${cpath }/admin_board/management_message_view/${dto.idx}">${dto.title}</a></div></td>
	        <td><div class="category">${dto.category}</div></td>
	        <td><div class="date">${dto.date_column}</div></td>
	        <td class="listMessage_table_td"><input type="checkbox" class="message-checkbox" data-idx="${dto.idx}"></td>
	      </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>

<div class="delete_btn">
	<button type="button" class="message_delete_button"  data-idx="${dto.idx}">
		<i class="fa-solid fa-trash" style="color: #434977;"></i>
	</button>
</div>


<!-- 보내기 모달--------------------------------------------------- -->
<div class="management_modal" id="management_message_sendMessageModal">
  <div class="management_modal-dialog">
    <div class="management_modal-content">
      <div class="management_modal-header">
        <h2 class="management_modal-title">Send Message</h2>
        <button type="button" class="management_close" id="management_message_closeModalBtn">&times;</button>
      </div>
      <form id="management_message_sendMessageForm" action="${cpath}/admin_board/management_send_message/${login.idx}" method="POST">
        <div class="management_modal-body">
          <input type="hidden" name="writer" value="${login.idx}">
           <select name="category">
             <option value="qna/user">문의글/계정</option>
             <option value="qna/event">문의글/행사</option>
             <option value="etcetera">기타</option>
             <option value="nickname">닉네임</option>
           </select>
          <input type="text" name="receiver_nickname" placeholder="Reciever">
          <div class="input-group">
            <input class="modal-content-title" type="text" name="title" placeholder="title">
          </div>
          <textarea name="content" placeholder=" 300자 이하로 작성해주세요."></textarea>
        </div>
        <div class="management_modal-footer">
          <input type="submit" value="POST">
          <button type="button" class="btn" id="management_message_cancelModalBtn">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>



<div class="page_wrap">
   <div class="page_nation">
      <c:if test="${paging_dto.prev && paging_dto.page_begin > 1}">
	      <a class="arrow prev" href="${cpath }/admin_board/management_message_list?request_page=${paging_dto.page_begin - paging_dto.per_page}"></a>
	  </c:if>
	  <c:forEach var="page_number" begin="${paging_dto.page_begin }" end="${paging_dto.page_end }">
      	  <a href="${cpath }/admin_board/management_message_list?request_page=${page_number}" class="active">${page_number }</a>
      </c:forEach>
      <c:if test="${paging_dto.next && paging_dto.page_end < paging_dto.total_count}">
      	  <a class="arrow next" href="${cpath }/admin_board/management_message_list?request_page=${paging_dto.page_end + 1 }"></a>
      </c:if>
   </div>
</div>


</main>



<script>
function updateSelectAllCheckboxState() {
    var checkboxes = document.querySelectorAll('.message-checkbox');
    var selectAllCheckbox = document.querySelector('.message-checkbox_All');

    var allChecked = true;  // 모든 체크박스가 체크되었는지의 여부

    for (var i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            allChecked = false;
            break;
        }
    }

    selectAllCheckbox.checked = allChecked;
}

// 각 체크박스의 클릭 이벤트 처리
var checkboxes = document.querySelectorAll('.message-checkbox');
for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener('click', updateSelectAllCheckboxState);
}

// 체크박스 전체 선택/해제 이벤트 처리
var selectAllCheckbox = document.querySelector('.message-checkbox_All');
selectAllCheckbox.addEventListener('click', toggleAllCheckboxes);


// 체크된 체크박스의 data-idx 값을 가져오는 함수
function getCheckedCheckboxesIdx() {
    var checkboxes = document.querySelectorAll('.message-checkbox');
    var checkedIdxes = [];

    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            var idx = checkbox.getAttribute('data-idx');
            console.log("Checked checkbox data-idx:", idx); // 여기서 체크된 체크박스의 data-idx 값을 바로 출력
            checkedIdxes.push(idx);
        }
    })

    return checkedIdxes;
}

document.querySelector('.message_delete_button').addEventListener('click', async function() {
    var checkedValues = getCheckedCheckboxesIdx();
    console.log("Checked checkboxes data-idx values:", checkedValues);


    for(var i = 0; i < checkedValues.length; i++){
        var idx = checkedValues[i];
        const url = cpath + '/message_delete/' + idx;
        const count = await fetch(url).then(resp => resp.text()); 
        console.log(count);
        if(count != 0){
        	alert("삭제가 완료되었습니다");
	        location.reload();
        }
        else{
        	alert("메시지가 삭제되지 않았습니다.");
        }
    }
    
});
</script>
</body>
</html>