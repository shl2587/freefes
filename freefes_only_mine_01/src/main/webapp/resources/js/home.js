'use strict'

// 배너 슬라이드 기능
const prev = document.querySelector('.prev')
const next = document.querySelector('.next')
const slide = document.querySelectorAll('.slide')
const page = document.querySelector('.banner_page_wrap')
const banner_page = document.querySelectorAll('.banner_page')
let current_idx = 0

function move_slide() {
	
	slide[current_idx].classList.remove('active')
	slide[current_idx].classList.add('hidden')
	
	current_idx++
	current_idx = current_idx > slide.length-1 ? 0 : current_idx
	
	slide[current_idx].classList.remove('hidden')
	slide[current_idx].classList.add('active')
	banner_color_change(slide[current_idx])
}

// 다음 버튼
function next_click() {
	move_slide()
}

// 이전버튼
function prev_click() {
	slide[current_idx].classList.remove('active')
	slide[current_idx].classList.add('hidden')
	
	current_idx--
	current_idx = current_idx < 0 ? slide.length-1 : current_idx
	
	slide[current_idx].classList.remove('hidden')
	slide[current_idx].classList.add('active')
	banner_color_change(slide[current_idx])
 }


// 포스터 사진 색에 따른 배너 배경 색 설정
function banner_color_change(e) {
	const image = e.querySelector('.image')
	
	const colorThief = new ColorThief();
	const dominantColor = colorThief.getColor(image);
	const color = 'rgb(' + dominantColor[0] + ',' + dominantColor[1] + ',' + dominantColor[2] + ')'
	e.style.background = 'linear-gradient(90deg, #111, ' + color + ',' + color + ', #111)';
//	e.style.background = 'linear-gradient(90deg,' + color + ', #111, ' + color + ')';
//	e.style.background = 'linear-gradient(180deg, ' + color + ',' + color + ', #111)';
	
	current_page_on()
}

// 페이지 버튼 클릭시 해당 페이지 포스터 보기
page.onclick = function (event) {
	const banner_idx = event.target.getAttribute('id')
	slide[current_idx].classList.remove('active')
	slide[current_idx].classList.add('hidden')
	current_idx = banner_idx
	slide[current_idx].classList.remove('hidden')
	slide[current_idx].classList.add('active')
	banner_color_change(slide[current_idx])
}

// 페이지 버튼 활성
function current_page_on() {
	for(let i = 0; i < banner_page.length; i++) {
		if(banner_page[i].classList.contains('on')) {
			banner_page[i].classList.remove('on')
		}
	}
	banner_page[current_idx].classList.add('on')
}


