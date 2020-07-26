<%--
  Created by IntelliJ IDEA.
  User: qzh
  Date: 2020/7/24
  Time: 15:22
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
        $.post("<%=request.getContextPath() %>/notice/noticeShow",
            {},
            function (data){
                if(data.code != 200){
                    layer.msg(data.msg, {icon: 5});
                    return;
                }
                if(data.data.list.length == 0){
                    layer.msg("暂无公告", {icon: 5});
                    return;
                }
                var html = "";
                for(var i = 0; i <data.data.list.length; i++){
                    var notice = data.data.list[i]
                    html += "<tr>"
                    html += "<td>"+notice.vacationName+"</td>"
                    html += "<td>"+notice.endTime+"</td>"
                    html +="<td><input type='button' value='删除' onclick='del("+notice.id+")'></td>"
                    html += "</tr>"
                }
                $("#tbd").html(html)
            })
    }
    function del(id) {
        $.post("<%=request.getContextPath() %>/notice/delNotice",
            {"id":id},
            function (data){
                if (data.code != 200){
                    layer.msg("删除失败", {icon: 5});
                    return;
                }
                layer.msg(data.msg, {icon: 6});
                search();
            }

        )};


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
<body style="text-align: center">

<h1>公告信息</h1>
<table  border="1px" cellpadding="20" cellspacing="0" style="text-align: center" align="center">
<tr>
    <td>请假老师</td>
    <td>请假截至日期</td>
    <td>操作</td>
</tr>
<tbody id="tbd">

</tbody>

</table>

</body>
</html>
