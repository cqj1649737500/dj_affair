<%--
  Created by IntelliJ IDEA.
  User: cqj
  Date: 2020/6/24
  Time: 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
    <script type="text/javascript">
        function login() {
            var index = layer.load(0,{shade:0.3}, {time: 10*1000});
            $.post("<%=request.getContextPath()%>/user/login",
                $("#fm").serialize(),
                function(data){
                    layer.close(index);
                    if(data.code == "200"){
                        layer.msg('登陆成功，欢迎！',
                            {icon: 6, time: 2000},
                            function(){
                                window.location.href = "<%=request.getContextPath()%>/index/toIndex"
                            });
                        return;
                    }
                    alert("错误")

                })
        }

        function register() {
            window.location.href = "<%=request.getContextPath()%>/user/toRegister"
        }

    </script>
</head>
<body>
<form id="fm">
    用户名：<input type="text" name = "userName" />
    <br><br>
    密&nbsp;&nbsp;&nbsp;码：<input type="text" name = "userPwd"  />
    <br><br>
    <input type="button" value="登录" onclick="login()"/>
    <input type="button" value="注册" onclick="register()"/>
</form>
</body>
</html>