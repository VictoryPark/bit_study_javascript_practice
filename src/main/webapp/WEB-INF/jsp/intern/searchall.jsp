<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
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