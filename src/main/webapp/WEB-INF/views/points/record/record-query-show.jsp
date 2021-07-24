<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${system_name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${ctx}/resources/css/record-query.css">
    <style>
        .container-fluid {
            width: 90%;
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
            width: 22rem;
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
        .page-num {
            width: 3rem;
            height: 1.5rem;
            border: 1px solid rgb(160, 160, 160);
            border-radius: 1rem;
            background-color: rgb(185, 185, 185);
            outline: none;
        }

        .tips {
            color: #eeeeee;
        }
    </style>
</head>

<body>
<div class="container-fluid">
	<div class="row">
    <div class="col-md-12 col-lg-12 tips"><p class="d-inline">Tips：因手工录入，如有遗漏、错误。状态异常等情况联系店长、小助手。</p><p class="d-inline float-end">总积分：9999</p></div>
</div>
<div class="row">
    <main class="col-md-12 col-lg-12">
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
                    <th>状态</th>
                </tr>
            </thead>
            <tbody>
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
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>易次元</td>
                    <td>123456789000</td>
                    <td>123456789000</td>
                    <td>商品多少个字至少给这么多位置吧</td>
                    <td>222</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,002</td>
                    <td>placeholder</td>
                    <td>irrelevant</td>
                    <td>visual</td>
                    <td>layout</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,003</td>
                    <td>data</td>
                    <td>rich</td>
                    <td>dashboard</td>
                    <td>tabular</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,003</td>
                    <td>information</td>
                    <td>placeholder</td>
                    <td>illustrative</td>
                    <td>data</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,004</td>
                    <td>text</td>
                    <td>random</td>
                    <td>layout</td>
                    <td>dashboard</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,005</td>
                    <td>dashboard</td>
                    <td>irrelevant</td>
                    <td>text</td>
                    <td>placeholder</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,006</td>
                    <td>dashboard</td>
                    <td>illustrative</td>
                    <td>rich</td>
                    <td>data</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,007</td>
                    <td>placeholder</td>
                    <td>tabular</td>
                    <td>information</td>
                    <td>irrelevant</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,008</td>
                    <td>random</td>
                    <td>data</td>
                    <td>placeholder</td>
                    <td>text</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,009</td>
                    <td>placeholder</td>
                    <td>irrelevant</td>
                    <td>visual</td>
                    <td>layout</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>1,010</td>
                    <td>data</td>
                    <td>rich</td>
                    <td>dashboard</td>
                    <td>tabular</td>
                    <td>222</td>
                    <td>222</td>
                    <td>？</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
    				<td colspan="9" class="container">
                        <div class="row justify-content-center">
                            <div class="col-6 text-center">
                                <div class="page-panel">
                                    <a href="#"><i class="bi bi-skip-backward-fill"></i></a>&nbsp;&nbsp;
                                    <a href="#"><i class="bi bi-skip-start-fill"></i></a>&nbsp;&nbsp;
                                    第&nbsp;&nbsp;<input class="page-num text-center" value="8" />&nbsp;&nbsp;页&nbsp;&nbsp;共&nbsp;&nbsp;99&nbsp;&nbsp;页&nbsp;&nbsp;
                                    <a href="#"><i class="bi bi-skip-end-fill"></i></a>&nbsp;&nbsp;
                                    <a href="#"><i class="bi bi-skip-forward-fill"></i></a>
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
	<footer class="mt-3 col-md-12 col-lg-12 text-center">
		<a href="${ctx}/record/query" class="btn btn-md">返回</a>
	</footer>
  </div>
</div>

    <script src="https://unpkg.com/vue@3.1.4/dist/vue.global.prod.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

    <script type="text/javascript">
    </script>
</body>

</html>