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
<body>
<table>
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
