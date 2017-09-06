<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
    function switchClazzName(){
        location.href="switchClazzName"
    }
</script>
<body>
    <center>
        <h2>学生成绩展示页面</h2><br>
        <table class="table table-striped table-bordered table-hover" style="width: 400px;">
            <tr>
                <th>姓名</th>
                <th>成绩</th>
            </tr>
            <c:forEach items="${scoredList }" var="s">
            <tr>
                <th>${s.sname }</th>
                <th>${s.scored }</th>
            </tr>
            </c:forEach>
            <tr>
                <th colspan="10">
                    <span style="float: left;margin-left: 50px;">${page}</span>
                </th>
            </tr>
    </center>
</body>
</html>