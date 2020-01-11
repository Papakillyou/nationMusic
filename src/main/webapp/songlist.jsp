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
<form method="post" action="songlist_showSongList" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"><a href="songlist/songlist_showAdd">创建新歌单</a></strong></div>
        <div class="padding border-bottom">
        </div>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th>序号</th>
            <th>歌单名</th>
            <th>操作</th>
        </tr>

        <volist name="list" id="vo">
            <c:forEach var="songlist" items="${songlistList}" varStatus="status">
                <tr>
                    <td><c:out value="${status.index+1}"></c:out></td>
                    <td><a href="/nationMusic_war_exploded/order/order_showSongFromList?listid=${songlist.listid}">
                        <c:out value="${songlist.listname}"></c:out></a></td>
                        <%--<td><a href="songlist_updateName?songlist.listid=${songlist.listid}">编辑名字</a></td>--%>
                    <td><a href="songlist_delSongList?songlist.listid=${songlist.listid}">删除</a></td>
                </tr>
            </c:forEach>
        </volist>
    </table>

</form>

</body>
</html>
