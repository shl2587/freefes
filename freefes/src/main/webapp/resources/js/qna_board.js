'use strict'

// qna_write.jsp 말머리 js
function addcategory() {
    var select = document.getElementById('category');
    var titleInput = document.getElementById('q_title');
    var addcategory = select.value !== "선택" ? select.options[select.selectedIndex].text : "";
    titleInput.value = addcategory + " " + titleInput.value;
  }