<%@ page import="com.music.entity.User" %>
<%@ page import="javax.management.MBeanServer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title></title>
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/pintuer.css">
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/admin.css">
    <script src="/nationMusic_war_exploded/js/jquery.js"></script>
    <script src="/nationMusic_war_exploded/js/pintuer.js"></script>
</head>

<body>

<%String userName=(String) session.getAttribute("username");
//    Integer userid=(Integer) session.getAttribute("userid");
    if(userName!=null){%>
<div class="padding border-bottom">
    <ul class="search" style="padding-left:10px;">
        <li><a class="button border-main icon-plus-square-o" href="/nationMusic_war_exploded/songlist/songlist_showSongList?userId=${userid}">我的歌单</a></li>
        <li> <a class="button border-main icon-plus-square-o" href="music/music_showAdd"> 添加音乐</a> </li>
        <if condition="$iscid eq 1">
        </if>
    </ul>
</div>


<%}else{ %>
<div class="padding border-bottom">
    <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="music/music_showAdd"> 添加音乐</a> </li>
        <if condition="$iscid eq 1">
        </if>
    </ul>
</div>
<%}%>

    <s:form action="music_queryMusic">
    <div class="padding border-bottom">
        <ul class="search" style="padding-left:35%;">
            <li><h2>音乐名称,歌手,民族：</h2></li>
            <li>
                <input type="text" placeholder="请输入关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
                <input type="submit" class="button border-main icon-search" value="提交查询"/>
            </li>
        </ul>
    </div>
    </s:form>

<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">项目列表</strong></div>
        <div class="padding border-bottom">
        </div>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th>序号</th>
            <th>歌名</th>
            <th>歌手</th>
            <th>民族</th>
            <th>操作</th>
        </tr>

        <volist name="list" id="vo">
            <c:forEach var="music" items="${musicList}" varStatus="status">
                <tr>
                    <td><c:out value="${status.index+1}"></c:out></td>
                    <td><a href="music_showDetail?music.musicid=${music.musicid}">
                        <c:out value="${music.title}"></c:out></a>></td>
                    <td><c:out value="${music.singer}"></c:out></td>
                    <td><c:out value="${music.nation}"></c:out></td>
                    <td><a href="music_showEdit?music.musicid=${music.musicid}">编辑</a>></td>
                    <td><a href="music_deleteMusic?music.musicid=${music.musicid}">删除</a>></td>
                    <td><a href="/nationMusic_war_exploded/order/order_showListToAdd?musicid=${music.musicid}">添加至我的歌单</a>></td>

                </tr>
            </c:forEach>


        </volist>
</table>


</form>

</body>
</html>