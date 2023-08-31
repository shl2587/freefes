@charset "utf-8";

	body {
		margin:	0;
		padding: 0;
		width: 100%;
		background-image: url("../image/바다배경.jpg");
		background-repeat: no-repeat;
		background-size: 100% auto;
		overflow-x: hidden;
	}
	
	main {
		margin-top: 100vh;
	}
	
	
	#homepage_logo > a {
		color: #643624;
	}
	
	.main_header {
		z-index: 13;
		position: fixed;
		top: 0;
		display: flex;
		width: 100%;
		height: 120px;
		align-items: center;
		background-color: transparent;
		color: transparent;
		justify-content: space-between;

	}
	
	#homepage_logo {
		margin-left: 25px;
	}
	
	.main_header > .main_header_right {
		display: flex;
		height: 40px;
	}
	
	.main_header_right > div {
		font-size: 10px;
		vertical-align: middle;
		margin-right: 60px;
	}
	
	.main_header_right > .login_btn button {
		background-color: #111;
		margin-left: -10px;
	}
	
	.main_header_right .login_btn > li > a > button {
	    cursor: pointer;
	}
	
	.main_header_right > div button {
		border: none;
		cursor: pointer;
		height: 25px;
	}
	
	.main_header_right > form, .main_header_right > ul, .main_header_right > div {
	    display: flex;
	    align-items: center;
	}

	input:focus {
		outline: none;
	}
    
    .main_header_right .search_bar input {
	    height: 45px;
	    width: 260px;
	    border-bottom: 2px solid black;
	    border-left: none;
	    border-top: none;
	    border-right: none;
	    cursor: text;
	    border-radius: 20px;
	    padding-left: 30px;
	    margin-top: 3px;
	    padding
	}
	
	.main_header_right .search_bar input:hover {
	    border-left: none;
	    border-top: none;
	    border-right: none;
	}
	
	.main_header_right .search_bar input:focus {
		background-color: #FAF3F0;
	}
	
	
	
	.main_header_right .search_bar {
	    height: 40px;
	}
    
    /* 버튼 백그라운드 */
    .main_header_right .login_btn li button,
	.main_header_right .hamburger button {
	    height: 25px;
	    border: none;
	    background-color: transparent;
		color: transparent;
	}
	
	ul li {
		list-style: none;
	}
	
	.main_header_right .hamburger button {
	    height: 40px;
	    align-items: center;
	}
	
	.main_header_right > div {
		font-size: 20px;
		margin-left: 5px;
	}
	
	.main_header_right .search_bar button i.fa-solid {
	    font-size: 30px;
	    margin-left: 6px;
	    vertical-align: middle;
    	margin-top: 2px;
    	cursor: pointer;
	}
	
	.main_header_right .
	
	.main_header a:hover {
		cursor: pointer;
	}
	
	button i.fa-solid.fa-bars {
		vertical-align: middle;
    	margin-top: 9px;
	}
	
	button i.fa-solid {
		font-size: 30px;
		display: inline-block;
		margin-left: 10px;
		margin-right: 10px;
		vertical-align: middle;
    	margin-top: 1px;
	}

/* 드랍다운 사이드바 */
	
	.hamburger .dropdown-menu {
		position: absolute;
		right: -850px;
		top: 103px;
		background-color: rgba( 0, 0, 0, 0.3 );
		width: 800px;
		height: 1300px;
		border: 2px solid #edeff3;
		border-radius: 60px;
		transition: right 0.7s;
	}
	
	.hamburger .dropdown-menu.show {
		right: 0; 
	}
	
	.hamburger .dropdown-menu li {
		padding: 10px;
		margin-top: 20px;
		list-style: none;
	}
	
	.hamburger .dropdown-menu li a {
		color: #edeff3;
		text-decoration: none;
	}
	
	.hamburger .dropdown-menu li a:hover {
		transition: 0.3s;
	}
	
	.hamburger .dropdown-menu > .festival a:hover {
/* 		background-image: linear-gradient(90deg, yellow, orange, purple, blue); */
/* 		-webkit-background-clip: text; */
		animation: rainbow 3s;
		animation-iteration-count: infinite;
		color: transparent;
		font-weight: bold;
		transition: 0.05s;
	}
	 @keyframes rainbow {
      0% {color: red;}
      13% {color: orange;}
      26% {color: yellow;}
      39% {color: green;}
      52% {color: blue;}
      65% {color: navy;}
      78% {color: purple;}
      100% {color: red;}
   }
	
/* 로그인 아이콘 */
	.inactive-icon {
	  display: none;
	}
	
/* 드랍다운 항목 */
	.hamburger > .dropdown-menu > .festival a {
		font-size: 60px;
	}
	
	.hamburger > .dropdown-menu > li a {
		font-size: 30px;
	}
	
	.hamburger > .dropdown-menu > li a:hover {
		font-weight: bold;
		color: #E6E2C3;
	}

/* 스크롤 유도 */

	a {
	  padding-top: 60px;
	}
	
	a span {
	  position: absolute;
	  position: fixed;
	  top: 70%;
	  left: 50%;
	  width: 30px;
	  height: 50px;
	  margin-left: -15px;
	  border: 2px solid #fff;
	  border-radius: 50px;
	  box-sizing: border-box;
	}
	
	a span::before {
	  position: absolute;
	  top: 10px;
	  left: 50%;
	  content: '';
	  width: 6px;
	  height: 6px;
	  margin-left: -3px;
	  background-color: #fff;
	  border-radius: 100%;
	  -webkit-animation: sdb 2s infinite;
	  animation: sdb 2s infinite;
	  box-sizing: border-box;
	}
	
	a .scroll-text {
	  position: absolute;
	  position: fixed;
	  padding-top: 55px;
	  top: 70%;
	  left: 50%;
	  transform: translateX(-50%);
	  color: #fff;
	  font-size: 16px;
	}
	@-webkit-keyframes sdb {
	  0% {
	    -webkit-transform: translate(0, 0);
	    opacity: 0;
	  }
	  40% {
	    opacity: 1;
	  }
	  80% {
	    -webkit-transform: translate(0, 20px);
	    opacity: 0;
	  }
	  100% {
	    opacity: 0;
	  }
	}
	@keyframes sdb {
	  0% {
	    transform: translate(0, 0);
	    opacity: 0;
	  }
	  40% {
	    opacity: 1;
	  }
	  80% {
	    transform: translate(0, 20px);
	    opacity: 0;
	  }
	  100% {
	    opacity: 0;
	  }
	}

/* 덩엉 css */
	
	.banner {
		height: 100vh;
		width: 100%;
		display: flex;
		justify-content: center;
		margin: auto;
	}
	.slide > a > img {
		height: 100vh;
	}
	.slide > a {
		height: 100vh;
	}
	.slide {
		width: 100%;
		position: absolute;
		left: 50%;
		transform: translate(-50%);
		text-align: center;
		animation: fade 4s;
	}
	.active {
		transition: 1s;
		opacity: 100%;
		animation: fade 6s;
		"src/main/webapp/resources/img/개쩌는 축제.jpg"
	}
	.hidden {
		display: none;
	}
	
	@keyframes fade {
		0%, 100% {opacity: 0.12}
		15%, 95% {opacity: 1}
	}
	.wrap {
		height: 100vh;
		width: 100%;
		overflow: hidden;
		position: relative;
		background-color: white;
	}
	.prev, .next {
		padding: 10px;
		font-size: 70px;
		cursor: pointer;
		font-family: cursive;
		color: white;
		position: absolute;
		top: 50%;
		transform: translate(-50%);
		text-shadow: 10px 10px 10px #000;
		z-index: 11;
	}
	.prev:hover, .next:hover {
		text-shadow: 5px 5px 5px #000;
		transition: 0.3s;
		animation: rainbow 5s;
		animation-iteration-count: infinite;
	}
	@keyframes rainbow {
		0% {color: red;}
		14% {color: orange;}
		28% {color: yellow;}
		42% {color: green;}
		56% {color: blue;}
		70% {color: navy;}
		84% {color: purple;}
		100% {color: red;}
	}
	
	.prev {
		left: 80px;
	}
	.next {
		right: 15px;
	}
	
	.banner_page {
		color: white;
		opacity: 0.5;
		transition: 0.3s;
		z-index: 11;
		padding-left: 10px;
	}
	.banner_page:hover {
		opacity: 1;
		transition: 0.3s;
		cursor: pointer;
		
	}
	.banner_page_wrap {
		display: flex;
		position: absolute;
		bottom: 40px;
		left: 50%;
		transform: translate(-50%);
		text-shadow: 2px 2px 2px #000;
	}
	.on {
		opacity: 1;
		transition: 0.3s;
	}
	.hold {
		z-index: 11;
		color: black;
		position: absolute;
		top: 20px;
		left: 80%;
		background-color: #fff1b9;
		padding: 8px 17px;
		box-sizing: border-box;
		border-radius: 10px;
		font-weight: bold;
		line-height: 28px;
		box-shadow: 4px 4px 4px #000;
		font-size: 22px;
		opacity: 0.7;
		
	}
	.holding {
		background-color: #75D701;
	}
	/*덩엉엔드*/
	
	/* 병학 css*/
	.map {
		background-image: url("../map_img/지도배경.png");
		height: 100vh;
		width: 100%;
		margin: auto;
		position: relative;
	}
	 .map > div > a > img {
		height: 25vh;
		width: auto;
        position: absolute;
        transition: transform 0.3s;
	 }
	 .map > div > a > img:hover {
            transform: scale(1.2);
            z-index: 10;
        }
     .map > div > a > img.not-hovered {
            transform: scale(1);
        }      
	.map > div > a:nth-child(1) > img { top: 10%; left: 45%; }      
	.map > div > a:nth-child(2) > img { top: 14.7%; left: 38.7%; }
    .map > div > a:nth-child(3) > img { top: 24.5%; left: 41.5%; }
    .map > div > a:nth-child(4) > img { top: 31%; left: 44.5%; }
    .map > div > a:nth-child(5) > img  { top: 35%; left: 35%; }
    .map > div > a:nth-child(6) > img { top: 45.8%; left: 44%; }
    .map > div > a:nth-child(7) > img { top: 33.5%; left: 49.3%; }
    .map > div > a:nth-child(8) > img { top: 54.5%; left: 52%; }
    .map > div > a:nth-child(9) > img { top: 56%; left: 46.2%; }
    .map > div > a:nth-child(10) > img { top: 53%; left: 36%; }
    .map > div > a:nth-child(11) > img { top: 60%; left: 57.7%; }
    .map > div > a:nth-child(12) > img { top: 67.8%; left: 55.7%; }
    .map > div > a:nth-child(13) > img { top: 67%; left: 35.5%; }
    .map > div > a:nth-child(14) > img { top: 72%; left: 40%; }
    .map > div > a:nth-child(15) > img { top: 81%; left: 52%; }
	
	/* 병학 end*/
	

