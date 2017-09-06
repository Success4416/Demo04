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
    function save(){
        $.post(
            "doInsert",
            $("form").serialize(),
            function(msg){
                if(msg){
                    alert("添加成功");
                    location.href="list"
                }
            },"json"
        )
    }
    function getCity(code){
        $.post(
            "getCity",
            {code:code},
            function(msg){
                $("[name='city']").empty();
                for(var i in msg ){
                    $("[name='city']").append("<option value='"+msg[i].code+"' onclick='getArea()' class='city'>"+msg[i].name+"</option>")
                }
            },"json"
        )
    }
    function getArea(){
        var code = $(".city:checked").val();
        $.post(
            "getArea",
            {code:code},
            function(msg){
                $("[name='areacode']").empty();
                for(var i in msg ){
                    $("[name='areacode']").append("<option value='"+msg[i].code+"'>"+msg[i].name+"</option>")
                }
            },"json"
        )
    }
</script>
<body>
    <center>
        <h2>学生信息添加页面</h2><br>
        <form>
        <table class="table table-striped table-bordered table-hover" style="width:500px;">
            <tr>
                <th>姓名</th>
                <th>
                    <input type="text" name="sname"/>
                </th>
            </tr>
            <tr>
                <th>年龄</th>
                <th>
                    <input type="text" name="age"/>
                </th>
            </tr>
            <tr>
                <th>成绩</th>
                <th>
                    <input type="text" name="scored" />
                </th>
            </tr>
            <tr>
                <th>班级</th>
                <th>
                    <select name="clazz">
                        <c:forEach items="${clazzList }" var="s">
                            <option value="${s.cid }">${s.cname }</option>
                        </c:forEach>
                    </select>
                </th>
            </tr>
            <tr>
                <th>地址</th>
                <th>
                    <select>
                        <c:forEach items="${proList }" var="s">
                            <option value="${s.code }" onclick="getCity(${s.code })">${s.name }</option>
                        </c:forEach>
                    </select>
                    <select name="city">
                            <option>--请选择--</option>
                    </select>
                    <select name="areacode">
                            <option>--请选择--</option>
                    </select>
                </th>
            </tr>
            <tr>
                <th colspan="10">
                    <input type="button" value="保存" class="btn btn-success" style="margin-left: 150px;" onclick="save()">
                </th>
            </tr>
        </table>
        </form>
    </center>
</body>
</html>