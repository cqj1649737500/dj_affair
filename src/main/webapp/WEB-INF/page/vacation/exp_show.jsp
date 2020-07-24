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
                        alert(data.msg);
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
</head>
<body>
<a href="javascript:history.go(-1)">返回</a>
<input type="hidden" id="pageNo" value="1"/>
<input type='button' value="请假" onclick="vacate()"/>
<table>
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
