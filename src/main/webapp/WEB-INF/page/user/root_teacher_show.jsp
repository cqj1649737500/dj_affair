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
            $("#fm").serialize(),
            function (data){
                if(data.code != 200){
                    layer.msg(data.msg, {icon: 5});
                    return;
                }
                if (data.data.list.length == 0) {
                    layer.msg("暂无教师", {icon: 5});
                    return;
                }
                var html = "";
                var pageHtml = "";
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
                pageHtml += "<input type = 'button' value = '加载更多' onclick = 'page(" + data.data.pages + ")'/>";
                $("#pageDiv").html(pageHtml);
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


    function page(pages) {
        var page = $("#pageNo").val();
        if (parseInt(page) + 1 > pages) {
            $("#pageDiv").html("--我是有底线的--");
            return;
        }
        $("#pageNo").val(parseInt(page) + 1);
        show();
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
<body style="text-align: center" >
<br/>
<h2><font color="red" >教师信息展示</font></h2>
<br/>
<form id="fm">
    <input type="hidden" id="pageNo" value="1" name="pageNo"/>
</form>
<table border="1px" cellspacing="0" cellpadding="10" style="text-align: center" align="center">
    <tr>
        <td>老师姓名</td>
        <td>密码</td>
        <td>年龄</td>
        <td>操作</td>
    </tr>
    <tbody id="tbd">

    </tbody>

</table>
<div id="pageDiv"></div>

</body>
</html>
