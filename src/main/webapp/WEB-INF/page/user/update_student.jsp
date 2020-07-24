<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 9:03
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
                $.post("<%=request.getContextPath()%>/user/updateStudent",
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
                            if('${user.level}' == 2){
                                parent.window.location.href="<%=request.getContextPath()%>/user/toStudentShow";
                                return;
                            }
                            if(${user.level == 0}){
                                parent.window.location.href="<%=request.getContextPath()%>/user/toRootStudentShow";
                                return;
                            }
                            parent.window.location.href="<%=request.getContextPath()%>/user/toStudentShowAll";
                        });
                    }
                )
            }
        });

        $().ready(function(){
            $("#fm").validate({
                rules : {
                    userName : {
                        required:true,
                    },
                    userPwd : {
                        required:true,
                    },
                    userAge : {
                        required:true,
                    },
                },
                messages:{
                    userName : {
                        required:"请输入用户名",
                    },
                    userPwd : {
                        required:"请输入用户密码",
                    },
                    userAge : {
                        required:"请输入用户年龄",
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
<form id = "fm">
    <input type="hidden" name="id" value="${u.id}"/>
        用户名:<input type="text" name="userName" value="${u.userName}"/>
    <p>
        用户密码:<input type="text" name="userPwd" value="${u.userPwd}"/>
    <p>
        用户年龄:<input type="text" name="userAge" value="${u.userAge}"/>
    <p>
    <h4>用户编码:${u.userNumber}</h4>
    <p>
    <input type="submit" value="修改"/><br/>
</form>
</body>
</html>
