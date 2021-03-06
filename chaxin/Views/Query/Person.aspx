﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html class="no-js">

<head>

    <meta charset="UTF-8">

    <meta name="format-detection" content="telephone=no" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>查询结果</title>

    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <script src="/js/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" href="/css/lawMobile.css">
</head>

<body>

    <div class="cbody">

        <div class="result_details">

            <div class="header">

                <p>查询结果</p>
                <a class="ico-back" onclick="history.back()"></a>
            </div>
            <div style="margin: 15px;"></div>
            <div class="menudiv">
                <div class="law-result-wrap" id="page1">
                    <% 
                        if (ViewBag.ppList.Count != 0)
                        {
                            for (int i = 0, n = ViewBag.ppList.Count; i < n; i++)
                            {
                                var item = ViewBag.ppList[i] as DBC.PublicPerson;
                    %>
                    <div class="list-items">
                        <span class="lawIndex"><%=i+1 %></span>
                        <span class="ico-law-type ico-law-type2"></span>
                        <div class="list-items-text">
                            <p class="law-result-title"><%=item.Casecode %></p>
                            <p class="law-result-time"><%=item.PublishDate.ToChsString() %></p>
                        </div>
                        <span class="ico-arrow"></span>
                        <a class="btn-law-detail-href" href="/query/public/<%=item.ID %>"></a>
                    </div>
                    <%
                            }
                        }
                        else
                        {
                    %>
                    <div style="text-align: center; padding-top: 120px; font-size: 16px; color: #595757;">未查询到不良信用记录！</div>
                    <%
                        }
                    %>
                </div>

                 <div class="law-result-wrap" id="page2">
                    <% 
                        if (ViewBag.p2pList.Count != 0)
                        {
                            for (int i = 0, n = ViewBag.p2pList.Count; i < n; i++)
                            {
                                var item = ViewBag.p2pList[i] as DBC.P2PPerson;
                    %>
                    <div class="list-items">
                        <span class="lawIndex"><%=i+1 %></span>
                        <span class="ico-law-type ico-law-type2"></span>
                        <div class="list-items-text">
                            <p class="law-result-title"><%=item.Source%></p>
                            <p class="law-result-time"><%=item.LoanDate%></p>
                        </div>
                        <span class="ico-arrow"></span>
                        <a class="btn-law-detail-href" href="/query/p2p/<%=item.ID %>"></a>
                    </div>
                    <%
                            }
                        }
                        else
                        {
                    %>
                    <div style="text-align: center; padding-top: 120px; font-size: 16px; color: #595757;">未查询到不良信用记录！</div>
                    <%
                        }
                    %>
                </div>

                <div class="law-result-wrap" id="page3">
                    <% 
                        if (ViewBag.upList.Count != 0)
                        {
                            for (int i = 0, n = ViewBag.upList.Count; i < n; i++)
                            {
                                var item = ViewBag.upList[i] as DBC.ReportedPerson;
                    %>
                    <div class="list-items">
                        <span class="lawIndex"><%=i+1 %></span>
                        <span class="ico-law-type ico-law-type2"></span>
                        <div class="list-items-text">
                            <p class="law-result-title"><%=item.Arrears%></p>
                            <p class="law-result-time"><%=item.LoanDate%></p>
                        </div>
                        <span class="ico-arrow"></span>
                        <a class="btn-law-detail-href" href="/query/report/<%=item.ID %>"></a>
                    </div>
                    <%
                            }
                        }
                        else
                        {
                    %>
                    <div style="text-align: center; padding-top: 120px; font-size: 16px; color: #595757;">未查询到不良信用记录！</div>
                    <%
                        }
                    %>
                </div>
            </div>

            <div style="background-color:#fff;" class="menu">
                <ul data-menu-current-cur="menu-items-cur-total" id="lawHomeMenu" class="bottom-menu cbody">
                    <%
                        var pages = "";
                        if (ViewBag.ppList.Count != 0)
                            pages += "1,";
                        if (ViewBag.p2pList.Count != 0)
                            pages += "2,";
                        if (ViewBag.upList.Count != 0)
                            pages += "3";
                         %>
                    <li class="bottom-btn" data-page="<%=pages %>">
                        <p class="text-center menu-ico-wrap"><span class="ico-menu menu-ico1"></span></p>
                        <p class="text-center menu-text1">全部<span id="totalNum"><%=ViewBag.ppList.Count+ViewBag.p2pList.Count+ViewBag.upList.Count %></span></p>
                    </li>
                    <li  class="bottom-btn" data-page="1">
                        <p class="text-center menu-ico-wrap"><span class="ico-menu menu-ico2"></span></p>
                        <p class="text-center menu-text2">法律案件<span id="lawNum"><%=ViewBag.ppList.Count %></span></p>
                    </li>
                    <li  class="bottom-btn" data-page="2">
                        <p class="text-center menu-ico-wrap "><span class="ico-menu menu-ico3"></span></p>
                        <p class="text-center menu-text3">企业公示<span id="companyNum"><%=ViewBag.p2pList.Count %></span></p>
                    </li>
                    <li  class="bottom-btn" data-page="3">
                        <p class="text-center menu-ico-wrap"><span class="ico-menu menu-ico4"></span></p>
                        <p class="text-center menu-text4">私人曝光<span id="personalNum"><%=ViewBag.upList.Count %></span></p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $(".bottom-btn").click(function () {
                $(".bottom-btn").removeClass("menu-items-cur");

                var t = $(this);
                t.addClass("menu-items-cur");
                var dataPage = t.attr("data-page");
                var pages = dataPage.split(',');

                $(".law-result-wrap").hide();
                for (var i = 0; i < pages.length; i++) {
                    $("#page" + pages[i]).show();
                }
            });

            $(".bottom-btn:eq(0)").click();
        })
    </script>
</body>

</html>
