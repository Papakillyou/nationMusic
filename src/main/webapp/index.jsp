<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>首页</title>
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/pintuer.css">
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/admin.css">
    <script src="/nationMusic_war_exploded/js/jquery.js"></script>
    <script src="/nationMusic_war_exploded/js/pintuer.js"></script>

</head>
<body style="background-color:#f2f9fd;">


<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="images/1.JPG" class="radius-circle rotate-hover" height="50" alt="" />民族音乐</h1>
    </div>
    <%String userName=(String) session.getAttribute("username");
//    Integer userid=(Integer) session.getAttribute("userid");
        if(userName!=null){%>

    <div class="head-l">
        <font size="4" color="#f0f8ff">hello!${username}</font>
        <a class="button button-little bg-green" href="/nationMusic_war_exploded/songlist/songlist_showSongList?userId=${userid}">我的歌单</a>
        <a class="button button-little bg-red" href="/nationMusic_war_exploded/welcome.jsp" >
            <span class="icon-power-off"></span> 退出登录</a> </div>
    <%}else{ %>
    <div class="head-l"><a class="button button-little bg-green" href="/nationMusic_war_exploded/login.jsp">登录</a>
        <a class="button button-little bg-green" href="/nationMusic_war_exploded/reg.jsp">注册</a></div>
    <%}%>
</div>


<div class="leftnav">

    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>

    <h2><span class="icon-pencil-square-o"></span>音乐</h2>

    <ul >
        <li><a href="music/music_showAdd" target="right"><span class="icon-caret-right"></span>添加音乐</a></li>
        <li><a href="/nationMusic_war_exploded/music/music_showMusic" target="right"><span class="icon-caret-right"></span>查看音乐</a></li>
    </ul>
</div>

<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })

        $(".icon-home").click(function(){
            $("#a_leader_txt").text("所有公告");
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })

    });


</script>

<ul class="bread">
    <li><a href="index.jsp" target="right" class="icon-home"> 首页</a></li>
    <li><a href="##" id="a_leader_txt">公告信息</a></li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="info.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>

</body>
</html>