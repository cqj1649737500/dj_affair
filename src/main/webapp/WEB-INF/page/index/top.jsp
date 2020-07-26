<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
    <script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
    <script type="text/javascript">
        function noticeShow() {
            var html = "截至今日请假人：";
            if(${size == 0}){
                alert("无人请假");
                return;
            }
            <c:forEach items="${list}" var="l">
             html += " ${l.vacationName}"
            </c:forEach>
            alert(html);
        }
    </script>
</head>

<body>
<input type="button" value="公告" onclick="noticeShow()"/>
<h1 align="center">欢迎${user.userName} 点金大学教务管理系统</h1>
<marquee id = "no"><h3 align="center"><span style="color: red">公告：截至今日请假人：<c:if test="${size == 0}">无人请假</c:if>
<c:forEach items="${list}" var="l">
    ${l.vacationName} &nbsp; &nbsp; &nbsp;
</span></c:forEach></h3></marquee>

</body>

</html>