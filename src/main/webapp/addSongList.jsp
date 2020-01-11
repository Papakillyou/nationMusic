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
    <title></title>
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/pintuer.css">
    <link rel="stylesheet" href="/nationMusic_war_exploded/css/admin.css">
    <script src="/nationMusic_war_exploded/js/jquery.js"></script>
    <script src="/nationMusic_war_exploded/js/pintuer.js"></script>

</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>新增项目</strong></div>
    <div class="body-content">
        <form method="post" class="form-x"  action="songlist_addSongList.action" enctype="multipart/form-data">
            <div  style="padding-left:20px ;padding-bottom: 20px;">
                <label>【创建新歌单】</label>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>歌单名称：</label>
                </div>
                <div class="field l10" >
                    <input type="text" class="input w100" value="" name="songlist.listname" data-validate="required:请输入内容" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group" style="padding: 30px 300px;">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" name="Submit" value="提 交">提 交</button>
                    <button class="button bg-main icon-check-square-o" type="reset" >重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>