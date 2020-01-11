<%@ page import="com.music.entity.User" %>
<%@ page import="javax.management.MBeanServer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>民族音乐</title>
</head>
<body>

 <%--int userid=(int) session.getAttribute("userid");--%>
<%String userName=(String) session.getAttribute("username");
//    Integer userid=(Integer) session.getAttribute("userid");
     if(userName!=null){%>
 hello!${username}
 <a href="/nationMusic_war_exploded/logout.jsp">注销</a>
 <a href="/nationMusic_war_exploded/songlist/songlist_showSongList?userId=${userid}">我的歌单</a>

 <%}else{ %>
 <a href="/nationMusic_war_exploded/login.jsp">登录</a>
 <a href="/nationMusic_war_exploded/reg.jsp">注册</a>
 <%}%>

<%--<script>--%>
    <%--function  logout() {--%>
        <%--session.invalidate();--%>
        <%--sessionStorage.clear();  //清除所有session值--%>
        <%--window.location.reload();--%>
    <%--}--%>
<%--</script>--%>

 <s:form action="music_queryMusic">
    <label>音乐名称,歌手,民族：</label><input type="text" name="keywords" placeholder="请输入关键词">
    <s:submit value="查询"></s:submit>
</s:form>
    <table>
        <tr>
            <th>序号</th>
            <th>歌名</th>
            <th>歌手</th>
            <th>民族</th>
            <a href="music/music_showAdd">添加音乐</a>
        </tr>

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
    </table>
</body>
</html>