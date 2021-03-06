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
    <script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
    <script type="text/javascript">
        $.validator.setDefaults({
            submitHandler: function() {
                var index = layer.load(1,{shade:0.3});
                $.post("<%=request.getContextPath()%>/user/addUser",
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
                            location.href="<%=request.getContextPath()%>/user/toLogin";
                        });

                    })
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
                    userNumber : {
                        required:true,
                        remote: {
                            url: "<%=request.getContextPath() %>/user/findUserByUserNumber",     //后台处理程序
                            type: "post",               //数据发送方式
                            dataType: "json",           //接受数据格式
                            data: {                     //要传递的数据
                                username: function() {
                                    return $("#userNumber").val();
                                }
                            },
                            dataType : "json",
                            dataFilter:function(data,type){
                                if(data == "true"){
                                    return true;
                                }else{
                                    return false;
                                }
                            }
                        }
                    },
                    level : {
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
                    userNumber : {
                        required:"请输入用户编码",
                        remote: "用户编码已存在"
                    },
                    level : {
                        required:"请选择用户等级",
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
<body style="text-align: center">
<br>	<br>
<br><br><br>
<div style="border: 1px red solid;width: 400px;height: 500px;margin-left: 500px">
    <br><br>
    <h2><font color="red">用户添加</font></h2>
    <br>
<form id="fm">
    用户名：<input type="text" name = "userName" />
    <br><br>
    密&nbsp;&nbsp;&nbsp;码：<input type="text" name = "userPwd"  />
    <br><br>
    年&nbsp;&nbsp;&nbsp;龄：<input type="text" name="userAge" />
    <br><br>
    用户编码：<input type="text" name="userNumber" />
    <br><br>
    等&nbsp;&nbsp;&nbsp;级：<input type="radio" name="level" value="0" />管理员
            <input type="radio" name="level" value="1" />教师
            <input type="radio" name="level" value="2" />学生<br><br>
    <input type="submit" value = "确定" />
</form>
</div>
</body>
</html>