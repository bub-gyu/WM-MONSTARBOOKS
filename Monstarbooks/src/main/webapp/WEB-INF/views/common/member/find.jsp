<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="tab-wrap">
		<ul class="tab-list">
			<li class="active">아이디 찾기</li>
			<li>비밀번호 찾기</li>
		</ul>
	</section>
	<section class="accordion-wrap tab-content active">
		<ul>
			<li class="active">
				<button type="button">이메일로 찾기</button>
				<div class="accordion-item">
					<form action="./." method="post">
						<label for="name">이름</label>
						<input type="text" name="name"
							placeholder="이름을 입력해주세요." id="name">
							<label for="email">이메일</label>
							
						<div class="form-small">
							<input type="email" name="email" id="email"
								placeholder="이메일을 입력해주세요">
							<input type="button" value="인증번호 발송">
						</div>

						<label for="certifyNumber">인증번호</label>
						<input type="text" name="certifyNumber" id="certifyNumber"
							placeholder="인증번호를 입력해주세요">
							
						<input type="submit" value="확인">
					</form>
				</div>
			</li>
			<li>
				<button type="button">전화번호로 찾기</button>
				<div class="accordion-item">
					<form action="${pageContext.request.contextPath}/find/idPhone" method="post">
						<label for="name">이름</label> 
						<input type="text" name="name"
							placeholder="이름을 입력해주세요." id="name">
						<label for="idPhoneInput">번호</label>
						<div class="form-small">
							<input type="tel" name="tel" id="idPhoneInput"
								placeholder="전화번호(01000000000)"
								pattern="[0-9]{3}[0-9]{4}[0-9]{4}"> 
							<input type="button" value="인증번호 발송" id="idPhoneSend">
						</div>

						<label for="certifyNumber">인증번호</label>
						<div class="form-small">
							<input type="text" name="certifyNumber" id="idPhoneCertifyNumber"
								placeholder="인증번호를 입력해주세요">
							<input type="button" value="인증번호 확인" id="idPhoneCertifyCheck" />
						</div>
						
						<input type="submit" value="확인">
					</form>
				</div>
			</li>
		</ul>
	</section>
	<!--accordion-wrap-->
	<section class="accordion-wrap tab-content">
		<ul>
			<li class="active">
				<button type="button">이메일로 찾기</button>
				<div class="accordion-item">
					<form action="./." method="post">
						<label for="id">아이디</label> 
						<input type="text" name="name"
							placeholder="아이디를 입력해주세요." id="id">
						
						<label for="name">이름</label>
						<input type="text" name="name" placeholder="이름을 입력해주세요." id="name">
						
						<label for="email">이메일</label>
						<div class="form-small">
							<input type="email" name="email" id="email"
								placeholder="이메일을 입력해주세요">
							<input type="button" value="인증번호 발송">
						</div>

						<label for="certifyNumber">인증번호</label>
						<input type="text" name="certifyNumber" id="certifyNumber"
							placeholder="인증번호를 입력해주세요">
						
						<input type="submit" value="확인">
					</form>
				</div>
			</li>
			<li>
				<button type="button">전화번호로 찾기</button>
				<div class="accordion-item">
					<form action="./." method="post">
						<label for="id">아이디</label>
						<input type="text" name="name"
							placeholder="아이디를 입력해주세요." id="id">
						
						<label for="name">이름</label>
						<input type="text" name="name" placeholder="이름을 입력해주세요." id="name">
						
						<label for="tel">번호</label>
						<div class="form-small">
							<input type="tel" name="tel" id="tel"
								placeholder="전화번호(01000000000)"
								pattern="[0-9]{3}[0-9]{4}[0-9]{4}">
							<input type="button" value="인증번호 발송">
						</div>

						<label for="certifyNumber">인증번호</label>
						<input type="text" name="certifyNumber" id="certifyNumber"
							placeholder="인증번호를 입력해주세요">
							
						<input type="submit" value="확인">
					</form>
				</div>
			</li>
		</ul>
	</section>
	<!--accordion-wrap-->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(document).ready(function() {

		//전화번호로 아이디찾기 인증번호 보내기 버튼 클릭 이벤트
		let flag = false;
		$('#idPhoneSend').click(function() {
			const to = $("#idPhoneInput").val();
			console.log(to)
			$.ajax({
				url : "sendSMS",
				type : "get",
				data : "to=" + to,
				dataType : "json",
				success : function(data) {
					const checkNum = data;
					console.log('checkNum:' + checkNum);

					//인증하기 버튼 클릭 이벤트
					$('#idPhoneCertifyCheck').click(function() {
						const userNum = $('#idPhoneCertifyNumber').val();
						if (checkNum == userNum) {
							alert('인증 성공하였습니다.');
							flag = true;
						} else {
							alert('인증 실패하였습니다. 다시 입력해주세요.');
							flag = false;
						}
					});
				},
				error : function() {
					alert("발송에 실패하였습니다.")
				}
			});
		});

		$("form").submit(function(e) {
			if (flag === false) {
				e.preventDefault();
			}
		});
		
	});//종료
	</script>
</body>
</html>