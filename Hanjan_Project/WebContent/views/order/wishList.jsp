<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기</title>
<style>
    .wish-wrap{
        display: block;
        max-width: 100%;
        margin: 0px auto 0;
    }
    .wish-subcontents{
        position: relative;
        max-width: 1300px;
        margin: 0px auto 0;
        min-height: 500px;
    }
    .path{
        display: none;
        overflow: hidden;
        height: 50px;
        line-height: 50px;
        border-bottom: 1px solid;
        position: relative;
        right: 0;
    }
    .titleArea{
        margin: 60px 0 40px;
        text-align: center;
        border-bottom: 0px solid;
    }
    .titleArea h2{
        display: inline-block;
        vertical-align: middle;
    }
</style>
</head>
<body>

    <div class="wish-wrap">
        <div class="wish-subcontents">
            <div class="path">
                <span>현재 위치</span>
                <ol>
                    <li>
                        <a href="#">홈</a>
                    </li>
                    <li>
                        <a href="#">마이쇼핑</a>
                    </li>
                    <li title="현재 위치">
                        <strong>관심상품</strong>
                    </li>
                </ol>
            </div>

            <div class="titleArea">
                <h2>찜 목록</h2>
            </div>

            <div>
                <table border="1" style="text-align: center; margin-left: auto; margin-right: auto;">
                    <caption>관심상품 목록</caption>
                    <colgroup>
                        <col style="width:27px;">
                        <col style="width:92px;">
                        <col style="width:autopx;">
                        <col style="width:105px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:85px;">
                        <col style="width:105px;">
                        <col style="width:110px;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">...</th>
                            <th scope="col">이미지</th>	
                            <th scope="col">상품정보</th>
                            <th scope="col">판매가</th>
                            <th scope="col">적립금</th>
                            <th scope="col">배송구분</th>
                            <th scope="col">배송비</th>
                            <th scope="col">합계</th>
                            <th scope="col">선택</th>
                        </tr>
                    </thead>
                    <tbody style="display: table-row-group; vertical-align :middle;">
                        <tr>
                            <td>
                                 1                      <!-- 순서 번호-->                       
                            </td>
                            <td class="thumb">
                                <a href="#"></a>        <!-- 이미지파일들어가야함-->
                            </td>
                            <td class="left">
                                <strong class="product-name"><a href="">스위트펀치</a></strong> <!--상품명-->
                                <ul>
                                    <li>

                                    </li>
                                </ul>
                            </td>
                            <td class="price right">?원</td> <!--상품가격-->
                            <td>
                                <span class="point">-</span>
                            </td>
                            <td>
                                <div>기본배송</div>
                            </td>
                            <td>
                                <span>3000원</span> <!-- 배송비는 3천원 고정-->
                            </td>
                            <td class="price right">?원</td>
                            <td class="button">
                                <a href="#" style="display: inline-block;">주문하기</a>
                                <a href="#" style="display: inline-block;">장바구니담기</a>
                                <a href="#" style="display: inline-block;">삭제하기</a>
                            </td>
                        </tr>
                       
                    </tbody>
                </table>
            </div>
            <br><br><br><br><br>
            <div class="wish-contents-btn" style="float: right;">
                <span>
                    <a href="#">전체상품주문</a>
                    <a href="#">비우기</a>
                </span>

            </div>
            






        </div>
    </div>

</body>
</html>