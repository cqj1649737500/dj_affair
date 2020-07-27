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
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    if (data.data.length == 0) {
                        layer.msg("暂无学生", {icon: 5});
                        return;
                    }
                    var html = "";
                    for (var i = 0; i < data.data.length; i++) {
                        var user = data.data[i];
                        html += "<tr>"
                        html += "<td>" + user.id + "</td>"
                        html += "<td>" + user.userName + "</td>"
                        if(user.grade == 0) {
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
                        if(user.grade == 0){
                            html += "<td><input type='button' value='评分' onclick='mark("+user.gradeId +","+ ${courseId}+")' /></td>"
                        }else{
                            html += "<td><span style='color: red' >已打分</span></td>"
                        }
                        html += "</tr>";
                    }
                    $("#tbd").html(html)
                })
        }

        function mark(gradeId,courseId){
            layer.open({
                type: 2,
                title: '评分',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath() %>/grade/findById?id='+gradeId+'&courseId='+courseId //iframe的url
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
<body style="text-align: center" >
<br/>
<h2><font color="red" >成绩</font></h2>
<br/>
<table border="1px" cellpadding="10" cellspacing="0" style="text-align: center" align="center">
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
