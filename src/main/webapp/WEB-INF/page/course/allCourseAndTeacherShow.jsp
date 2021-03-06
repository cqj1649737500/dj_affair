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

        //赋选中复选框的值
        function selectedValue() {
            appliancesIds = $('input[name="id"]:checked');
            var chk_value = [];
            $.each(appliancesIds,function(){
                chk_value.push($(this).val());
            })
            $("#ids").val(chk_value);
            return chk_value;
        }
        $(function () {
            show();
        })

        function show() {
            $.post("<%=request.getContextPath() %>/applyCourse/AllCourseShow",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != 200) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    if (data.data.size == 0) {
                        layer.msg('暂无课程',
                            {icon: 6, time: 2000});
                    }

                    var html = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var course = data.data.list[i]
                        html += "<tr>"
                        html += "<td><input type='checkbox' value='"+course.id+"' name='id' /></td>"
                        html += "<input type='hidden' value='"+course.courseId+"' id='"+course.id+"' />"
                        html += "<td>" + course.id + "</td>"
                        html += "<td>" + course.teacherName + "</td>"
                        html += "<td>" + course.courseName + "</td>"
                        html += "<td>" + course.coursePeriod + "</td>"
                        html += "<td>" + course.courseTypeShow + "</td>"
                        html += "<td>" + course.courseNumber + "</td>"
                        html += "</tr>";
                    }
                    $("#tbd").html(html)
                })
        }

        function selectCouse() {
            selectedValue();
            if(selectedValue().length > 2){
                layer.msg("最多选修两门课程", {icon: 5});
                return;
            }
            if(selectedValue().length <= 0){
                layer.msg("请先选择课程", {icon: 5});
                return;
            }
            if(selectedValue().length <= 0){
                layer.msg("请先选择课程", {icon: 5});
                return;
            }
            if($("#"+selectedValue()[0]+"").val()== $("#"+selectedValue()[1]+"").val()){
                layer.msg("不能选相同的课程", {icon: 5});
                return;
            }
            if(${number == 2}){
                layer.msg("贪多嚼不烂，请先把已选择的两门课程学完", {icon: 5});
                return;
            }
            if(${number == 1}){
                if(selectedValue().length == 2){
                    layer.msg("您有一门正在学习，所以您只能选择一门", {icon: 5});
                    return;
                }
            }
            $.post("<%=request.getContextPath()%>/applyCourse/addStudentCourse",
                {"ids":  $("#ids").val()},
                function(data){
                    if(data.code != 200){
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    layer.msg(data.msg, {
                        icon: 6,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        show();
                    });

                })
        }

        function selectAllCouse() {
            window.location.href = "<%=request.getContextPath()%>/course/showStudentCourseBySelf"
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
<h2><font color="red" >选课</font></h2>
<br/>
<input type="hidden" id="ids" />
<input type="button" value="确定选课" onclick="selectCouse()" />
<input type="button" value="查看已选课程" onclick="selectAllCouse()" />
<table border="1px" cellpadding="10" cellspacing="0" style="text-align: center" align="center">
    <tr>
        <td></td>
        <td>ID</td>
        <td>授课老师姓名</td>
        <td>课程名字</td>
        <td>课时</td>
        <td>课程类型</td>
        <td>课程编号</td>
    </tr>
    <tbody id="tbd" ></tbody>
</table>

</body>
</html>
