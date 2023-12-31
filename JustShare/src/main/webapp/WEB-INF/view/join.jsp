<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="./css/join.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript">
	
	  $(function() {

	      let isIdChecked = false; // 아이디 중복 검사 여부를 나타내는 변수
	      $("#idCheck").click(function() {
	               let mid = $("#mid").val();
	
	               if (mid == "" || mid.length < 3) {
	                  $("#resultMSG").text("아이디는 3글자 이상이어야 합니다.");
	                  $("#resultMSG").css("font-weight", "bold");
	                  $("#resultMSG").css("font-size", "15pt");
	               } else {
	                  $.ajax({
	                     url : "./checkID",
	                     type : "post",
	                     data : {
	                        "mid" : mid
	                     },
	                     dataType : "json",
	                     success : function(data) {
	                        if (data == 1) {
	                           $("#resultMSG").css("color", "red").text("이미 등록된 아이디입니다.");
	                           isIdChecked = false;
	                        } else {
	                           $("#resultMSG").css("color", "greed").text("가입할 수 있습니다.");
	                           isIdChecked = true;
	                        }
	                     },
	                     error : function(request, status, error) {
	                        $("#resultMSG").text("실패시 결과값 : " + error);
	                     }
	                  });
	               }
	               return false;
	            });
	
	      $("#pw2").on('input', function() {
	         let pw1 = $("#pw1").val();
	         let pw2 = $(this).val();
	
	         if (pw1 == pw2) {
	            $("#pwresultForm").css("color","green").text("비밀번호가 일치합니다.");
	            return;
	         } else {
	            $("#pwresultForm").css("color","red").text("비밀번호가 일치하지 않습니다.");
	         }
	      });
	      
	      $("#joinjoin").click(function(){
	         let mid = $("#mid").val();
	         let pw1 = $("#pw1").val();
	         let pw2 = $("#pw2").val();
	         let mname = $("#mname").val();
	         let mphone = $("#mphone").val();
	         let mbrith = $("#mbrith").val();
	         
	          if (!isIdChecked) {
	             Swal.fire("아이디 중복 검사를 실행하세요.");
	              return false; // 회원가입 종료
	           }
	         if (pw1 != pw2) {
	            Swal.fire("비밀번호를 확인하세요.");
	            return false;
	         }
	         if (mname.length > 4 || mname.length == "" || mname.length <= 1) {
	            Swal.fire("이름을 정확히 입력해주세요.");
	            return false;
	         }
	         if (mphone.length != 11) {
	            Swal.fire("핸드폰 번호 11자리를 정확히 입력해주세요.");
	            return false;
	         }
	       if (mbrith.length < 10 ) {
	            Swal.fire("생년월일을 정확히 입력해주세요.");
	            return false; 
	         
	       
	       
	       }
	       
	       
	       // 메일주소검사
	     	let option = $("#selectBox option:selected").val();      // 선택한 메일주소값 뽑아내기
	     	
	     	if(option != "-선택-"){
	     		
		     // gogus228
				let Fmail = $(this).parent('div').siblings(".emailBox").children("#memail").val();
				//alert(Fmail);   
				
				if(Fmail != null && Fmail != ""){
					// hanmail   net
					let items = option.slice(1).split(".");	
					let first = items[0];	// hanmail
					let second = items[1];	// net
					
					// 메일주소 앞부분 입력값검사
					let replaceKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
					let replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
				
					if(Fmail.match(replaceKorean) || Fmail.match(replaceChar)){
						Fmail = Fmail.replace(replaceKorean, "").replace(replaceChar, "");
						Swal.fire("올바른 메일주소를 입력해주세요")
						$("#memail").val("");
						$("#Opt").prop("selected", true);
						return false; 
					}
					
					let Final = Fmail + "@" + first + "." + second;
					console.log(Final);	// gogus228@gmail.com
					let memail = $("#memailF").val(Final);
				 else {
					Swal.fire("올바른 메일주소를 입력해주세요");
					return false; 
				} 
			
	     	} else {
				Swal.fire("올바른 메일주소를 입력해주세요");
				return false; 
	     }	
		
	  	});
	       
	 });
	
	</script>
<body>
  <form id="myForm" action="./join" method="post"> 
      <div class="join-div" align="center">
         <div>
            <h1>회원가입<br></h1>
         </div>
         <div>
            <div class="idBox">
               <input class="input" type="text" name="mid" id="mid" placeholder="아이디를 3글자 이상 입력해 주세요"/>
               <button id="idCheck" type="button" class="idbutton">중복검사</button>
               <br> <span id="resultMSG"></span>
            </div>
            <div class="label-row" style="height:20px" id="resultForm">
               <div class="label-name"></div>
               <div class="label-in">
                  <span id="resultMSG"></span>
               </div>
            </div>
         </div>
         <div>
            <div class="pwBox1">
               <input class="input" type="password" name="mpw1" id="pw1" placeholder="비밀번호를 입력해 주세요"/><br><br>
            </div>
            <div>
               <div class="poBox2">
                  <input class="input" type="password" name="mpw" id="pw2" placeholder="비밀번호를 다시 입력해 주세요"/>
                  <br>
                  <div class="label-row" style="height: 25px" id="pwresultForm">
                     <div class="label-name"></div>
                     <div class="label-in">
                        <span id="pwresultMSG"></span><br>
                     </div>
                  </div>
               </div>
               </div>
         </div>
               <div>
                  <div class="nameBox">
                     <input class="input" type="text" name="mname" id="mname" placeholder="이름을 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="addrBox">
                     <input class="input" type="text" name="maddr" id="maddr" placeholder="주소를 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="addrBox1">
                     <input class="input" type="text" name="maddr" id="maddr1" placeholder="상세주소를 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="brithBox">
                     <input class="input"  type="date" name="mbrith" id="mbrith"/><br><br>
                  </div>
               </div>
               <div>
                  <div class="phoneBox">
                     <input class="input" type="text" name="mphone" id="mphone" placeholder="전화번호를 입력해 주세요"/><br><br>
                  </div>
               </div>
               <div class="emailBox">
					<input class="input" type="text" id="memail" placeholder="이메일을 입력해 주세요" /><br> <br> 
					<select class="selectMail" id="selectBox" name="selectBox">
						<option id="Opt">-선택-</option>
						<option id="naver" value="@naver.com">@naver.com</option>
						<option id="gmail" value="@gmail.com">@gmail.com</option>
						<option id="hanmail" value="@hanmail.net">@hanmail.net</option>
						<option id="kakao" value="@kakao.com">@kakao.com</option>
					</select>
					<input type="hidden" name="memail" id="memailF"/>
				</div>
               	<div>
	               <br>
	               <button class="Jbutton" type="reset">취소</button>
	               <button class="Jbutton" type="button" id="joinjoin">가입</button>
               	</div>

      </div>
  </form>











</body>
</html>