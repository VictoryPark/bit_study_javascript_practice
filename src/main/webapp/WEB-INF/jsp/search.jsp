<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
          <option value="1">기독교</option>
          <option value="2">천주교</option>
          <option value="3">불교</option>
          <option value="4">이슬람</option>
          <option value="5">무교</option>
        </select>
      </td>
    </tr>
    <tr>
      <td class="gray">학력</td>
      <td>
        <input id="high" type="checkbox" name="school" value="high"/>
        <label for="high">고졸</label>
        <input id="pro" type="checkbox" name="school" value="pro"/>
        <label for="pro">전문대졸</label>
        <input id="general" type="checkbox" name="school" value="general"/>
        <label for="general">일반대졸</label>
      </td>
      <td class="gray">기술</td>
      <td colspan="4">
        <input id="Java" type="checkbox" name="skill" value="Java"/>
        <label for="Java">Java</label>
        <input id="JSP" type="checkbox" name="skill" value="JSP"/>
        <label for="JSP">JSP</label>
        <input id="ASP" type="checkbox" name="skill" value="ASP"/>
        <label for="ASP">ASP</label>
        <input id="PHP" type="checkbox" name="skill" value="PHP"/>
        <label for="PHP">PHP</label>
        <input id="Delphi" type="checkbox" name="skill" value="Delphi"/>
        <label for="Delphi">Delphi</label>
      </td>
    </tr>
    <tr>
      <td class="gray">졸업일</td>
      <td colspan="5">
        <select name="startYear">
          <option value="2000">2000</option>
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="2004">2004</option>
        </select>
        년
        <select name="startMonth">
          <option value="01">01</option>
          <option value="02">02</option>
          <option value="2002">03</option>
          <option value="2003">04</option>
          <option value="12">12</option>
        </select>
        월
        <select name="startDay">
          <option value="01">01</option>
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="31">31</option>
        </select>
        일
        ~
        <select name="endYear">
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
          </select>
          년
          <select name="endMonth">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="2002">03</option>
            <option value="2003">04</option>
            <option value="12">12</option>
          </select>
          월
          <select name="endDay">
            <option value="01">01</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="31">31</option>
          </select>
          일
      </td>
    </tr>
  </table>
  <div id="searchbtnbox">
    <button type="button">검색</button>
  </div>
  <div id="btnbox">
    <button id="searchAll">전부검색</button>
    <button id="reset">초기화</button>
    <button id="register">등록</button>
  </div>

  <table id="result">
    <tr class="gray">
      <td>번호</td>
      <td>이름</td>
      <td>성별</td>
      <td>종교</td>
      <td>졸업일</td>
      <td></td>
    </tr>
  </table>
</body>
</html>