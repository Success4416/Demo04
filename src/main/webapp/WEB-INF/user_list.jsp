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
    <style type="text/css">
        table tr th{
            text-align: center;
        }
    </style>
</head>
<script type="text/javascript">
    $(function(){
        $("#two").hide();
        $("#one").hide();
    })
    function switchClazzName(){
        location.href="switchClazzName"
    }
    function switchScored(){
        location.href="switchScored"
    }
    function toDel(id){
        $.post(
            "toDel",
            {id:id},
            function(msg){
                if(msg){
                    alert("删除成功");
                    location.reload();
                }
            },"json"
        )
    }
    function toUpdate(id){
        location.href="toUpdate?id="+id;
    }
    function toInsert(){
        location.href="toInsert";
    }
    function toLook(id){
        $.post(
            "toLook",
            {id:id},
            function(msg){
                $("#name").text(msg.sname);
                $("#age").text(msg.age);
                $("#cname").text(msg.cname);
                $("#scored").text(msg.scored);
                $("#address").text(msg.proname+" "+msg.cityname+" "+msg.areaname);
            },"json"
        )
        $("#two").show();
    }
    function close_(){
        $("#two").hide();
    }
</script>
<body>
    <center>
        <h2>学生列表展示页面</h2>
        <table class="table table-striped table-bordered table-hover" style="width: 1000px;">
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>班级</th>
                <th>成绩</th>
                <th>操作
                    <button class="btn btn-success" onclick="toInsert()"style="float:right;">添加</button>
                </th>
            </tr>
            <c:forEach items="${userList }" var="s">
            <tr>
                <th>${s.id }</th>
                <th>${s.sname }</th>
                <th>${s.age }</th>
                <th>${s.cname }</th>
                <th>${s.scored }</th>
                <th>
                    <button class="btn btn-success" onclick="toDel(${s.id })">删除</button>
                    <button class="btn btn-success" onclick="toUpdate(${s.id })">修改</button>
                    <button class="btn btn-success" onclick="toLook(${s.id })">查看个人信息</button>
                </th>
            </tr>
            </c:forEach>
            <tr>
                <th colspan="10">
                    <button class="btn btn-success" onclick="switchClazzName()" style="float: left;margin-left: 220px;">查看班级</button>
                    <span style="float: left;margin-left: 50px;">${page}</span>
                    <button class="btn btn-success" onclick="switchScored()" style="float: left;margin-left: 50px;">查看班级</button>
                </th>
            </tr>
            <div style="width: 100px;height: 100px;border:1px red solid;" id="one">
                <button class="btn btn-success" onclick="dian()">点我加</button>
            </div>
                <table class="table table-hover table-responsive"  style="width: 300px;" id="two">
                    <tr>
                        <th>姓名</th>
                        <th id="name"></th>
                    </tr>
                    <tr>
                        <th>年龄</th>
                        <th id="age"></th>
                    </tr>
                    <tr>
                        <th>班级</th>
                        <th id="cname"></th>
                    </tr>
                    <tr>
                        <th>成绩</th>
                        <th id="scored"></th>
                    </tr>
                    <tr>
                        <th>家庭住址</th>
                        <th id="address"></th>
                    </tr>
                    <tr>
                        <th colspan="10">
                            <button class="btn btn-success" onclick="close_()" style="float:right;">关闭</button>
                        </th>
                    </tr>
                </table>
            <script>
                var step = 10;
                $(window).keydown(function(event){
                    var su = $("#one");
                    if(event.keyCode==37){
                        var ss = su.offset();
                        ss.left -= step;
                        su.offset(ss);
                    }
                    if(event.keyCode==38){
                        var ss = su.offset();
                        ss.top -= step;
                        su.offset(ss);
                    }
                    if(event.keyCode==39){
                        var ss = su.offset();
                        ss.left += step;
                        su.offset(ss);
                    }
                    if(event.keyCode==40){
                        var ss = su.offset();
                        ss.top += step;
                        su.offset(ss);
                    }
                    console.log(event.keyCode);
                })
                /*$(window).mousemove(function(e){
                    var el=$("#one");
                    el.offset({left:e.pageX,top:e.pageY});
                });*/
            </script>
            <script type="text/javascript">
                function dian(){
                    var c = 0;
                    function add(){
                        c++;
                        return c;
                    }
                    return add();
                }
            </script>
    </center>
</body>
</html>