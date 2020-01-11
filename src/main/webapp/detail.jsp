<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/2
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>歌曲详情</title>
</head>
<body>
<%--<a href="/nationMusic_war_exploded/music/music_showMusic">返回首页</a>--%>
<%--<%String username=(String) session.getAttribute("username");--%>
    <%--Integer userid=(Integer) session.getAttribute("userid");--%>
    <%--if(username!=null){%>--%>
<%--hello!${username}--%>
<%--<a href="/nationMusic_war_exploded/logout.jsp">注销</a>--%>
<%--<a href="songlist_songlistList?${userid}">我的歌单</a>--%>

<%--<%}else{ %>--%>
<%--<a href="/nationMusic_war_exploded/login.jsp">登录</a>--%>
<%--<a href="/nationMusic_war_exploded/reg.jsp">注册</a>--%>
<%--<%}%>--%>

<audio src="${music.path}" controls="controls"></audio>
<p>歌名：<c:out value="${music.title}"></c:out></p>
<p>歌手：<c:out value="${music.singer}"></c:out></p>
<p>歌曲简介：<c:out value="${music.summary}"></c:out></p>
<p>民族：<c:out value="${music.nation}"></c:out></p>

</body>
</html>
