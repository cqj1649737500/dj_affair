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


</script>
<body>
<form id="fm">

    课程名：<input type="text" name = "courseName" />
    <br><br>
    课&nbsp;&nbsp;&nbsp;时：<input type="text" name = "coursePeriod"  />小时
    <br><br>
    类&nbsp;&nbsp;&nbsp;型：
        政治<input type="radio" name = "courseType"  value="0"/>
        社会<input type="radio" name = "courseType"  value="1"/>
        文科<input type="radio" name = "courseType"  value="2"/>
        理科<input type="radio" name = "courseType"  value="3"/>
    <br><br>
    教师ID：<input type="text" name="userTeacherId" />
    <br><br>
    courseNumber：<input type="text" name="userNumber" />
    <input type="submit" value = "确定" />

</form>

</body>
</html>
