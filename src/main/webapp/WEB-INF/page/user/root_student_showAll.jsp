<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layer/layer.js"></script>
    <script type="text/javascript">
        var pages = 0;

        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/user/rootStudentShowAll",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var user = data.data.list[i]
                        html += "<tr>"
                        html += "<td>" + user.userName + "</td>"
                        html += "<td>" + user.userPwd + "</td>"
                        html += "<td>" + user.userAge + "</td>"
                        html += "<td><input type = 'button' value = '修改' onclick = 'update(" + user.id + ")'/></td>"
                        html += "</tr>";
                    }
                    $("#tbd").html(html);
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
<table>
    <tr>
        <th>学生姓名</th>
        <th>学生密码</th>
        <th>学生年龄</th>
        <th>操作</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>
</body>
</html>
