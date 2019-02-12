<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/search.css"/>">
</head>
<body>
  <form name="searchForm">
  <table id="search">
    <tr>
      <td id="title" colspan="6" class="gray">사원 정보 검색</td>
    </tr>
    <tr>
      <td class="gray">이름</td>
      <td><input type="text" id="name"></td>
      <td class="gray">성별</td>
      <td>
        <input id="male" type="checkbox" name="gender" value="male" />
        <label for="male">남</label>
        <input id="female" type="checkbox" name="gender" value="female" />
        <label for="female">여</label>
      </td>
      <td class="gray">종교</td>
      <td>
        <select name="religion">
        <c:forEach var="rel" items="${religionList}">
          <option value="${rel.religionCode}">${rel.religionName}</option>        
        </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td class="gray">학력</td>
      <td>
        <input id="high" type="checkbox" name="school" value="1"/>
        <label for="high">고졸</label>
        <input id="pro" type="checkbox" name="school" value="2"/>
        <label for="pro">전문대졸</label>
        <input id="general" type="checkbox" name="school" value="3"/>
        <label for="general">일반대졸</label>
      </td>
      <td class="gray">기술</td>
      <td colspan="4">
        <input id="Java" type="checkbox" name="skill" value="1"/>
        <label for="Java">Java</label>
        <input id="JSP" type="checkbox" name="skill" value="2"/>
        <label for="JSP">JSP</label>
        <input id="ASP" type="checkbox" name="skill" value="3"/>
        <label for="ASP">ASP</label>
        <input id="PHP" type="checkbox" name="skill" value="4"/>
        <label for="PHP">PHP</label>
        <input id="Delphi" type="checkbox" name="skill" value="5"/>
        <label for="Delphi">Delphi</label>
      </td>
    </tr>
    <tr>
      <td class="gray">졸업일</td>
      <td colspan="5">
        <select name="startYear">
          <c:forEach var="i" begin="2000" end="2019">
          	<option value="${i}">${i}</option>
          </c:forEach>
        </select>
        년
        <select name="startMonth">
          <c:forEach var="i" begin="01" end="12">
            <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        월
        <select name="startDay">
          <c:forEach var="i" begin="01" end="31">
            <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        일
        ~
        <select name="endYear">
          <c:forEach var="i" begin="2000" end="2019">
          	<option value="${i}">${i}</option>
          </c:forEach>
        </select>
        년
        <select name="endMonth">
          <c:forEach var="i" begin="01" end="12">
            <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        월
        <select name="endDay">
          <c:forEach var="i" begin="01" end="31">
           <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        일
      </td>
    </tr>
  </table>
  
  <div id="searchbtnbox">
    <button type="button" id="search">검색</button>
  </div>
  <div id="btnbox">
    <button type="button" id="searchAll">전부검색</button>
    <button type="reset" id="reset">초기화</button>
    <button type="button" id="register">등록</button>
  </div>
  </form>
  <div id="result">
  
  </div>
  <div id="paging"></div>
  
  <script>//전체검색 페이징, 결과보기...
  	document.querySelector("button#searchAll")
  			.addEventListener("click", function() {
  				showListAll(1);
  	}) //onclick
  	
  	function showListAll(pageNo) {
  		let xhr = new XMLHttpRequest();
  		xhr.onreadystatechange = function() {
  			if(xhr.readyState == 4) {
  				if(xhr.status == 200) {
  					let map = JSON.parse(xhr.responseText)
  					
  					let html = '<table id="result">'
  							+'<tr class="gray">'
  							+'<td>번호</td><td>이름</td><td>성별</td><td>종교</td>'
  							+'<td>졸업일</td><td></td></tr>'
  					for(let staff of map.list) {
  						html += '<tr>'
  						html += '<td>'+staff.staffNo+'</td>'
  						html += '<td>'+staff.staffName+'</td>'
  						html += '<td>'+staff.gender+'</td>'
  						html += '<td>'+staff.religionName+'</td>'
  						html += '<td>'+staff.graduateDay+'</td>'
  						html += '<td><button type="button">수정/삭제</button></td></tr>'
  					} //for
  					
  					html += '</table>'
  					
  					document.querySelector("div#result").innerHTML = html;
  					setPaging(map.pageResult);
  				} // 200
  			} // 4
  		}//readystatechange
  		
  		xhr.open("GET", "<c:url value='/intern/searchAll.do'/>?pageno="+pageNo, true)
  		xhr.send()
  	}
  	function setPaging(pageResult) {
  		pageStr = "";
  		if(pageResult.count != 0) {
  			pageStr += '<div class="pagination">'
  			pageStr += '<a '
  			if(pageResult.prev == true) {
  				pageStr += 'class="disabled" href="#"'
  			} else {
  				pageStr += "href='#1'"
  			}
  			pageStr += 'id="prevAll">&laquo;</a>'
  			pageStr += '<a '
  			if(pageResult.prev == true) {
  				pageStr += 'class="disabled" href="#"'
  			} else {
  				pageStr += "href='#"+(pageResult.pageNo-1)+"'"
  			}
  			pageStr += 'id="prev">&lt;</a>'
  			
  			for(let i=pageResult.beginPage; i<=pageResult.endPage;i++) {
  				if(i === pageResult.pageNo) {
	  				pageStr +='<a href="#'+pageResult.pageNo+'" id="now">'+i+'</a>'				
  				} else {
  					pageStr += "<a href='#"+i+"' >"+i+"</a>"
  				}
  			} // for
  			pageStr += '<a '
  			if(pageResult.next == true) {
  				pageStr += 'class="disabled" href="#"'
  			} else {
  				pageStr += "href='#"+(pageResult.pageNo+1)+"'"
  			}
  			pageStr += 'id="next">&gt;</a>'
  			pageStr += '<a '
  			if(pageResult.next == true) {
  				pageStr += 'class="disabled" href="#"'
  			} else {
  				pageStr += "href='#"+pageResult.lastPage+"'"
  			}
  			pageStr += 'id="nextAll">&raquo;</a>'
  			pageStr += '</div>'
  			
  		} //count !=0 일때..
  		
		document.querySelector("div#paging").innerHTML = pageStr;
  		
		let aList = document.querySelectorAll(".pagination a");
		for(let a of aList) {
			a.onclick = function(e) {
				//alert(this.getAttribute("href").substring(1));
				movePage(this.getAttribute("href").substring(1))
			}
		}
  	} // setPaging
  	
  	function movePage(pageNo) {
  		showListAll(pageNo)
  	}
  	
  </script>
  <script> //조건 검색...
  	let form = document.searchForm;
  	document.querySelector("button#search").onclick = function() {
  		//console.log(form)
  	}
  </script>
</body>
</html>