<%--
  Created by IntelliJ IDEA.
  User: cqj
  Date: 2020/7/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 导入c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
    <script type="text/javascript">

        function update(id){
            layer.open({
                type: 2,
                title: '修改教师详情信息',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath() %>/user/toUpdateTea/'+id //iframe的url
            });
        }

    </script>
</head>
<body>
<form id="fm">
    <input type="button" value="修改" onclick="update('${user.id}')"/>
    <input type="hidden" name="id" value="${user.id}"/>
    <p>
        <h3>用户名:${user.userName}</h3>
    <p>
        <h3>用户密码:${user.userPwd}</h3>
    <p>
        <h3>用户年龄:${user.userAge}</h3>
    <p>
        <h3>用户编码:${user.userNumber}</h3>
</form>
</body>
</html>
