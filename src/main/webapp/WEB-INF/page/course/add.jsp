<%--
  Created by IntelliJ IDEA.
  User: qzh
  Date: 2020/7/22
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<script type="text/javascript" src ="<%=request.getContextPath() %>/js/jquery-1.12.4.js"  ></script>
<script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/lib/jquery.js"></script>
<script  type="text/javascript" src="<%=request.getContextPath() %>/jquery-validation-1.14.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src ="<%=request.getContextPath()%>/layer/layer.js" ></script>
<script type="text/javascript">
    $.validator.setDefaults({
        submitHandler: function() {
            var index = layer.load(1,{shade:0.3});
            $.post("<%=request.getContextPath()%>/course/add",
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
                        parent.window.location.href="<%=request.getContextPath()%>/index/toIndex";
                    });

                })
        }
    });


    $().ready(function(){
        $("#fm").validate({
            rules : {
                courseNumber : {
                    required:true,

                },
                courseName : {
                    required:true,
                },
                coursePeriod : {
                    required:true,
                },
                courseType : {
                    required:true,
                },
                userTeacherId : {
                    required:true,
                },
                courseNumber : {
                    required:true,
                },

            },
            messages:{
                courseNumber : {
                    required:"请输入课程编码",
                },
                courseName : {
                    required:"请输入课程名",
                },
                coursePeriod : {
                    required:"请输入课时",
                },
                courseType : {
                    required:"请选择类型",
                },
                userTeacherId : {
                    required:"请输入教师id",
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
<body style="text-align: center">
<br>	<br>
<br><br><br>
<div style="border: 1px red solid;width: 400px;height: 500px;margin-left: 500px">
    <br><br>
    <h2><font color="red">课程添加</font></h2>
    <br>
<form id="fm">

    课程名&nbsp;：<input type="text" name = "courseName" />
    <br><br>
    课&nbsp;&nbsp;&nbsp;时：<input type="text" name = "coursePeriod"  />
    <br><br>
    类&nbsp;&nbsp;&nbsp;型&nbsp;：
        政治<input type="radio" name = "courseType"  value="0"/>
        社会<input type="radio" name = "courseType"  value="1"/>
        文科<input type="radio" name = "courseType"  value="2"/>
        理科<input type="radio" name = "courseType"  value="3"/>
    <br><br>
    课程编号：<input type="text" name="courseNumber" /><br>
    <input type="submit" value = "确定" />

</form>
</div>
</body>
</html>
