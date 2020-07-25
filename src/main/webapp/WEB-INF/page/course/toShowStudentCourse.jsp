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
        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/course/courseStudentSelfShow",
                {},
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var course = data.data.list[i]
                        html += "<tr>"
                        html += "<td>" + course.id + "</td>"
                        html += "<td>" + course.courseName + "</td>"
                        html += "<td>" + course.coursePeriod + "</td>"
                        html += "<td>" + course.courseType + "</td>"
                        html += "<td>" + course.courseNumber + "</td>"
                        html += "</tr>";
                    }
                    $("#tbd").append(html)

                })
        }

    </script>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <th>课程名</th>
        <th>课时</th>
        <th>课程类型</th>
        <th>课程编号</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>
</body>
</html>
