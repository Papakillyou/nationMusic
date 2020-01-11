
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>展示歌曲</title>
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/pintuer.css">
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/admin.css">
    <script src="/nationMusic_war_exploded/js/jquery.js"></script>
    <script src="/nationMusic_war_exploded/js/pintuer.js"></script>

</head>
<body>
<%
    String userName=(String) session.getAttribute("username");
    Integer userid=(Integer) session.getAttribute("userid");
    if(userName!=null){%>
hello!${username}
<a href="/nationMusic_war_exploded/logout.jsp">注销</a>
<a href="/nationMusic_war_exploded/songlist/songlist_showSongList?userId=${userId}">我的歌单</a>

<%}else{ %>
<a href="/nationMusic_war_exploded/login.jsp">登录</a>
<a href="/nationMusic_war_exploded/reg.jsp">注册</a>
<%}%>
<form method="post" action="songlist_showSongList" id="listform">
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
        </tr>

        <volist name="list" id="vo">
            <c:forEach var="music" items="${musicList}" varStatus="status">
                <tr>
                    <td><c:out value="${status.index+1}"></c:out></td>
                    <td><a href="/nationMusic_war_exploded/music/music_showDetail?music.musicid=${music.musicid}">
                        <c:out value="${music.title}"></c:out></a>
                    </td>
                    <td><c:out value="${music.singer}"></c:out></td>
                    <td><c:out value="${music.nation}"></c:out></td>
                    <td><a href="order_delOrder?musicid=${music.musicid}&listid=${listid}">从我的歌单删除</a>></td>

                </tr>
            </c:forEach>
        </volist>
    </table>

</form>

</body>
</html>
