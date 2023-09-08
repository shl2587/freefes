<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

<style>
   /* 기본 스타일 */
form#myForm {
    width: 400px;
    margin:auto; /* 상단 여백 추가 */
    font-family: Arial, sans-serif;
    background-color: #f9f9f9; /* 배경색 추가 */
    padding: 20px;
    border-radius: 8px; /* 둥근 테두리 추가 */
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
}
h1.modify_title_h1  {
    font-size: 32px;            /* 글자 크기를 크게 설정 */
    color: #007BFF;             /* 파란색으로 설정 */
    text-align: center;         /* 중앙 정렬 */
     padding-bottom: 10px;       /* 아래쪽 패딩 추가 */ 
    margin-bottom: 20px;        /* 아래쪽 여백 추가 */ 
}
.member_modify_pass_all{
    border: 1px solid #e0e0e0;
    padding: 10px;
    margin-bottom: 9px; 
    border-radius: 4px; /* 입력란에 둥근 테두리 추가 */
    height: 50px;
}
#passwd_change{
	 padding-bottom: 10px;
}
.member_modify_nickname_all{
    border: 1px solid #e0e0e0;
    padding: 10px;
    margin-bottom: 9px; 
    border-radius: 4px; /* 입력란에 둥근 테두리 추가 */
}

input[type="text"].modify_text, input[type="password"].modify_text {
    width: 100%;
    padding: 8px;
    border: 1px solid #e0e0e0;
    margin-bottom: 10px;
    box-sizing: border-box;
    border-radius: 4px;
}

input[type="text"].modify_text:focus, input[type="password"]:focus {
    border-color: #007BFF; /* 포커스 시 테두리 색상 변경 */
    outline: none; /* 브라우저 기본 포커스 스타일 제거 */
}

input[type="submit"].modify_submit_btn{
    width: 100%;
    padding: 10px 15px; 
    border: none;
    cursor: pointer;
    border-radius: 4px;
}

input[type="submit"].modify_submit_btn {
    background-color: #007BFF;
    color: white;
}

input[type="submit"].modify_submit_btn:hover {
    background-color: #0056b3; /* 버튼 호버 시 색상 어둡게 변경 */
}

#nickCheckMessage {
    display: block;
    text-align: center;
    font-size: 20px;
    color: red;
    margin-top: 5px;
}

#logLeaveBtn {
    color: #a9a9a9;
    padding: 10px 15px;
    width: 30%;
    cursor: pointer;
    border: 1px solid white;
    background: white;
    margin: 20px auto; /* 중앙 정렬을 위한 설정 */
    display: block;
    text-align: center;
    border-radius: 4px;
}

#logLeaveBtn:hover {
    text-decoration: underline; /* 호버 상태일 때 밑줄 추가 */
    background-color: #f2f2f2; /* 약간의 배경색 변경 */
}
/* 비밀번호 변경 란 */
.member_modify_pass_all {
    position: relative;
    padding-bottom: 40px; /* 버튼이 입력란 아래에 오도록 패딩 추가 */
}

/* 비밀번호 변경 버튼 */
#passwd_change {
    bottom: 0; /* 입력란 하단에 배치 */
    width: 100%; /* 부모 요소 너비만큼 버튼 너비 설정 */
}

/* 연락처와 주소 변경란의 겉 선 제거 */
.member_modify_phone_all, .add {
    border: none;
}

/* 닉네임 중복확인 메시지 공간 확보 (버튼 위치 고정을 위함) */
#nickCheckMessage {
    min-height: 20px; /* 최소 높이 지정 */
    font-size: 15px;
}

   .profile {
      cursor: pointer;
      z-index: 3;
   }
   .profile > img {
      width: 100px;
      height: 100px;
      border: 2px solid black; 
      border-radius: 50%;
      z-index: 1;
      padding: 0;
      background-color: #0068FF;
   }
   .img_hidden {
      display: none;
      margin-left: 150px;
      position: absolute;
      padding: 0;
      height: auto;
   }
   
.img_hidden::before {
  border-top: 30px solid transparent;
  border-bottom: 30px solid transparent;
  border-right: 30px solid #002E7F;
  content: "";
  position: absolute;
  top: 15%;
  left: -30px; /* 화살표의 위치 조정 */
  transform: translateY(-50%);
  z-index: 3;
}
    .img_hidden.show {
      display: block;
      border: 1px solid #002E7F;
      border-radius: 20px;
      background-color: white;
      z-index: 2;
      padding: 0;
      background-color: #002E7F;
  }
   .img_hidden > .select_img {
      display: grid;
       grid-template-columns: repeat(3, 1fr); /* 3개의 동일한 너비의 열 생성 */
      margin: 0; 
      
   }
   .select_img div {
      margin-bottom: -5px;
      width: 150px;
       height: auto;
   }
   .select_img > div > img {
        width: 150px;
       height: auto;
       border-radius: 20px;
       margin: 0;
       padding: 0;
       border: 1px solid black;
   }
   .select_img .image_choice img:last-child {
       display: none; 
   }
   
   .select_img .image_choice:hover img:first-child {
       display: none;
   }   
   .select_img .image_choice:hover img:last-child {
       display: inline-block; 
   }

</style>
<h1 class="modify_title_h1">회원 수정</h1>

<form method="POST" id="myForm">

    <input type="hidden" id="sessionId" name="sessionId" value="${login.userid}">
    <input type="hidden" id="idx" value="${login.idx}">
    
<div class="member_modify_pass_all">
<input type="hidden" id="nickname" value="${login.nickname }">
<div class="text">
    <div id="profile" class="profile"><img src="${login.profile_img }"></div>
<div class="img_hidden">
   <div class="select_img">
      <div class="image_choice" data-index="1">  
         <img src="https://hakcoding.github.io/img/n_마이멜로디.png">
         <img src="https://hakcoding.github.io/img/마이멜로디.png">
      </div>
      <div class="image_choice" data-index="2">
         <img src="https://hakcoding.github.io/img/n_시나모롤.png">
         <img src="https://hakcoding.github.io/img/시나모롤.png">
      </div>
      <div class="image_choice" data-index="3">
         <img src="https://hakcoding.github.io/img/n_케로피.png">
         <img src="https://hakcoding.github.io/img/케로피.png">
      </div>
      <div class="image_choice" data-index="4">
         <img src="https://hakcoding.github.io/img/n_쿠로미.png">
         <img src="https://hakcoding.github.io/img/쿠로미.png">
      </div>
      <div class="image_choice" data-index="5">
         <img src="https://hakcoding.github.io/img/n_키티.png">
         <img src="https://hakcoding.github.io/img/키티.png">
      </div>
      <div class="image_choice" data-index="6">
         <img src="https://hakcoding.github.io/img/n_폼폼푸린.png">
         <img src="https://hakcoding.github.io/img/폼폼푸린.png">
      </div>
      <div class="image_choice" data-index="7">
         <img src="https://hakcoding.github.io/img/n_구데타마.png">
         <img src="https://hakcoding.github.io/img/구데타마.png">
      </div>
      <div class="image_choice" data-index="8">
         <img src="https://hakcoding.github.io/img/n_배드바츠마루.png">
         <img src="https://hakcoding.github.io/img/배드바츠마루.png">
      </div>
      <div class="image_choice" data-index="9">
         <img src="https://hakcoding.github.io/img/n_포차코.png">
         <img src="https://hakcoding.github.io/img/포차코.png">
      </div>
   </div>
</div>
</div>

<div class="member_modify_pass_all">
    <input type="password" class="modify_text" name="userpw" placeholder="비밀번호">
    <input type="button" id="passwd_change" name="passwd_change" value="비밀번호변경">
</div>

<div class="member_modify_nickname_all">
   <input type="text" class="modify_text" name="nickname" value="${login.nickname}">
   <input id="nickNameCheckBtn" type="button" value="닉네임 중복확인">
   <div id="nickCheckMessage"></div>
</div>

   
<div class="member_modify_phone_all">
   <input type="text" class="modify_text" name="phonenumber" placeholder="연락처 수정" >
   <input type="hidden" value="${login.phonenumber }"> 
   
</div>
<div>주소 변경</div>
<div class="add">
 <input type="hidden" value="${login.address }"> 
  <table class="table table-bordered table-hover text-center">
					<col width='20%' />
					<col width='30%' />
					<col width='20%' />
					<col width='30%' />
					<thead class="thead-dark">
						<tr>
							<td colspan="4"><input type="button" class='btn btn-info'
								value="주소검색" onclick="goPopup();"></td>
						</tr>
						<tr>
							<th scope="col">도로명주소 전체</th>
							<td scope="col" colspan="3"><input id="roadFullAddr"
								class='form-control' name="address" id="address"></td>
						</tr>
						<td scope="col" colspan="3"><input id="roadAddrPart1"
							class='form-control' type="hidden"></td>
						<td scope="col" colspan='3'><input id="engAddr"
							class='form-control' type="hidden"></td>
						<td scope="col" colspan='3'><input id="jibunAddr"
							class='form-control' type="hidden"></td>
						<tr>
							<th scope="col">고객입력 상세주소</th>
							<td scope="col"><input id="addrDetail" class='form-control'></td>
							<td scope="col"><input id="siNm" class='form-control'
								type="hidden"></td>
						</tr>
						<tr>
							<th scope="col">우편번호</th>
						</tr>
						<td scope="col"><input id="zipNo" class='form-control'></td>
						<td scope="col"><input id="admCd" class='form-control'
							type="hidden"></td>
						<td scope="col"><input id="rn" class='form-control'
							type="hidden"></td>
						<td scope="col"><input id="rnMgtSn" class='form-control'
							type="hidden"></td>
						<td scope="col" colspan='3'><input id="detBdNmList"
							class='form-control' type="hidden"></td>
						<td scope="col" colspan='3'><input id="bdMgtSn"
							class='form-control' type="hidden"></td>
					</thead>
				</table>
</div>
<!-- 사용하실 데이터는 오픈해주시면 됩니다. jusoCallBack 에러 방지용 -->
<input type='hidden' id="bdNm" class='form-control'>
<input type='hidden' id="bdKdcd" class='form-control'>
<input type='hidden' id="sggNm" class='form-control'>
<input type='hidden' id="roadAddrPart2" class='form-control'>
<input type='hidden' id="liNm" class='form-control'>
<input type='hidden' id="emdNm" class='form-control'>
<input type='hidden' id ="lnbrMnnm" class='form-control'>
<input type='hidden' id ="lnbrSlno" class='form-control'>
<input type='hidden' id ="udrtYn" class='form-control'>
<input type='hidden' id ="buldMnnm" class='form-control'>
<input type='hidden' id ="buldSlno" class='form-control'>
<input type='hidden' id ="mtYn" class='form-control'>
<input type='hidden' id ="emdNo" class='form-control'>
<div>
   <input type="submit" class="modify_submit_btn" value="수정">
</div>
</form>

<div><button id="logLeaveBtn">회원탈퇴</button></div>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
// document.domain = "http://www.juso.go.kr/";

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr,jibunAddr,zipNo,admCd,rnMgtSn,bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	document.getElementById('roadFullAddr').value = roadFullAddr;
	document.getElementById('roadAddrPart1').value = roadAddrPart1;
	document.getElementById('addrDetail').value = addrDetail;
	document.getElementById('roadAddrPart2').value = roadAddrPart2;
	document.getElementById('engAddr').value = engAddr;
	document.getElementById('jibunAddr').value = jibunAddr;
	document.getElementById('zipNo').value = zipNo;
	document.getElementById('admCd').value = admCd;
	document.getElementById('rnMgtSn').value = rnMgtSn;
	document.getElementById('bdMgtSn').value = bdMgtSn;
	document.getElementById('detBdNmList').value = detBdNmList;
	//** 2017년 2월 제공항목 추가 **/
	document.getElementById('bdNm').value = bdNm;
	document.getElementById('bdKdcd').value = bdKdcd;
	document.getElementById('siNm').value = siNm;
	document.getElementById('sggNm').value = sggNm;
	document.getElementById('emdNm').value = emdNm;
	document.getElementById('liNm').value = liNm;
	document.getElementById('rn').value = rn;
	document.getElementById('udrtYn').value = udrtYn;
	document.getElementById('buldMnnm').value = buldMnnm;
	document.getElementById('buldSlno').value = buldSlno;
	document.getElementById('mtYn').value = mtYn;
	document.getElementById('lnbrMnnm').value = lnbrMnnm;
	document.getElementById('lnbrSlno').value = lnbrSlno;
	//** 2017년 3월 제공항목 추가 **/
	document.getElementById('emdNo').value = emdNo;
}
function goPopup(){
	var width=570;
	var height=420;
	var posx = 0
	var posy = 0
	posx = (screen.width - width)/2-1;
	posy = (screen.height - height)/2-1;
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	var pop = window.open("jusoPopup","pop","width=" + width + ",height="+height+", scrollbars=yes, resizable=yes"); 
	pop.moveTo(posx,posy);
	pop.focus();
}
</script>
<script>
document.getElementById('myForm').addEventListener('submit', function(event) {
	   const inputs = this.querySelectorAll('input[type="text"]')
	    const nickCheckMessage = document.getElementById('nickCheckMessage').innerText
	   for(let i = 0; i < inputs.length; i++) {
	      if(!inputs[i].value.trim() && nickCheckMessage === '닉네임이 중복됩니다!') {
	         alert('모든 항목을 다시 확인해주세요.')
	         event.preventDefault() // submit 동작 중지
	         return
	      }
	   }
	})
   const passwd_changeBtn = document.getElementById('passwd_change')
   const userpw = document.querySelector('input[name="userpw"]')
   const sessionId = document.getElementById('sessionId').value

   async function passwd_changeHandler(){
      const ob = {
            userid : sessionId,
            userpw : userpw.value
      }
      const url = '${cpath}/passCheck_before/'
      const opt = {
         method: 'POST', // 요청 메서드 설정 (GET, POST, 등)
         body: JSON.stringify(ob), // 요청 본문 설정
         headers: {
            'Content-Type': 'application/json; charset=utf-8' // 요청 헤더 설정
         }
      }

      const count = await fetch(url, opt).then(resp => resp.text());
      if(count !=0){
    	  alert('비밀번호 재설정 페이지로 갑니다')
           window.location.href = '../../repw' // 새로운 페이지로 이동
      }
      else{
    	  alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.')
         return
      }
   }
   
   passwd_changeBtn.addEventListener('click', passwd_changeHandler)
</script>


<script>
   const nickNameCheckBtn = document.getElementById('nickNameCheckBtn');
   
   async function nickNameCheckHandler() {
      const nickCheckMessage = document.getElementById('nickCheckMessage');
      const nickname = document.querySelector('input[name="nickname"]')
      
      const url = '${cpath}/nicknNameCheck/'+nickname.value
      const count = await fetch(url).then(resp => resp.text())
      console.log(count)
      if(count != 0) {
         nickCheckMessage.innerText = '닉네임이 중복됩니다!'
         nickCheckMessage.style.color = 'red'
      }
      else if (count == 0){
         nickCheckMessage.innerText = '닉네임을 사용할 수 있습니다.'
         nickCheckMessage.style.color = 'blue'
      }
   }
   nickNameCheckBtn.addEventListener('click', nickNameCheckHandler)
   nickNameCheckBtn.addEventListener('mousedown', () => {
   // 버튼을 누를 때마다 비밀번호 체크 함수를 호출하여 계속 실행되도록 함
   nickNameCheckHandler()
   })
</script>

<script>
   const logLeaveBtn = document.getElementById('logLeaveBtn')
   
   function logLeaveHandler() {
	   window.location.href = '../../cancel' // 새로운 페이지로 이동
   }
   logLeaveBtn.addEventListener('click', logLeaveHandler)
   logLeaveBtn.addEventListener('mousedown', () => {
   // 버튼을 누를 때마다 비밀번호 체크 함수를 호출하여 계속 실행되도록 함
   logLeaveHandler()
   })
   
   
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
     const profileImage = document.getElementById('profile')
     const imgHidden = document.querySelector('.img_hidden')
     const imageChoices = document.querySelectorAll('.image_choice')

     // 클릭한 이미지의 데이터 인덱스를 추출하는 함수
     function getImageIndex(element) {
       return parseInt(element.getAttribute('data-index'))
     }

     // AJAX 요청을 보내는 함수
     async function sendImageChoice(index, nickname) {
    const ob = {
      profile_img: index,
      nickname: nickname,
    };
    const url = '${cpath}/image_choice'
      const opt = {
         method: 'POST',
         body: JSON.stringify(ob),
         headers: {
            'Content-Type': 'application/json; charset=utf-8'
         }
      }
      const row = await fetch(url, opt).then(resp => resp.json())
       if(row == 1){
          window.location.href = window.location.href
       }
     }

     // 이미지 선택을 클릭했을 때
     imageChoices.forEach(function(imageChoice) {
       imageChoice.addEventListener('click', function(event) {
         let index = getImageIndex(imageChoice)
         const nickname = document.getElementById('nickname').value
         
         sendImageChoice(index, nickname) // 이미지를 클릭하면 함수를 호출합니다.

         // 이미지 선택 후 이미지 선택 창을 숨김
         imgHidden.classList.remove('show')
       })
     })

     profileImage.addEventListener('click', function() {
       imgHidden.classList.add('show')
     });

     document.addEventListener('click', function(event) {
       if (!profileImage.contains(event.target) && !imgHidden.contains(event.target)) {
         imgHidden.classList.remove('show')
       }
     })
   })
</script>
</body>
</html>