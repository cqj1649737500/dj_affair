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
            $.post("<%=request.getContextPath() %>/course/studentCourseShow",
                {},
                function (data) {
                    if (data.code != 200) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    if (data.data.studentSelfGrade.length == 0) {
                        layer.msg("暂无成绩", {icon: 5});
                        return;
                    }
                    var html = "";
                    for (var i = 0; i < data.data.studentSelfGrade.length; i++) {
                        var course = data.data.studentSelfGrade[i]
                        html += "<tr>"
                        html += "<td>" + course.id + "</td>"
                        html += "<td>" + course.courseName + "</td>"
                        html += "<td>" + course.coursePeriod + "</td>"
                        if(course.courseType == 0){
                            html += "<td>政治</td>"
                        }
                        if(course.courseType == 1){
                            html += "<td>社会</td>"
                        }
                        if(course.courseType == 2){
                            html += "<td>文科</td>"
                        }
                        if(course.courseType == 3){
                            html += "<td>理科</td>"
                        }
                        html += "<td>" + course.courseNumber + "</td>"
                        if(course.userStdentGrade == 1){
                            html += "<td>优秀</td>"
                        }
                        if(course.userStdentGrade == 2){
                            html += "<td>良好</td>"
                        }
                        if(course.userStdentGrade == 3){
                            html += "<td>及格</td>"
                        }
                        if(course.userStdentGrade == 4){
                            html += "<td>不及格</td>"
                        }
                        if(course.userStdentGrade == null){
                            html += "<td>未评价</td>"
                        }

                        html += "</tr>";
                    }
                    $("#tbd").append(html)

                })
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
<body style="text-align: center" >
<br/><br/><br/>
<h2><font color="red" >成绩</font></h2>
<table border="1px" cellpadding="10" cellspacing="0" style="text-align: center" align="center">
    <tr>
        <th>id</th>
        <th>课程名</th>
        <th>课时</th>
        <th>课程类型</th>
        <th>课程编号</th>
        <th>成绩</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>
</body>
</html>
