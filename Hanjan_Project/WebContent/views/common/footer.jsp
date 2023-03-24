<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터</title>
<style>
    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    }

    div{
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
    }

    .footer{
        width: 100%;
        padding: 30px 20px 50px;
        background: white;
        border-top: 1px solid rgb(224, 224, 224);
    }

    .footer-inner{
        width: 100%;
        max-width: 1144px;
        margin: 0px auto;
    }

    .footer-inner .flex{
        display: flex;
    }

    .footer-inner .justify-between {
    -webkit-box-pack: justify;
    justify-content: space-between;
    }

    .footer-subDescription{
        height: 100%;
        color: rgb(62, 62, 62);
        font-size: 12px;
    }

    .footer-subDescription .company{
        margin-bottom: 16px;
        font-weight: bold;
        font-size: 16px;
        line-height: 16px;
        word-break: keep-all;
    }

    .footer-subDescription p:nth-child(2) {
        margin-bottom: 8px;
    }

    .footer-subDescription .call{
        font-size: 11px;
        line-height: 11px;
    }
    
    .footer-inner2{
        margin: 10px 0px;
        display: flex;
        font-weight: bold;
        font-size: 12px;
        line-height: 12px;
    }

    .footer-inner2 a{
        margin-right: 20px;
        color: (62, 62, 62);
    }

    .footer-inner3{
        width: 100%;
        color: rgb(112, 112, 112);
        font-size: 12px;
        line-height: 21px;
    }

    .footer-inner .flex{
        display: flex;
    }

    .footer-inner3 .flex{
        flex-wrap: wrap;
    }
    
    .footer-inner3 #flex2{
        flex-wrap: wrap;
        margin-top: -27px;
    }
    
    .footer-inner3 .h-1{
        margin-right: 12px;
    }

    .footer-inner3 .h-2{
        margin-right: 15px;
    }

    .footer-inner3 .nicepay{
        /* margin-top: 10px; */
        color: rgb(178, 178, 178);
    }

    .footer-inner3 .nicepay p{
        line-height: 17px;
        margin-top: 0px;
        margin-bottom: 0px;
    }

</style>
</head>
<body>
    
    <div class="footer">
        <div class="footer-inner">
            <div class="flex justify-between">
                <div class="footer-subDescription">
                    <p class="company">한잔컴퍼니 주식회사</p>
                    <p class="call">고객센터: 1544-9970 </p>
                    <p>평일 09:00 - 18:00, 주말 휴무</p>
                </div>
            </div>
            
            <div class="footer-inner2">
                <a>이용약관</a>
                <a>개인정보처리방침</a>
                <a>입점문의</a>
                <a>기업구매</a>
            </div>

            <div class="footer-inner3">
                <div class="flex">
                    <p class="h-1">대표 : 신경호</p>
                    <p class="h-2">사업자등록번호: 620-81-58299</p>
                    <p>통신판매신고번호 : 1234-c강의실-5678</p>
                </div>
                <div class="flex" id="flex2">
                    <p class="h-1">주소 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</p>
                    <p class="h-2">정보보호 책임자 : 신킹호</p>
                    <p class="h-1">대표전화 : 1234-5678</p>
                    <p class="h-1">이메일 : info@hanjan.com</p>
                </div>
                <div class="nicepay">
                    <p>술렁술렁은 통신판매중개자로서 통신판매 당사자가 아니며,
                    판매자가 등록한 상품정보 및 거래에 대해 술렁술렁은 책임을 지지 않습니다.</p>
                    <p>고객님의 안전거래를 위해 현금 등으로 결제 시
                    저희 쇼핑몰에서 가입한 NICE구매안전 (에스크로) 서비스를 이용하실 수 있습니다.</p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>