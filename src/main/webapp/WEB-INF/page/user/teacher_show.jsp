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
    var id = "";
        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/user/teacherShow",
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
                        id = user.id;

                    }
                    $("#tbd").html(html)
                })
        }

        function update(){
            layer.open({
                type: 2,
                title: '修改教师详情信息',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath() %>/user/toUpdateTeacher/'+id //iframe的url
            });
        }

    </script>
    <style type="text/css">
        /*表格样式*/
        table {
            width: 90%;
            background: #ccc;
            margin: 10px auto;
            border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/
        }
        th,td {
            height: 15px;
            line-height: 15px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background: #eee;
            font-weight: normal;
        }
        tr {
            background: #fff;
        }
        tr:hover {
            background: #cc0;
        }
        td a {
            color: #06f;
            text-decoration: none;
        }
        td a:hover {
            color: #06f;
            text-decoration: underline;
        }
    </style>



</head>
<body style="text-align: center">

<h1>教师本人信息</h1>
<table id="tbd" border="1px" cellpadding="20" cellspacing="0" style="text-align: center" align="center">
</table>
<input type="button" value="修改" onclick="update()"/>
</body>
</html>
