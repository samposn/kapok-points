<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>index</title>
    <style>
        @font-face {
            font-family: octicons-anchor;
            src: url(data:font/woff;charset=utf-8;base64,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) format('woff');
        }

        body {
            background-color: rgb(248, 248, 248);
        }

        .markdown-body {
            min-width: 200px;
            /*max-width: 760px;*/
            margin: 0 8rem;
            padding: 20px;

            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
            color: #333;
            overflow: hidden;
            font-family: "Helvetica Neue", Helvetica, "Segoe UI", Arial, freesans, sans-serif;
            font-size: 16px;
            line-height: 1.6;
            word-wrap: break-word;
        }

        .markdown-body a {
            background: transparent;;word-wrap: break-word; word-break: break-all;
        }

        .markdown-body a:active,
        .markdown-body a:hover {
            outline: 0;
        }

        .markdown-body strong {
            font-weight: bold;
        }

        .markdown-body h1 {
            font-size: 2em;
            margin: 0.67em 0;
        }

        .markdown-body img {
            border: 0;
        }

        .markdown-body hr {
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            height: 0;
        }

        .markdown-body pre {
            overflow: auto;
        }

        .markdown-body code,
        .markdown-body kbd,
        .markdown-body pre {
            font-family: monospace, monospace;
            font-size: 1em;
        }

        .markdown-body input {
            color: inherit;
            font: inherit;
            margin: 0;
        }

        .markdown-body html input[disabled] {
            cursor: default;
        }

        .markdown-body input {
            line-height: normal;
        }

        .markdown-body input[type="checkbox"] {
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 0;
        }

        .markdown-body table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .markdown-body td,
        .markdown-body th {
            padding: 0;
        }

        .markdown-body * {
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .markdown-body input {
            font: 13px/1.4 Helvetica, arial, freesans, clean, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
        }

        .markdown-body a {
            color: #4183c4;
            text-decoration: none;
        }

        .markdown-body a:hover,
        .markdown-body a:focus,
        .markdown-body a:active {
            text-decoration: underline;
        }

        .markdown-body hr {
            height: 0;
            margin: 15px 0;
            overflow: hidden;
            background: transparent;
            border: 0;
            border-bottom: 1px solid #ddd;
        }

        .markdown-body hr:before {
            display: table;
            content: "";
        }

        .markdown-body hr:after {
            display: table;
            clear: both;
            content: "";
        }

        .markdown-body h1,
        .markdown-body h2,
        .markdown-body h3,
        .markdown-body h4,
        .markdown-body h5,
        .markdown-body h6 {
            margin-top: 15px;
            margin-bottom: 15px;
            line-height: 1.1;
        }

        .markdown-body h1 {
            font-size: 30px;
        }

        .markdown-body h2 {
            font-size: 21px;
        }

        .markdown-body h3 {
            font-size: 16px;
        }

        .markdown-body h4 {
            font-size: 14px;
        }

        .markdown-body h5 {
            font-size: 12px;
        }

        .markdown-body h6 {
            font-size: 11px;
        }

        .markdown-body blockquote {
            margin: 0;
        }

        .markdown-body ul,
        .markdown-body ol {
            padding: 0;
            margin-top: 0;
            margin-bottom: 0;
        }

        .markdown-body ol ol,
        .markdown-body ul ol {
            list-style-type: lower-roman;
        }

        .markdown-body ul ul ol,
        .markdown-body ul ol ol,
        .markdown-body ol ul ol,
        .markdown-body ol ol ol {
            list-style-type: lower-alpha;
        }

        .markdown-body dd {
            margin-left: 0;
        }

        .markdown-body code {
            font: 12px Consolas, "Liberation Mono", Menlo, Courier, monospace;
        }

        .markdown-body pre {
            margin-top: 0;
            margin-bottom: 0;
            font: 12px Consolas, "Liberation Mono", Menlo, Courier, monospace;
        }

        .markdown-body kbd {
            background-color: #e7e7e7;
            background-image: -webkit-linear-gradient(#fefefe, #e7e7e7);
            background-image: linear-gradient(#fefefe, #e7e7e7);
            background-repeat: repeat-x;
            border-radius: 2px;
            border: 1px solid #cfcfcf;
            color: #000;
            padding: 3px 5px;
            line-height: 10px;
            font: 11px Consolas, "Liberation Mono", Menlo, Courier, monospace;
            display: inline-block;
        }

        .markdown-body>*:first-child {
            margin-top: 0 !important;
        }

        .markdown-body>*:last-child {
            margin-bottom: 0 !important;
        }

        .markdown-body .anchor {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            display: block;
            padding-right: 6px;
            padding-left: 30px;
            margin-left: -30px;
        }

        .markdown-body .anchor:focus {
            outline: none;
        }

        .markdown-body h1,
        .markdown-body h2,
        .markdown-body h3,
        .markdown-body h4,
        .markdown-body h5,
        .markdown-body h6 {
            position: relative;
            margin-top: 1em;
            margin-bottom: 16px;
            font-weight: bold;
            line-height: 1.4;
        }

        .markdown-body h1 .octicon-link,
        .markdown-body h2 .octicon-link,
        .markdown-body h3 .octicon-link,
        .markdown-body h4 .octicon-link,
        .markdown-body h5 .octicon-link,
        .markdown-body h6 .octicon-link {
            display: none;
            color: #000;
            vertical-align: middle;
        }

        .markdown-body h1:hover .anchor,
        .markdown-body h2:hover .anchor,
        .markdown-body h3:hover .anchor,
        .markdown-body h4:hover .anchor,
        .markdown-body h5:hover .anchor,
        .markdown-body h6:hover .anchor {
            height: 1em;
            padding-left: 8px;
            margin-left: -30px;
            line-height: 1;
            text-decoration: none;
        }

        .markdown-body h1:hover .anchor .octicon-link,
        .markdown-body h2:hover .anchor .octicon-link,
        .markdown-body h3:hover .anchor .octicon-link,
        .markdown-body h4:hover .anchor .octicon-link,
        .markdown-body h5:hover .anchor .octicon-link,
        .markdown-body h6:hover .anchor .octicon-link {
            display: inline-block;
        }

        .markdown-body h1 {
            padding-bottom: 0.3em;
            font-size: 2.25em;
            line-height: 1.2;
            border-bottom: 1px solid #eee;
        }

        .markdown-body h2 {
            padding-bottom: 0.3em;
            font-size: 1.75em;
            line-height: 1.225;
            border-bottom: 1px solid #eee;
        }

        .markdown-body h3 {
            font-size: 1.5em;
            line-height: 1.43;
        }

        .markdown-body h4 {
            font-size: 1.25em;
        }

        .markdown-body h5 {
            font-size: 1em;
        }

        .markdown-body h6 {
            font-size: 1em;
            color: #777;
        }

        .markdown-body p,
        .markdown-body blockquote,
        .markdown-body ul,
        .markdown-body ol,
        .markdown-body dl,
        .markdown-body table,
        .markdown-body pre {
            margin-top: 0;
            margin-bottom: 16px;
        }

        .markdown-body hr {
            height: 4px;
            padding: 0;
            margin: 16px 0;
            background-color: #e7e7e7;
            border: 0 none;
        }

        .markdown-body ul,
        .markdown-body ol {
            padding-left: 2em;
        }

        .markdown-body ul ul,
        .markdown-body ul ol,
        .markdown-body ol ol,
        .markdown-body ol ul {
            margin-top: 0;
            margin-bottom: 0;
        }

        .markdown-body li>p {
            margin-top: 16px;
        }

        .markdown-body dl {
            padding: 0;
        }

        .markdown-body dl dt {
            padding: 0;
            margin-top: 16px;
            font-size: 1em;
            font-style: italic;
            font-weight: bold;
        }

        .markdown-body dl dd {
            padding: 0 16px;
            margin-bottom: 16px;
        }

        .markdown-body blockquote {
            padding: 0 15px;
            color: #777;
            border-left: 4px solid #ddd;
        }

        .markdown-body blockquote>:first-child {
            margin-top: 0;
        }

        .markdown-body blockquote>:last-child {
            margin-bottom: 0;
        }

        .markdown-body table {
            display: block;
            width: 100%;
            overflow: auto;
            word-break: normal;
            word-break: keep-all;
        }

        .markdown-body table th {
            font-weight: bold;
        }

        .markdown-body table th,
        .markdown-body table td {
            padding: 6px 13px;
            border: 1px solid #ddd;
        }

        .markdown-body table tr {
            background-color: #fff;
            border-top: 1px solid #ccc;
        }

        .markdown-body table tr:nth-child(2n) {
            background-color: #f8f8f8;
        }

        .markdown-body img {
            max-width: 100%;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .markdown-body code {
            padding: 0;
            padding-top: 0.2em;
            padding-bottom: 0.2em;
            margin: 0;
            font-size: 85%;
            background-color: rgba(0,0,0,0.04);
            border-radius: 3px;
        }

        .markdown-body code:before,
        .markdown-body code:after {
            letter-spacing: -0.2em;
            content: "\00a0";
        }

        .markdown-body pre>code {
            padding: 0;
            margin: 0;
            font-size: 100%;
            word-break: normal;
            white-space: pre;
            background: transparent;
            border: 0;
        }

        .markdown-body .highlight {
            margin-bottom: 16px;
        }

        .markdown-body .highlight pre,
        .markdown-body pre {
            padding: 16px;
            overflow: auto;
            font-size: 85%;
            line-height: 1.45;
            background-color: #f7f7f7;
            border-radius: 3px;
        }

        .markdown-body .highlight pre {
            margin-bottom: 0;
            word-break: normal;
        }

        .markdown-body pre {
            word-wrap: normal;
        }

        .markdown-body pre code {
            display: inline;
            max-width: initial;
            padding: 0;
            margin: 0;
            overflow: initial;
            line-height: inherit;
            word-wrap: normal;
            background-color: transparent;
            border: 0;
        }

        .markdown-body pre code:before,
        .markdown-body pre code:after {
            content: normal;
        }

        .markdown-body .highlight {
            background: #fff;
        }

        .markdown-body .highlight .mf,
        .markdown-body .highlight .mh,
        .markdown-body .highlight .mi,
        .markdown-body .highlight .mo,
        .markdown-body .highlight .il,
        .markdown-body .highlight .m {
            color: #945277;
        }

        .markdown-body .highlight .s,
        .markdown-body .highlight .sb,
        .markdown-body .highlight .sc,
        .markdown-body .highlight .sd,
        .markdown-body .highlight .s2,
        .markdown-body .highlight .se,
        .markdown-body .highlight .sh,
        .markdown-body .highlight .si,
        .markdown-body .highlight .sx,
        .markdown-body .highlight .s1 {
            color: #df5000;
        }

        .markdown-body .highlight .kc,
        .markdown-body .highlight .kd,
        .markdown-body .highlight .kn,
        .markdown-body .highlight .kp,
        .markdown-body .highlight .kr,
        .markdown-body .highlight .kt,
        .markdown-body .highlight .k,
        .markdown-body .highlight .o {
            font-weight: bold;
        }

        .markdown-body .highlight .kt {
            color: #458;
        }

        .markdown-body .highlight .c,
        .markdown-body .highlight .cm,
        .markdown-body .highlight .c1 {
            color: #998;
            font-style: italic;
        }

        .markdown-body .highlight .cp,
        .markdown-body .highlight .cs {
            color: #999;
            font-weight: bold;
        }

        .markdown-body .highlight .cs {
            font-style: italic;
        }

        .markdown-body .highlight .n {
            color: #333;
        }

        .markdown-body .highlight .na,
        .markdown-body .highlight .nv,
        .markdown-body .highlight .vc,
        .markdown-body .highlight .vg,
        .markdown-body .highlight .vi {
            color: #008080;
        }

        .markdown-body .highlight .nb {
            color: #0086B3;
        }

        .markdown-body .highlight .nc {
            color: #458;
            font-weight: bold;
        }

        .markdown-body .highlight .no {
            color: #094e99;
        }

        .markdown-body .highlight .ni {
            color: #800080;
        }

        .markdown-body .highlight .ne {
            color: #990000;
            font-weight: bold;
        }

        .markdown-body .highlight .nf {
            color: #945277;
            font-weight: bold;
        }

        .markdown-body .highlight .nn {
            color: #555;
        }

        .markdown-body .highlight .nt {
            color: #000080;
        }

        .markdown-body .highlight .err {
            color: #a61717;
            background-color: #e3d2d2;
        }

        .markdown-body .highlight .gd {
            color: #000;
            background-color: #fdd;
        }

        .markdown-body .highlight .gd .x {
            color: #000;
            background-color: #faa;
        }

        .markdown-body .highlight .ge {
            font-style: italic;
        }

        .markdown-body .highlight .gr {
            color: #aa0000;
        }

        .markdown-body .highlight .gh {
            color: #999;
        }

        .markdown-body .highlight .gi {
            color: #000;
            background-color: #dfd;
        }

        .markdown-body .highlight .gi .x {
            color: #000;
            background-color: #afa;
        }

        .markdown-body .highlight .go {
            color: #888;
        }

        .markdown-body .highlight .gp {
            color: #555;
        }

        .markdown-body .highlight .gs {
            font-weight: bold;
        }

        .markdown-body .highlight .gu {
            color: #800080;
            font-weight: bold;
        }

        .markdown-body .highlight .gt {
            color: #aa0000;
        }

        .markdown-body .highlight .ow {
            font-weight: bold;
        }

        .markdown-body .highlight .w {
            color: #bbb;
        }

        .markdown-body .highlight .sr {
            color: #017936;
        }

        .markdown-body .highlight .ss {
            color: #8b467f;
        }

        .markdown-body .highlight .bp {
            color: #999;
        }

        .markdown-body .highlight .gc {
            color: #999;
            background-color: #EAF2F5;
        }

        .markdown-body .octicon {
            font: normal normal 16px octicons-anchor;
            line-height: 1;
            display: inline-block;
            text-decoration: none;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .markdown-body .octicon-link:before {
            content: '\f05c';
        }

        .markdown-body .task-list-item {
            list-style-type: none;
        }

        .markdown-body .task-list-item+.task-list-item {
            margin-top: 3px;
        }

        .markdown-body .task-list-item input {
            float: left;
            margin: 0.3em 0 0.25em -1.6em;
            vertical-align: middle;
        }
        table td{ word-wrap: break-word !important; word-break: break-all !important; }
        /*

        github.com style (c) Vasily Polovnyov <vast@whiteants.net>

        */

        .hljs {
            display: block;
            overflow-x: auto;
            padding: 0.5em;
            color: #333;
            background: #f8f8f8;
            -webkit-text-size-adjust: none;
        }

        .hljs-comment,
        .diff .hljs-header {
            color: #998;
            font-style: italic;
        }

        .hljs-keyword,
        .css .rule .hljs-keyword,
        .hljs-winutils,
        .nginx .hljs-title,
        .hljs-subst,
        .hljs-request,
        .hljs-status {
            color: #333;
            font-weight: bold;
        }

        .hljs-number,
        .hljs-hexcolor,
        .ruby .hljs-constant {
            color: #008080;
        }

        .hljs-string,
        .hljs-tag .hljs-value,
        .hljs-doctag,
        .tex .hljs-formula {
            color: #d14;
        }

        .hljs-title,
        .hljs-id,
        .scss .hljs-preprocessor {
            color: #900;
            font-weight: bold;
        }

        .hljs-list .hljs-keyword,
        .hljs-subst {
            font-weight: normal;
        }

        .hljs-class .hljs-title,
        .hljs-type,
        .vhdl .hljs-literal,
        .tex .hljs-command {
            color: #458;
            font-weight: bold;
        }

        .hljs-tag,
        .hljs-tag .hljs-title,
        .hljs-rule .hljs-property,
        .django .hljs-tag .hljs-keyword {
            color: #000080;
            font-weight: normal;
        }

        .hljs-attribute,
        .hljs-variable,
        .lisp .hljs-body,
        .hljs-name {
            color: #008080;
        }

        .hljs-regexp {
            color: #009926;
        }

        .hljs-symbol,
        .ruby .hljs-symbol .hljs-string,
        .lisp .hljs-keyword,
        .clojure .hljs-keyword,
        .scheme .hljs-keyword,
        .tex .hljs-special,
        .hljs-prompt {
            color: #990073;
        }

        .hljs-built_in {
            color: #0086b3;
        }

        .hljs-preprocessor,
        .hljs-pragma,
        .hljs-pi,
        .hljs-doctype,
        .hljs-shebang,
        .hljs-cdata {
            color: #999;
            font-weight: bold;
        }

        .hljs-deletion {
            background: #fdd;
        }

        .hljs-addition {
            background: #dfd;
        }

        .diff .hljs-change {
            background: #0086b3;
        }

        .hljs-chunk {
            color: #aaa;
        }


    </style>

    <style> @media print{ .hljs{overflow: visible; word-wrap: break-word !important;} }</style></head><body><div class="markdown-body">
    <h2 id="toc_0">WUYAOYAO 店规 2022年5月 修订版 -基于202108版本修正并完善</h2>

    <h3 id="toc_1">以下所有规定均以2022年5月1日后正式生效</h3>

    <h3 id="toc_2">*名词注解：全平台特指“文游”互动小说平台，</h3>

    <h3 id="toc_3">♥ 关于授权事宜</h3>

    <ol>
        <li>所有授权均自留2次。（作者本人+店铺自留。如无自留会注明,自留不会私售，共同监管。）</li>
        <li>特殊性质作品请联系授权素材原作签订合同，并商谈额外费用。（例：买断或线下印刷。）</li>
        <li>关于交易平台，如有画师上平台则通知各位到平台购买，平台购买请遵守平台规则。</li>
        <li>文字平台默认授权为同平台ID下3次，标注NPC时可不限次两种选择。道具场景不限，UI模板根据美工要求有标注。</li>
        <li>授权后的立绘等素材需在游戏里注明舞幺幺+素材作者署名。</li>
        <li>立绘、素材等都仅限于线上使用，印刷等其他商用需要咨询店主或者原作者。</li>
        <li>所有素材请严格依据公示宣图和许可范围内使用，版权与解释权归原作者所有。</li>
        <li>购买后不可更换平台更换ID，请谨慎登记。如需换平台ID可在有次数的情况下再次购买。登记全平台的作者，请登记所有平台的账号UID，不然后续无法进行核对转让。</li>
        <li>本店素材均不授权予小说平台，希望谅解。</li>
        <li>如有版号（包括正在申请中）或上架taptap、steam、方块游戏等正规游戏平台，请必须与原作者签订合同，并且支付双倍授权费用后方可使用。（限时/不限量/定制商品则不需要。）</li>
        <li>购买时必须如实登记，购买时赞助/代购需注明否则后续无法更改。</li>
        <li>关于工作室购买，未定情况下，可后续再来登记转工作室。超过5人的工作室则需要报备工作室账号和2名以上的成员信息。超过15人的制作组请按照第十条使用。</li>
    </ol>

    <h3 id="toc_4">♥ 关于定制事宜</h3>

    <ol>
        <li>新规实施后，与店员直接定制不计入累积消费，定制前需与店长登记核对后方可计入。</li>
        <li>定制前请双方核实档期、工期、流程、款向、要求等，店长作为第三方公证确认后，定金请交付于店长，成图后尾款可以交于画师或店长。</li>
        <li>其他突发情况可以联系店长处理。定制结束（14天后）一律视为跳过程序，不给予登记累积消费，如有留存相关订单记录，可以联系小助手登记消费。</li>
        <li>如不按照以上流程，双方交易出现任何定制时相关纠纷，店方概不处理。</li>
    </ol>

    <h3 id="toc_5">♥ 关于转让事宜</h3>

    <p>常驻在职店员的立绘CG特效/官车/授权/定制/限时可以转让。<br/>
        美工授权/所有福利/配乐/CV/道具素材/定制授权/不开放转让。<br/>
        高亮提醒：众筹车/限时仅限3年期限内可转让！超过3年时间不再开放转让。<br/>
        任何素材不可在购买的一个月内转让。<br/>
        新规实施后的上新可不退圈转让，需要未使用，但不可三转！<br/>
        （注解：三转的意思是，通过转让收到的素材不得再次转让！请谨慎收素材！）<br/>
        转让时需要与店长核对所有详细信息，不允许有高价收等扰乱市场价格行为。<br/>
        （QQ、UID/购买记录/是否使用记录等，如有出入则无法转让。）<br/>
        可以自行找作者对接下家（但必须与店长核对登记完毕后，方可转让。）<br/>
        官方可以帮忙群内掉落（但不保证有人收，如无人收则会放在专属的转让群相册。）<br/>
        转让成功的会有公示图片在群相册~如无公示图文，私下交易者请自行承担后果。<br/>
        请不要钻空子，否则永久黑名单！谢谢配合！<br/>
        不退圈转让需要V2以上，转让方扣除双倍积分。接转让方则获得原价积分。<br/>
        退圈转让则不需VIP资格。</p>

    <h3 id="toc_6">♥ 关于众筹车事宜</h3>

    <ol>
        <li>与本店店员发起的众筹车，车主需要与店长进行沟通报备相关事宜。
            开车需要上车人数与报备时人数过50%画师才正式开画（草稿），如超过2个月不满足人数则散车。开画后未付完定金画师有权利停画，收完定金再继续细化。</li>
        <li>完成报备事宜后，需要拉店长入群进行统一管理收款，车主协助登记宣传。</li>
        <li>店长收款，并统一打款给对应的店员，草图后付定正式开画，结车付尾款。（定金根据店员要求不一，尾款情况不同会根据相对应成图数量付款。）</li>
        <li>车主需要负责主要宣传，车主要求为签约作者（需要给出账号相关证明），并出大概设定，收集上车人员投票意见。积极配合开车等事宜，如消极开车，我们内部会有避雷名单。</li>
        <li>登记会统一在车内群共通核对，出现需要更改的情况请在结车前更改，逾期不候。</li>
        <li>不根据以上规定，众筹车出现其他问题概不负责。
            符合以上规定，且结车顺利，则为官车，可计入累积消费。官车会上传宣车图至群相册公示。</li>
    </ol>

    <blockquote>
        <p><strong>Tips：不要以收不齐人强制让画师剩余次数转授权，收款要超过85%才可以建立发货群发货，或者单件交全款发货。请大家不要盲目开车，消耗自己精力也消耗画师时间。</strong><br/>
            <strong>（除：店长开车已和画师事前沟通or车主垫付部分款向的情况下）</strong><br/>
            <strong>转授权时，会预留2周时间宣原价车票，2周后则为正常幅度授权涨价，不会超于35%。</strong><br/>
            <strong>跳车并且态度恶劣我们有权挂店铺黑名单，一直不付款到结车也无回复的进内部避雷名单。</strong></p>
    </blockquote>

    <p>店铺官车均与授权相同自留2次不含在车位里。</p>

    <h3 id="toc_7">♥ 关于加装事宜</h3>

    <p>本店所有常驻在职画师授权均可以店外加装定制。<br/>
        日系类所有不可使用通用加装，古现类可以通用加装。福利立绘不开放通用加装！<br/>
        注：只能同类加装，比如古不能与日系加，现不可与古加！<br/>
        同一画师的情况可以古现换装，但是加装不可！</p>

    <p><strong>名词注解：</strong></p>

    <ol>
        <li>店外加装指的是找本店以外的画师绘制服饰。</li>
        <li>同店换装指的的本店内同类型的立绘可以互相互换服饰。</li>
        <li>通用加装指的是找任意画师绘制服饰，此服饰可以用在任意一款立绘上。
            专属加装指的是找任意画师绘制服饰，此服饰只能用在A画师的立绘上。</li>
    </ol>

    <p><strong>在职店员相关</strong></p>

    <p>以下为常驻的在职店员名单和相关的付款码，特邀合作的店员不会在此公示。<br/>
        请不要相信私下小号冒充者的交易行为。谨防诈骗！<br/>
        如不是与以下公示方式交易，后果自负。</p>

    <p>老尾：478495342       柒月：791219097       烨流光：1109157328 <br/>
        花花：897064796       柔礼：1198303950      曦小妮：1249853724<br/>
        水薰：1875358806      秦风：908805764       狸子喵：934420811<br/>
        读条：2311992762      逐月兮：3531839745    八木黑狼：2634960199<br/>
        西方朔朔：1369067297   Pansy三色堇：2741984433 <br/>
        香辣鸡腿鲜虾堡：1432846568（浅井明音）</p>

    <h3 id="toc_8">♥ 关于其他补充</h3>

    <p><strong>关于印刷授权</strong></p>

    <p>所有授权定制默认不可商用印刷！例：明码标价 XX周边XX元出售！<br/>
        定制需要可商印刷时需要跟对应画师说明清楚！并且签订合同！<br/>
        谈好相应的事宜后，建议联系店长作为第三方在场认证。<br/>
        授权众筹限时等多人授权不允许印刷，如需自印留念送亲朋好友，需要咨询对应画师，并保证不能大量印刷，最好不要超过30数额。如一经发现有违规使用并牟利侵权传播等行为，画师本人有收回授权的权利并且索要相应的赔偿。</p>

    <p><strong>交易时注意事项与补充</strong></p>

    <p><strong>店员均有头衔，交易请认准有对应头衔的店员。</strong><br/>
        <strong>实习期的店员所有交易不计入累积消费，转正后则可补录累积消费。</strong></p>

    <p><strong>ID更换</strong></p>

    <p>购买任何素材时，只认购买时登记的ID与平台，全平台需要与店长登记所有平台账号信息。后续想更换平台时，需要进行本人身份信息核对，并且是同名ID，除此之外不得进行更换平台。希望理解！不可重复更换平台，例：橙光转闪艺，又从闪艺转橙光。</p>

    <p>赞助的情况，如购买时未报备，则只认登记时的ID信息。</p>

    <p>工作室的情况，如购买时未报备，只认登记时的ID信息，后续可以补充工作室信息，但需要进行核对素材使用情况。更换ID需要对应素材未使用过才可以更换！<br/>
        会有一个素材核对时间！不要随意转换平台！<br/>
        <strong>微博/B站/广播剧等其他平台（除小说平台，本店不授权于小说平台）不开放转平台功能。</strong></p>

    <p><strong>店铺登记系统功能介绍</strong></p>

    <p>系统上线后任何交易均需要与店长/助手录入对应信息才认可已购相关权限。<br/>
        不得查询其他顾客记录信息进行骚扰或其他非法行为，如发现一律永久黑名单。<br/>
        需要注意的登记事项：QQ+UID必须正确填写，请反复确认后提交，否则影响后续累消和授权权限。全平台作者请根据授权条例与店长如实登记，系统内只登记一个用作查询记录的即可。</p>

    <p>以后一律根据系统内的记录来计算累积消费，2021/08之前的消费记录需要有交易截图等信息才可补录，店铺会与对应的店员核实后录入！<br/>
        如有一切其他疑问请私信咨询~谢谢合作。</p>

    <div style="text-align:right;padding-top:100px;">
        <b>
            ·WUYAOYAO STUDIO·<br><br>

            2021年7月31日 拟定版时间<br>
            2021年8月5日  正式版时间<br>
            2022年5月1日  修订版时间<br><br>


            注：会陆续更新补充，可以共同监督。<br>
            如有觉得不妥的条款请积极反馈。谢谢合作~<br><br>

            店铺官方群：148330818 / 699463980<br>
            企鹅联系号：934420811 / 1369863163<br>
        </b>
    </div>

</div></body>

</html>

