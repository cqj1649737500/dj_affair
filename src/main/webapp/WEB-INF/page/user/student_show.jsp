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

        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/user/studentShow",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var user = data.data.list[i]
                        html += "<tr>"
                        html += "<td>用户名:</td>"
                        html += "<td>" + user.userName + "</td>"
                        html += "</tr>"
                        html += "<tr>"
                        html += "<td>用户密码:</td>"
                        html += "<td>" + user.userPwd + "</td>"
                        html += "</tr>"
                        html += "<tr>"
                        html += "<td>用户年龄:</td>"
                        html += "<td>" + user.userAge + "</td>"
                        html += "</tr>"
                        html += "<td>用户编码:</td>"
                        html += "<td>" + user.userNumber+ "</td>"
                        html += "</tr>"
                        html += "<td><input type = 'button' value = '修改' onclick = 'update(" + user.id + ")'/></td>"
                        html += "</tr>";
                    }
                    $("#tbd").html(html)
                })
        }

        function update(id){
            layer.open({
                type: 2,
                title: '修改学生详情信息',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath() %>/user/toUpdateStudent/'+id //iframe的url
            });
        }

    </script>
</head>
<body>
<table id="tbd" border="1px" cellpadding="10" cellspacing="0" style="text-align: center" align="center">

</table>

</body>
</html>
