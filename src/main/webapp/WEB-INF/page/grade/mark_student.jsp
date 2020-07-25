<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/25
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
    <script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
    <script type="text/javascript">
        $.validator.setDefaults({
            submitHandler: function() {
                var index = layer.load(1,{shade:0.3});
                $.post("<%=request.getContextPath()%>/grade/updateMack",
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
                            parent.window.location.href="<%=request.getContextPath()%>/grade/toStudentMack?courseId="+${stu.courseId};
                        });
                    }
                )
            }
        });

        $().ready(function(){
            $("#fm").validate({
                rules : {
                    grade : {
                        required:true,
                    },
                },
                messages:{
                    grade : {
                        required:"请对该学生进行评分",
                    },
                }
            })
        })
    </script>
</head>
<body>
<form id="fm">
    <input type="hidden" name="id" value="${stu.id}"/>
    <input type="hidden" name="id" value="${stu.courseId}"/>
    <input type="radio" name="grade" value="1"/>优秀<p>
    <input type="radio" name="grade" value="2"/>良好
    <p>
        <input type="radio" name="grade" value="3"/>及格
    <p>
        <input type="radio" name="grade" value="4"/>不及格
    <p>
    <input type="submit" value="确定"/>
</form>
</body>
</html>
