<%--
  Created by IntelliJ IDEA.
  User: qzh
  Date: 2020/7/24
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
<script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
<script type="text/javascript" >
    $(function(){
        search();
    })

    function search(){
        $.post("<%=request.getContextPath() %>/applyCourse/applyCourseShow",
            {},
            function (data){
                if(data.code != 200){
                    layer.msg(data.msg, {icon: 5});
                    return;
                }
                var html = "";
                for(var i = 0; i <data.data.list.length; i++){
                    var applyCourse = data.data.list[i]
                    html += "<tr>"
                    html += "<td>"+applyCourse.applyCourseName+"</td>"
                    html +="<td>"+applyCourse.teacherName+"</td>"
                    html += "<td>"+applyCourse.adminName+"</td>"
                    if (applyCourse.status == 0){
                        html +="<td>待确定</td>"
                    }else if (applyCourse.status == 1){
                        html +="<td>同意</td>"
                    }else {
                        html +="<td>拒绝</td>"
                    }
                    html +="<td><input type='button' value='通过' onclick='updateStatus("+applyCourse.id+",1)'></td>"
                    html +="<td><input type='button' value='拒绝' onclick='updateStatus("+applyCourse.id+",2)'></td>"
                    html += "</tr>"
                }
                $("#tbd").html(html)
            })
    }
    function updateStatus(id,status) {
        $.post("<%=request.getContextPath() %>/applyCourse/updateStatus",
            {"status":status, "id": id},
            function (data){
                if (data.code == 200){
                    search();
                    return;
                }
                layer.msg(data.msg, {icon: 5});
            });
    }

</script>
<body>
<table>
    <tr>
        <td>课程名</td>
        <td>授课老师</td>
        <td>审批人</td>
        <td>审批状态</td>
        <td>操作</td>
    </tr>
    <tbody id="tbd">

    </tbody>

</table>
</body>
</html>
