<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >

	<c:if test="${user.level == 2}">
		<a href = "<%=request.getContextPath()%>/user/toStudentShow" target = "right">学生信息</a><p>
		<a href = "<%=request.getContextPath()%>/applyCourse/toAllCourseShow" target = "right">课程选择</a><p>
		<a href = "<%=request.getContextPath()%>/course/toShowGrade" target = "right">成绩查询</a><p>
	</c:if>
	<c:if test="${user.level == 1}">
		<a href = "<%=request.getContextPath()%>/user/toShow" target = "right">教师信息</a><p>
		<a href = "<%=request.getContextPath()%>/user/toStudentShowAll" target = "right">学生信息</a><p>
		<a href = "<%=request.getContextPath()%>/grade/toMark" target = "right">学生考核打分</a><p>
		<a href = "<%=request.getContextPath()%>/vacation/toVacationShowExp" target = "right">请假</a><p>
		<a href = "<%=request.getContextPath()%>/course/toCourseShow" target = "right">授课选择</a><p>
	</c:if>
	<c:if test="${user.level == 0}">
		<a href = "<%=request.getContextPath()%>/user/toRootStudentShow" target = "right">学生信息</a><p>
		<a href = "<%=request.getContextPath()%>/user/toTeacherShow" target = "right">教师信息</a><p>
		<a href = "<%=request.getContextPath()%>/notice/toNoticeShow" target = "right">公告发布</a><p>
		<a href = "<%=request.getContextPath()%>/course/toAdd" target = "right">课程管理</a><p>
		<a href = "<%=request.getContextPath()%>/vacation/toAudit" target = "right">请假审批</a><p>
		<a href = "<%=request.getContextPath()%>/applyCourse/toApplyCourseShow" target = "right">授课审批</a><p>
	</c:if>



</body>
</html>