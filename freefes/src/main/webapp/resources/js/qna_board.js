'use strict'

// qna_write.jsp 말머리 js
function addcategory() {
    var select = document.getElementById('category');
    var titleInput = document.getElementById('q_title');
    var addcategory = select.value !== "선택" ? select.options[select.selectedIndex].text : "";
    titleInput.value = addcategory + " " + titleInput.value;
  }

// 클라이언트 qna 개별, 전체 삭제

//페이지 로드 후 코드 실행
window.onload = function() {
// 전체 선택,  반복하면서 체크
  document.getElementById("selectAll").addEventListener("click", function() {
    var checkboxes = document.getElementsByName('deleteCheckbox');
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = this.checked;
    }
  });
};


// XML 객체 사용하여 AJAX 요청 실행, 체크 값 배열에 JSON형식으로 담고 서버에 전송
// 서버 응답 오면 페이지 새로고침, 메세지 반환
function deletemy_q() {
	  var selectedIdx = [];
	  var checkboxes = document.getElementsByName('deleteCheckbox');
	 
	  for (var i = 0; i < checkboxes.length; i++) {
	    if (checkboxes[i].checked) {
	      selectedIdx.push(checkboxes[i].value);
	    }
	  }

	  if (selectedIdx.length === 0) {
	    alert('삭제할 문의를 선택하세요');
	    return;
	  }

	  if (confirm('선택한 항목을 삭제하시겠습니까?')) {
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST", "/delete", true);
	    xhr.setRequestHeader("Content-Type", "application/json");

	    xhr.onreadystatechange = function() {
	      if (xhr.readyState === 4 && xhr.status === 200) {
	        location.reload();
	      } else if (xhr.readyState === 4) {
	        alert('삭제 실패');
	      }
	    };

	    xhr.send(JSON.stringify(selectedIdx));
	  }
	}