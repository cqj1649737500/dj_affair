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
        $.post("<%=request.getContextPath() %>/vacation/audit",
            {},
            function (data){
                if(data.code != 200){
                    layer.msg(data.msg, {icon: 5});
                    return;
                }
                if(data.data.list.length == 0){
                    layer.msg("暂无人员请假", {icon: 5});
                    return;
                }
                var html = "";
                for(var i = 0; i <data.data.list.length; i++){
                    var vacation = data.data.list[i]
                    html += "<tr>"
                    html += "<td>"+vacation.vacationTime+"</td>"
                    html +="<td>"+vacation.endTime+"</td>"
                    html += "<td>"+vacation.vacationName+"</td>"
                    html +="<td>"+vacation.approveName+"</td>"
                    if (vacation.status == 0){
                        html +="<td>待审批</td>"
                    }else if (vacation.status == 1){
                        html +="<td>通过</td>"
                    }else {
                        html +="<td>拒绝</td>"
                    }
                    html +="<td><input type='button' value='通过' onclick='updateStatus1("+vacation.id+",1)'></td>"
                    html +="<td><input type='button' value='拒绝' onclick='updateStatus1("+vacation.id+",2)'></td>"
                    html += "</tr>"
                }
                $("#tbd").html(html)
            })
    }
    function updateStatus1(id,status) {
        $.post("<%=request.getContextPath() %>/vacation/updateStatus1",
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
<br/><br/><br/>
<h2><font color="red" >请假审批</font></h2>
<br/>
<table border="1px" cellspacing="0" cellpadding="10" style="text-align: center" align="center">
    <tr>
        <td>请假开始日期</td>
        <td>请假截至日期</td>
        <td>请假老师</td>
        <td>审批人</td>
        <td>审批状态</td>
        <td colspan="2">操作</td>
    </tr>
    <tbody id="tbd">

    </tbody>

</table>


</body>
</html>
