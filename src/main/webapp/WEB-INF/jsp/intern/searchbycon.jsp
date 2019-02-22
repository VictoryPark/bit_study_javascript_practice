<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <script> //조건 검색...
  	let form = document.searchForm;
  	document.querySelector("button#search")
			.addEventListener("click", function() {
		showSearchResult(1,selectForm());
	});
  	
  	function setArr(item) {
  		let arr = [];
  		for(let i of item) {
  			if(i.checked) {
  				arr.push(i.value)
  			}
  		}
  		if(arr.length === 0) {
  			arr = null;
  		}
  		return arr;
  	}	//setArr
  	
  	function selectForm() {
  		let gender = document.querySelectorAll("input[name='gender']");
  		let genderArr = setArr(gender);
  		
  		let school = document.querySelectorAll("input[name='school']");
  		let schoolArr = setArr(school);
  		
  		let skill = document.querySelectorAll("input[name='skill']");
  		let skillArr = setArr(skill);
		let startY = form.startYear.value;
		let startM = form.startMonth.value;
		let startD = form.startDay.value;
		let endY = form.endYear.value;
		let endM = form.endMonth.value;
		let endD = form.endDay.value;
		
		if(startY==0) startY = "2000";
		if(endY==0) endY = "2019";
		
		if(startM==0) startM = "01"
		else startM = startM.length == 1 ? "0"+startM : startM
		if(endM==0) endM = "12"
		else endM = endM.length == 1 ? "0"+endM : endM
				
		if(startD==0) startD="01";
		else startD = startD.length == 1 ? "0"+startD : startD			
		if(endD==0) endD="31";		
		else endD = endD.length == 1 ? "0"+endD : endD
		console.log(startM, startD, endM, endD);
		let startDate = new Date(startY, startM-1, startD);
		let endDate = new Date(endY, endM-1, endD);
		//console.log(startY, startM, startD);
		console.log(startDate);
		console.log(endDate);
		if(startDate > endDate) {
			alert("시작 날짜가 종료날짜보다 늦습니다.")
			return;
		}
  		
		return {
  	  			name: form.staffName.value,
  	  			gender: genderArr,
  	  			religion: form.religion.value,
  	  			school: schoolArr,
  	  			skill: skillArr,
  	  			startYear: startY,
  	  			startMonth: startM,
  	  			startDay: startD,
  	  			endYear: endY,
  	  			endMonth: endM,
  	  			endDay: endD
  	  	}
  	}	//selectForm
  	
  	
  	function showSearchResult(pageNo,f) {
  		let xhr = new XMLHttpRequest();
  		xhr.addEventListener('load',function() {
  			let map = JSON.parse(xhr.responseText);
  			makeTable(map);
			
			setPagingBySearch(map.pageResult);
  		})
  		
  		f.pageNo = pageNo;
  		
  		xhr.open("POST", "<c:url value='/intern/searchbykey.do'/>", true)
  		xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8")
  		xhr.send(JSON.stringify(f)) // send
  	} //showSearchResult
  	
  	function setPagingBySearch(pageResult) {
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
				movePageBySearch(this.getAttribute("href").substring(1))
			}
		}
	} // setPaging
	
	function movePageBySearch(pageNo) {
		showSearchResult(pageNo,selectForm());
	}
  </script>