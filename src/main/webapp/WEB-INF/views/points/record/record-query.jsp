<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${system_name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${ctx}/resources/css/record-query.css">
    <style>
        body {
            display: flex;
            align-items: center;
        }

        .form-signin {
            width: 100%;
            max-width: 500px;
            margin: auto;
        }

        .form-signin label {
            color: white;
            line-height: 2rem;
        }

        .form-control {
            border-radius: 3rem;
            height: 2rem;
            border: 1px solid rgb(255, 218, 146);
        }

        .form-control:focus {
            border: 1px solid rgb(238, 188, 91);
        }

        .title {
            color: white;
            font-family: serif;
            text-align: center;
        }

        .title p {
            font-size: 3.25rem;
            letter-spacing: .25rem;
        }

        .title p span {
            font-size: 1.5rem;
            display: block;
            padding-left: 28rem;
        }

        .tips {
            font-style: italic;
        }

        .invalid {
            border: 2px dashed rgb(255, 0, 0);
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-6 title">
            <p>WUYAOYAO STUDIO<span>授权查询</span></p>
        </div>
    </div>
    <div class="mt-5">&nbsp;</div>
    <div class="row">
        <main class="form-signin">
            <form>
                <div class="row">
                    <div class="col-2">
                        <label for="record_qq">QQ</label>
                    </div>
                    <div class="col-10">
                        <input class="form-control" id="record_qq">
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-2">
                        <label for="record_uid">UID</label>
                    </div>
                    <div class="col-10">
                        <input class="form-control" id="record_uid">
                    </div>
                </div>
                <div class="mt-3">&nbsp;</div>
                <div class="text-center mt-5">
                    <a class="btn btn-md" onclick="submit()">查询</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="reset" class="btn btn-md">重置</button>
                </div>
            </form>
        </main>
    </div>
    <div class="row position-absolute bottom-0 start-0 ms-5">
        <p class="text-muted tips">
            官 方 Q 群：&nbsp;&nbsp;&nbsp;&nbsp;1 4 8 3 3 0 8 1 8&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;6 9 9 4 6
            3 9 8 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;店 长 热 线：&nbsp;&nbsp;&nbsp;&nbsp;9 3 4 4 2
            0 8 1 1
        </p>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<script type="text/javascript">

    $(function()  {
        $("input").blur(function(e){
            check($(e.target));
        });
    });

    function submit() {
        if (check($("input"))) {
            let qq = $("#record_qq").val();
            let uid = $("#record_uid").val();
            $(window).attr('location','${ctx}/record/query/show/'+qq+'/'+uid);
        }
    }

    function check(input) {
        let isCheck = true;
        input.each(function(i, e) {
            if ($(e).val()) {
                $(e).removeClass("invalid");
                isCheck = true;
            } else {
                $(e).addClass("invalid");
                isCheck = false;
            }
        });
        return isCheck;
    }
</script>
</body>
</html>