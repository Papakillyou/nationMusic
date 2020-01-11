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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改项目</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="music_editMusic.action" enctype="multipart/form-data">
            <div  style="padding-left:20px ;padding-bottom: 20px;">
                <label>【修改音乐信息】</label>
            </div>
            <s:hidden name="music.musicid" value="%{music.musicid}"></s:hidden>
            <s:hidden name="music.path" value="%{music.path}"></s:hidden>
            <div class="form-group">
                <div class="label">
                    <label>歌名：</label>
                </div>
                <div class="field l10" >
                    <input type="text" class="input w100"  name="music.title" value="${music.title}" data-validate="required:请输入内容" />
                    <%--<s:textfield name="music.title" value="%{music.title}" label="歌名"></s:textfield>--%>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>歌手：</label>
                </div>
                <div class="field l10">
                    <input type="text" class="input w100" value="${music.singer}" name="music.singer" data-validate="required:请输入内容" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>描述：</label>
                </div>
                <div class="field l10">
                    <input type="text" class="input w50" value="${music.summary}" name="music.summary" data-validate="required:请输入内容" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>路径：</label>
                </div>
                <div class="field l10">
                    <input type="text" class="input w100" value="${music.path}" name="music.path" data-validate="required:请输入内容" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>民族：</label>
                </div>
                <div class="field l10">
                    <input type="text" class="input w50" value="${music.nation}" name="music.nation" data-validate="required:请输入内容" />
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

