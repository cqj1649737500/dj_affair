<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/24
  Time: 16:33
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

        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/grade/studentMack",
                {"userId":${userId}, "courseId":${courseId}},
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    for (var i = 0; i < data.data.length; i++) {
                        var user = data.data[i];
                        html += "<tr>"
                        html += "<td>" + user.id + "</td>"
                        html += "<td>" + user.userName + "</td>"
                        if(user.grade == null) {
                            html += "<td>未评分</td>"
                        }else if (user.grade == 1) {
                            html += "<td>优秀</td>"
                        }else if (user.grade == 2) {
                            html += "<td>良好</td>"
                        }else if (user.grade == 3) {
                            html += "<td>及格</td>"
                        }else {
                            html += "<td>不及格</td>"
                        }
                        html += "<td><input type='button' value='评分' onclick='mark("+user.id +","+ ${courseId}+")' /></td>"
                        html += "</tr>";
                    }
                    $("#tbd").html(html)
                })
        }

        function mark(id,courseId){
            layer.open({
                type: 2,
                title: '评分',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath() %>/grade/findById?id='+id+'&courseId='+courseId //iframe的url
            });
        }

    </script>
</head>
<body>
<table>
    <tr>
        <th>学生id</th>
        <th>学生姓名</th>
        <th>分数</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>

</body>
</html>
