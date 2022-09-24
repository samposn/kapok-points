<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WUYAOYAO STUDIO</title>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/favicon.ico" />

    <link rel="stylesheet" href="${ctx}/resources/css/points/style.css">
    <style>
        footer a {
            color: white;
            text-decoration: underline;
        }
    </style>


</head>
<body>
<header class="header">
    <div class="menu">
        <button id="menu-btn">菜单</button>
    </div>
    <div class="title">
        <span></span>
        <h1>WUYAOYAO STUDIO</h1>
        <span></span>
    </div>
</header>
<main>
    <aside class="sidebar">
        <div>
            <button id="close-btn">关闭</button>
        </div>
        <div class="link-items">
            <a data-panel-id="query-form" class="link-item active" href="javascript:void(0);">
                <h2>积分查询<br>Integral query</h2>
            </a>
            <a></a>
            <a data-panel-id="last-release" class="link-item" href="javascript:void(0);">
                <h2>最新发布<br>The latest release</h2>
            </a>
            <a data-panel-id="qr-code" class="link-item" href="javascript:void(0);">
                <h2>小店入口<br>Store QR code</h2>
            </a>
            <a data-panel-id="auth-info" class="link-item" href="javascript:void(0);">
                <h2>授权须知<br>Authorization info</h2>
            </a>
        </div>
    </aside>
    <section class="panels">
        <div id="query-form" class="panel active">
            <form class="query-form-container" action="">
                <div class="input-container">
                    <label for="record_qq">QQ</label>
                    <input class="form-control" id="record_qq" placeholder="QQ">
                </div>
                <div class="button-container">
                    <button type="button" onclick="query('${ctx}');">查询</button><button type="reset">重置</button>
                </div>
            </form>
        </div>
        <div id="last-release" class="panel">
            <div class="last-release-container">
                <div class="last-release-item item-1">
                    <img src="${ctx}/resources/images/points/1.png" alt="1">
                </div>
                <div class="last-release-item item-2">
                    <img src="${ctx}/resources/images/points/2.png" alt="2">
                </div>
                <div class="last-release-item item-3">
                    <img src="${ctx}/resources/images/points/3.png" alt="3">
                </div>
            </div>
        </div>
        <div id="qr-code" class="panel">
            <div class="qr-code-container">
                <div class="qr-code-item">
                    <img src="${ctx}/resources/images/points/qrcode/wuyaoyaoqun2.jpg" alt="wuyaoyao">
                    <p>一群已满请入二群</p>
                    <p>预告/特殊福利/众筹等一手消息仅群内分享</p>
                </div>
                <div class="qr-code-item">
                    <img src="${ctx}/resources/images/points/qrcode/weidiangoumai.jpg" alt="weidiangoumai">
                    <p>微店购买</p>
                    <p>无需人工不需社交网盘链接提货</p>
                </div>
                <div class="qr-code-item">
                    <img src="${ctx}/resources/images/points/qrcode/taobaozhuanpai.jpg" alt="taobaozhuanpai">
                    <p>淘宝专拍</p>
                    <p>此处无上新只用于定制专拍与代售</p>
                </div>
            </div>
        </div>
        <div id="auth-info" class="panel">
            <iframe src="${ctx}/authInfo" class="auth-info-container"></iframe>
        </div>
    </section>
</main>
<footer>
    <h3><span><a href="https://beian.miit.gov.cn/" target="_blank">粤ICP备 2022046370号</a></span><span><a href="https://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44172302000106" target="_blank">粤公安网备 44172302000106号</a></span></h3>
</footer>

<script src="${ctx}/resources/js/jquery@3.6.0/jquery-3.6.0.min.js"></script>
<script src="${ctx}/resources/js/points/main.js"></script>
</body>
</html>
