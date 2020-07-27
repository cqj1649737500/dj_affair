<%--
  Created by IntelliJ IDEA.
  User: cqj
  Date: 2020/7/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layer/layer.js"></script>
    <script type="text/javascript">
        var level =
        ${user.level}
        var pages = 0;

        $(function () {
            search();
        })

        function search() {
            $.post("<%=request.getContextPath() %>/vacation/vacationShowExp",
                {"pageNo": $("#pageNo").val()},
                function (data) {
                    if (data.code != 200) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    if (data.data.list.length == 0) {
                        layer.msg("无请假记录", {icon: 5});
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var exp = data.data.list[i]
                        html += "<tr>"
                        html += "<td>" + exp.vacationTime + "</td>"
                        html += "<td>" + exp.endTime + "</td>"
                        html += "<td>" + exp.userName + "</td>"
                        html += "<td>" + exp.approveUserName + "</td>"
                        if (exp.status == 0) {
                            html += "<td>待审核</td>"
                        } else if (exp.status == 1) {
                            html += "<td>审核通过</td>"
                        } else {
                            html += "<td>审核拒绝</td>"
                        }
                        html += "</tr>"
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

        function vacate() {
            layer.open({
                type: 2,
                title: '请假',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath() %>/vacation/toVacate'//iframe的url
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
<br/><br/><br/>
<h2><font color="red" >请假</font></h2>
<br/>
<input type="hidden" id="pageNo" value="1"/>
<input type='button' value="请假" onclick="vacate()"/>
<table border="1px" cellspacing="0" cellpadding="10" style="text-align: center" align="center">
    <tr>
        <th>请假开始日期</th>
        <th>请假截至日期</th>
        <th>请假人</th>
        <th>审批人</th>
        <th>状态</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>
<div id="pageDiv"></div>
</body>
</html>
