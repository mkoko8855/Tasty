<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>시작화면</title>

	<!-- reset.css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

	<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

	  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />

</head>






<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
	</script>
<%-- 	<header>
		<c:if test="${login == null}">
			<div>
				<a href="${pageContext.request.contextPath}/user/userLogin">login</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/user/userJoin">Join</a>
			</div>


		</c:if>
		<c:if test="${login != null}">
			${login.userId}님 환영합니다!
			<div>
				<a href="${pageContext.request.contextPath}/user/userMypage">MyPage</a>
			</div>

			 <div>
			<a href="${pageContext.request.contextPath}/user/userLogout">Logout</a>
			</div>  

			<form action="${pageContext.request.contextPath}/user/userLogout" method="post">
				<button type="submit" id="logoutBtn">로그아웃</button>
			</form>


		</c:if>


	</header> --%>
	
	
<nav class="navbar navbar-expand-lg bg-success fixed-top text-light">
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="#">Tasty Friends</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        
        <c:if test="${login == null}">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/userLogin">login/join</a>
        </li>
        </c:if>
        <c:if test="${login != null}">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/userMypage">회원정보수정</a>
          
        </li>
         <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/userLogout" id="logoutBtn">LogOut</a>
          
        </li>
        </c:if>
         
       
      
      </ul>
      
    </div>
  </div>
</nav>


	<div class="wrapper">
	
	</div>
	<div class="title">
		<span id="you">당신에게 맞는<span><br>
		<span id="reco">수백개의 추천 레시피를<span><br>
		<span id="free">무료로 이용해보세요!<span><br>
		<button type="submit"  id="try" class="btn btn-danger btn-lg">Try Free</button>
	</div>
	<div class="aside animadte__animated  animate__fadeIn" id="side">
	<div id="logo">
		<img src="${pageContext.request.contextPath}/css/TastyFriend.png" alt="로고">
	
	</div>
	
		<form action="${pageContext.request.contextPath}/result/mainResult" method="POST">
			<div class="selectWrapper">
				<select name="weather" class="form-select optionbox" aria-label="Default select example">
					<option value="날씨" selected>날씨</option>
					<option value="맑음">맑음</option>
					<option value="흐림">흐림</option>
					<option value="비">비</option>
					<!-- <option id="todayWeather"></option> -->
				</select> <select name="condition" class="form-select optionbox" aria-label="Default select example">
					<option value="상태" selected>상태</option>
					<option value="보통">보통</option>
					<option value="다이어트중">다이어트중</option>
					<option value="술마시고싶어요">술마시고싶어요</option>

				</select> <select name="feeling" class="form-select optionbox" aria-label="Default select example">
					<option value="기분" selected>기분</option>
					<option value="신나요">신나요</option>
					<option value="우울해요">우울해요</option>
					<option value="피곤해요">피곤해요</option>
					<option value="특별한날">특별한날</option>
				</select>
				<button type="submit"  id="recipe" class="btn btn-success"	>레시피 추천!</button>
			</div>
			
		</form> 
	
	
	</div>
	
		
	


			




	
	<footer> copyright © TastyFriends. all rights reserved </footer>
	
</body>

<script type="text/javascript">
	const side =document.getElementById('try').addEventListener('click', e => {
		const side =document.getElementById('side');
			side.style.display = "block";


	});
	/* (
		function weather() {
			const side =document.getElementById('side');
		side.style.display = "none";
			console.log("날씨시도");

			fetch('${pageContext.request.contextPath}/result/getWeather')
				.then(res => res.json())
				.then(data => {
					console.log("날씨성공");
					console.log(data.weather);
					let ctemp = data.temp - 273.15;
					console.log(ctemp.toFixed(2));
					let weather1='';

					if (data.weather==="Clear") {
						 weather1 = '맑음';
					} else if (data.weather==="Rain") {
						 weather1 = '비';
					} else if (data.weather==="Clouds") {
						 weather1 = '흐림';
					} else {
						 weather1 = '흐림';
					}

					document.getElementById('todayWeather').setAttribute("value", data.weather);
					document.getElementById('todayWeather').textContent = "오늘의 날씨 : " +weather1 + "/" + ctemp.toFixed(2) + "°C";


				})

		})(); */

	document.getElementById('logoutBtn').onclick = () => {
		alert('로그아웃 되었습니다.');
	}
</script>

</html>