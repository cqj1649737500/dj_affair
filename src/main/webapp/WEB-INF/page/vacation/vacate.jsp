<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
    <script type="text/javascript" src ="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"  ></script>
    <script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
    <script type="text/javascript">
        $.validator.setDefaults({
            submitHandler: function() {
                var index = layer.load(1,{shade:0.3});
                $.post("<%=request.getContextPath()%>/vacation/vacate",
                    $("#fm").serialize(),
                    function(data){
                        if(data.code != 200){
                            layer.msg(data.msg, {icon: 5});
                            layer.close(index);
                            return;
                        }
                        layer.msg(data.msg, {
                            icon: 6,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            layer.close(index);
                            parent.window.location.href="<%=request.getContextPath()%>/vacation/toVacationShowExp";
                        });
                    }
                )
            }
        });

        $().ready(function(){
            $("#fm").validate({
                rules : {
                    days : {
                        required:true,
                    },
                },
                messages:{
                    days : {
                        required:"请输入请假天数",
                    },
                }
            })
        })
    </script>
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body>
<form id="fm">
        请假人 :${user.userName}<p>
    <input type="hidden" value="${user.id}" name="id"/>
        请假日期:<input class="Wdate" type="text" name = "vacationTime" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-{%d+1}'})" />
    <p>
        请假天数:<input type="text" name="days"/>
    <p>
        <input type="submit" value="提交请假申请"/>
</form>

</body>
</html>
