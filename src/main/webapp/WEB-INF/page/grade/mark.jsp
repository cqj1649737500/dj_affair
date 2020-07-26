<%--
  Created by IntelliJ IDEA.
  User: cqj
  Date: 2020/7/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layer/layer.js"></script>
    <script type="text/javascript">
        function mark(id){
            window.location.href='<%=request.getContextPath()%>/grade/toStudentMack?id='+id //iframe的url
        }
        $(function () {
            if(${size == 0}){
                layer.msg('暂无选择授课',
                    {icon: 6, time: 2000});
            }
        })
    </script>
</head>
<body style="text-align: center">
<h1>所授课程</h1>
<c:forEach items="${list}" var="l">
    <input type="button" value="${l.courseName}" onclick="mark('${l.id}')"/>
    <p>
</c:forEach>
</body>
</html>
