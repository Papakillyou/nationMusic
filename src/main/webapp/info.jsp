<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/23
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script language="javascript">
    function realSysTime(clock){
        var now=new Date(); //创建Date对象
        var year=now.getFullYear(); //获取年份
        var month=now.getMonth(); //获取月份
        var date=now.getDate(); //获取日期
        var day=now.getDay(); //获取星期
        var hour=now.getHours(); //获取小时
        var minu=now.getMinutes(); //获取分钟
        var sec=now.getSeconds(); //获取秒钟
        month=month+1;
        var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
        var week=arr_week[day]; //获取中文的星期
        var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
        clock.innerHTML=time; //显示系统时间
    }
    window.onload=function(){
        window.setInterval("realSysTime(clock)",1000); //实时获取并显示系统时间
    }
</script>
<body>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="middle" align="center">
            <h1>欢迎进入民族音乐系统</h1>
        </td>
    </tr>
    <tr align="center">
        <td id="clock" />
    </tr>
</table>
</body>
</html>
