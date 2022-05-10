<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=0.5, minimum-scale=0.5">
    <title>${system_name}</title>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/favicon.ico" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${ctx}/resources/css/record-query.css">
    <style>
        .container-fluid {
            min-width: 64rem;
            padding-top: 2.5rem;
        }

        .table-container {
            padding: 2rem 2rem 0;
            background-image: linear-gradient(rgb(196, 196, 196), rgb(175, 175, 175));
            border-radius: 1rem;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead {
            border-radius: 3rem;
            box-shadow: 0 2px 4px 1px rgba(0, 0, 0, 0.5);
        }

        .table thead th:first-child {
            border-top-left-radius: 3rem;
            border-bottom-left-radius: 3rem;
        }

        .table thead th:last-child {
            border-top-right-radius: 3rem;
            border-bottom-right-radius: 3rem;
        }

        .table thead th {
            border: none;
            background-image: linear-gradient(rgb(216, 216, 216), rgb(166, 166, 166));
        }

        .table tbody tr:first-child {
            height: 1rem;
            border: none;
        }

        .table tbody tr {
            height: 2.75rem;
            border-bottom: 1px rgb(160, 160, 160) solid;
        }

        .table tbody tr:not(:first-child):hover {
            background-color: #a9a9a9;
        }

        .table tbody td {
            border: none;
        }

        .table tfoot tr {
            height: 4rem;
        }

        .table tfoot td {
            border: none;
        }

        .page-panel {
            width: 24rem;
            margin: 0 auto;
            padding: 0.25rem 0;
            border-radius: 1rem;
            box-shadow: 0 2px 4px 1px rgba(0, 0, 0, 0.5);
            background-image: linear-gradient(rgb(216, 216, 216), rgb(166, 166, 166));
        }

        .page-panel a {
            color: rgb(120, 120, 120);
        }

        .page-panel a:hover {
            color: rgb(100, 100, 100);
        }

        .page-select,
        .page-num {
            width: 3rem;
            height: 1.5rem;
            border: 1px solid rgb(160, 160, 160);
            border-radius: 1rem;
            background-color: rgb(185, 185, 185);
            outline: none;
        }

        .page-select {
            width: 3.5rem;
        }

        .tips {
            color: #eeeeee;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 tips"><p class="d-inline">Tips：因手工录入，如有遗漏、错误。状态异常等情况联系店长、小助手。</p>
            <p class="d-inline float-end">总积分：<span class="total-points"></span></p></div>
    </div>
    <div class="row">
        <main class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="table-container">
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>平台</th>
                        <th>UID</th>
                        <th>QQ</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>获取积分</th>
                        <th>扣除积分</th>
                        <th>版权方</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody id="dataTableBody">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="11" class="container">
                            <div class="row justify-content-center">
                                <div class="col-6 text-center">
                                    <div class="page-panel">
                                        <a href="javascript:void(0)" onclick="first()"><i
                                                class="bi bi-skip-backward-fill"></i></a>&nbsp;&nbsp;
                                        <a href="javascript:void(0)" onclick="previous()">
                                            <i class="bi bi-skip-start-fill"></i></a>&nbsp;&nbsp;
                                        第&nbsp;&nbsp;<input class="page-num text-center" id="currentPage"/>&nbsp;&nbsp;页&nbsp;&nbsp;共&nbsp;&nbsp;<span class="total-page"></span>&nbsp;&nbsp;页&nbsp;&nbsp;
                                        <a href="javascript:void(0)" onclick="next()"><i
                                                class="bi bi-skip-end-fill"></i></a>&nbsp;&nbsp;
                                        <a href="javascript:void(0)" onclick="last()"><i
                                                class="bi bi-skip-forward-fill"></i></a>&nbsp;&nbsp;
                                        <select class="page-select ">
                                            <option value="10">10</option>
                                            <option value="15">15</option>
                                            <option value="25">25</option>
                                            <option value="30">30</option>
                                            <option value="35">35</option>
                                            <option value="40">40</option>
                                            <option value="45">45</option>
                                            <option value="50">50</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </main>
    </div>
    <div>
        <footer class="mt-5 col-12 text-center">
            <a href="${ctx}/" class="btn btn-md">返回</a>
        </footer>
    </div>
</div>

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

<script type="text/javascript">

    let qq;
    let currentPage = 1;
    let totalPage = 0;
    let rows = 10;
    let noData = '<tr><td colspan="9" class="text-center">没有找到数据，请核准账户信息！</td></tr>';

    $(function () {
        qq = '${qq}';

        if (!qq) {
            $('#dataTableBody').append(noData);
        } else {
            loadData(currentPage);
        }

        $(".page-num").blur(function(e) {
            let page = $(e.target).val();
            currentPage = Number(page < 1 ? 1 : page > totalPage ? totalPage : page);
            loadData(currentPage);
        });

        $(".page-select").change(function(e) {
            rows = $(e.target).val();
            currentPage = 1;
            loadData(currentPage);
        });
    });

    function first() {
        currentPage = 1;
        loadData(currentPage);
    }

    function previous() {
        if (currentPage === 1) {
            alert('已经是第一页');
            return;
        }
        currentPage -= 1;
        loadData(currentPage);
    }

    function next() {
        console.log('currentPage', currentPage);
        console.log('totalPage', totalPage);
        if (currentPage === totalPage) {
            alert('已经是最后一页');
            return;
        }
        currentPage += 1;
        loadData(currentPage);
    }

    function last() {
        currentPage = totalPage;
        loadData(currentPage);
    }

    function loadData(page) {
        $.ajax({
            type: "GET",
            url: "${ctx}/record/search",
            data: {
                q_record_qq_EQ: qq,
                page: page,
                rows: rows
            }
        }).done(function (res) {
            if (res.resultCode === 0) {
                $('.row-data').remove();
                if (res.total === 0) {
                    $('#dataTableBody').append(noData);
                    $('#currentPage').val(0);
                    $('.total-page').text(0);
                    $('.total-points').text(0);
                } else {
                    res.rows.forEach(element => insertRow(element));
                    totalPage = Math.ceil(res.total / rows);
                    $('#currentPage').val(page);
                    $('.total-page').text(totalPage);
                    $('.total-points').text(res.totalPoints);
                }
            } else {
                alert(res.resultMsg);
            }
        });
    }

    function insertRow(row) {
        let rowData = '<tr class="row-data">' +
            '<td></td>' +
            '<td>' + (row.record_platform||'') + '</td>' +
            '<td>' + (row.record_uid||'') + '</td>' +
            '<td>' + (row.record_qq||'') + '</td>' +
            '<td>' + (row.product_name||'') + '</td>' +
            '<td>' + (row.record_price||'') + '</td>' +
            '<td>' + (row.record_add_points||'') + '</td>' +
            '<td>' + (row.record_minus_points||'') + '</td>' +
            '<td>' + (row.product_copyright||'') + '</td>' +
            '<td>' + (row.product_status||'') + '</td>' +
            '</tr>';
        $('#dataTableBody').append(rowData);
    }

</script>
</body>

</html>