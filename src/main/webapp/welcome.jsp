<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<link href="css/welcome.css" rel="stylesheet" type="text/css">
<head>
    <title>欢迎</title>

</head>
<style>
    img{
        position: fixed;
        right: 0px;
        bottom: 0px;
        min-width: 100%;
        min-height: 100%;
        height: auto;
        width: auto;
        z-index:-11
    }
</style>
<body OnLoad="swapPic()">
<script language="javascript" type="text/javascript">
    var ranl = 0;
    var useRand = 0;
    images = new Array;
    images[1] = new Image();
    images[1].src = "images/2.jpg";
    images[2] = new Image();
    images[2].src = "images/3.jpg";
    function swapPic(){
        var imgnum = images.length-1;
        do{
            var randnum = Math.random();
            randl = Math.round((imgnum-1)*randnum)+1;
        }while(randl==useRand);
        useRand = randl;
        document.randimg.src = images[useRand].src
        setTimeout('swapPic()',2000);
    }
</script>
<img name ="randimg" src="images/2.jpg"></img>
<div class="navbar">
    <a href=login.php class="logo">民族音乐</a>
    <ul class="nav">
        <li><a href="#"></a></li>
        <li><a href="#"></a></li>
        <li><a href="#"></a></li>
        <li><a href="#"></a></li>
    </ul>
    <ul class="nav1">
        <li><a href=login.jsp>登录</a></li>
        <li>|</li>
        <li><a href=reg.php>注册</a></li>
    </ul>
</div>
</body>
</html>
