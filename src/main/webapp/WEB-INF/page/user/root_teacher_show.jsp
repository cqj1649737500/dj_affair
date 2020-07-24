<%--
  Created by IntelliJ IDEA.
  User: qzh
  Date: 2020/7/22
  Time: 16:46
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
        $.post("<%=request.getContextPath() %>/user/RootTeacherShow",
            {},
            function (data){
                if(data.code != 200){
                    layer.msg(data.msg, {icon: 5});
                    return;
                }
                var html = "";
                for(var i = 0; i <data.data.list.length; i++){
                    var user = data.data.list[i]
                    html += "<tr>"
                    html += "<td>"+user.userName+"</td>"
                    html +="<td>"+user.userPwd+"</td>"
                    html += "<td>"+user.userAge+"</td>"
                    html +="<td><input type='button' value='修改' onclick='updateTeacher("+user.id+")'></td>"
                    html += "</tr>"
                }
                $("#tbd").html(html)
            })
    }

    function updateTeacher(id) {
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
<body>
<table>
    <tr>
        <td>老师姓名</td>
        <td>密码</td>
        <td>年龄</td>
        <td>操作</td>
    </tr>
    <tbody id="tbd">

    </tbody>

</table>


</body>
</html>
