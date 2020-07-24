<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/24
  Time: 10:40
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

        var courseIds = null;

        function selectedValue() {
            courseIds = $('input[name = "courseIds"]:checked');
            var chk_value = [];
            $.each(courseIds, function () {
                chk_value.push($(this).val());
            })
            $("#findByIds").val(chk_value);
            return chk_value;
        }

        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/course/courseShowAll",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var course = data.data.list[i]
                        html += "<tr>"
                        html += "<td><input type = 'checkbox' name = 'courseIds' value = '" + course.id + "'/></td>"
                        html += "<td>" + course.courseName + "</td>"
                        html += "<td>" + course.coursePeriod + "</td>"
                        if(course.courseType == 0) {
                            html += "<td>政治</td>"
                        }else if (course.courseType == 1) {
                            html += "<td>社会</td>"
                        }else if (course.courseType == 2) {
                            html += "<td>文科</td>"
                        }else {
                            html += "<td>理科</td>"
                        }
                        html += "<td>" + course.courseNumber + "</td>"
                        html += "</tr>";
                    }
                    $("#tbd").append(html)
                    pageHtml += "<input type = 'button' value = '加载更多' onclick = 'page(" + data.data.pages + ")'/>";
                    $("#pageDiv").html(pageHtml);
                })
        }

        function page(pages) {
            var page = $("#pageNo").val();
            if (parseInt(page) + 1 > pages) {
                $("#pageDiv").html("--我是有底线的--");
                return;
            }
            $("#pageNo").val(parseInt(page) + 1);
            show();
        }

        function schooling() {
            if (selectedValue().length <= 0) {
                alert("请选择你要申请的课程");
                return;
            }
            if (selectedValue().length > 2) {
                alert("最多授课两门课程");
                return;
            }
            $.post("<%=request.getContextPath() %>/applyCourse/toSchooling?ids=" + selectedValue(),
                {},
                function (data) {
                    if (data.code != 200) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    layer.msg(data.msg, {
                        icon: 6,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function () {
                        window.location.href="<%=request.getContextPath()%>/course/toCourseShow";
                    });
                })

        }
    </script>
</head>
<body>
<input type="button" value="授课" onclick="schooling()">
<table>
    <tr>
        <th></th>
        <th>课程名</th>
        <th>课时</th>
        <th>课程类型</th>
        <th>课程编码</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>
<div id="pageDiv"></div>

</body>
</html>
