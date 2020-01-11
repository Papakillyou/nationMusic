<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/2
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加歌曲</title>
</head>
<body>

<%String username=(String) session.getAttribute("username");
    Integer userid=(Integer) session.getAttribute("userid");
    if(username!=null){%>
hello!${username}
<a href="/nationMusic_war_exploded/logout.jsp">注销</a>
<a href="songlist_songlistList?${userid}">我的歌单</a>

<%}else{ %>
<a href="/nationMusic_war_exploded/login.jsp">登录</a>
<a href="/nationMusic_war_exploded/reg.jsp">注册</a>
<%}%>


<s:form action="music_addMusic.action" method="post" enctype="multipart/form-data">
    <s:textfield name="music.title" label="歌名"></s:textfield>
    <s:textfield name="music.singer" label="歌手"></s:textfield>
    <s:textfield name="music.summary" label="描述"></s:textfield>
    <%--<s:textfield name="music.path" label="路径"></s:textfield>--%>
    <s:textfield name="music.nation" label="民族"></s:textfield>
    <input type="file" name="upmusic"/>
    <s:submit value="提交"></s:submit>
</s:form>
</body>
</html>
