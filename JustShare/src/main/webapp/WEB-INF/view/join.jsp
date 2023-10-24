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
<body>
<!--  <form id="myForm" action="./join" method="post"> -->
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
<!--    </form> -->











</body>
</html>