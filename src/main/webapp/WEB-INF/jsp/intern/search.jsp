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
      <td><input type="text" name="staffName"></td>
      <td class="gray">성별</td>
      <td>
        <input id="male" type="checkbox" name="gender" value="1" />
        <label for="male">남</label>
        <input id="female" type="checkbox" name="gender" value="2" />
        <label for="female">여</label>
      </td>
      <td class="gray">종교</td>
      <td>
        <select name="religion">
          <option value="0"></option>
        <c:forEach var="rel" items="${map.religionList}">
          <option value="${rel.religionCode}">${rel.religionName}</option>        
        </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td class="gray">학력</td>
      <td>
      	<c:forEach var="sc" items="${map.schoolList}">
      		<input id="${sc.schoolCode}" type="checkbox" name="school" value="${sc.schoolCode}"/>
        	<label for="${sc.schoolCode}">${sc.schoolName}</label>
      	</c:forEach>
      </td>
      <td class="gray">기술</td>
      <td colspan="4">
      	<c:forEach var="sk" items="${map.skillList}">
      		<input id="${sk.skillCode+10}" type="checkbox" name="skill" value="${sk.skillCode}"/>
       		<label for="${sk.skillCode+10}">${sk.skillName}</label>
      	</c:forEach>
      </td>
    </tr>
    <tr>
      <td class="gray">졸업일</td>
      <td colspan="5">
        <select name="startYear">
          <option value="0"></option>
          <c:forEach var="i" begin="2000" end="2019">
          	<option value="${i}">${i}</option>
          </c:forEach>
        </select>
        년
        <select name="startMonth">
          <option value="0"></option>
          <c:forEach var="i" begin="01" end="12">
            <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        월
        <select name="startDay">
          <option value="0"></option>
          <c:forEach var="i" begin="01" end="31">
            <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        일
        ~
        <select name="endYear">
          <option value="0"></option>
          <c:forEach var="i" begin="2000" end="2019">
          	<option value="${i}">${i}</option>
          </c:forEach>
        </select>
        년
        <select name="endMonth">
          <option value="0"></option>
          <c:forEach var="i" begin="01" end="12">
            <option value="${i}">${i}</option>
          </c:forEach>
        </select>
        월
        <select name="endDay">
          <option value="0"></option>
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
  
  <!-- 전체검색 페이징, 결과보기... -->
  <c:import url="./searchall.jsp"/>
  <c:import url="./searchbycon.jsp"/>

</body>
</html>