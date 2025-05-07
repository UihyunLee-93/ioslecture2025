// var : 변수 선언 키워드 (JS 방식)
// let : 변수 선언 키워드 (ES6 방식 - ECMAScript 2015)
// const : 상수 선언 키워드 (ES6 - ECMAScript 2015), 중간에 값 변경 불가능.
// 타입 추론이 되기 때문에 값의 타입에 따라 변수의 타입이 결정된다.
// var 변수명 = 값
// let 변수명 = 값
// const 상수명 = 상수값
// 함수 선언의 2가지 방법: function 선언 방식(JS), 화살표 선언 방식(ES6)
// function 함수명(매개변수 ...) {
//     처리 문장;
//     return 반환값;
// }

// 문자열 표시는 쌍따옴표, 홑따옴표 모두 가능.
// 문자열 사용 예시
var title = '이것은 자바스크립트 "문자열"이다';
var tag = '<a href="http://naver.com">네이버</a>'

// 모듈을 불러 온다.
const http = require('http');
const url = require('url');

// 함수를 변수에 참조 시키다. 
const app = function (request, response) {
    var greeting = 'Hello World!';
    var q = url.parse(request.url, true)
    var qData = q.query;

    response.writeHead(200, {'Content-Type': 'text/html; charset=UTF-8'});

    if(request.url != '/favicon.ico') {
        //console.log(q.pathname: ${q.pathname})
        console.log(qData)
        if (q.pathname == '/') {
            greeting = 'Hello World!';
        } else if(q.pathname == '/home') {
            //greeting = pagetName: home page, user:${qData.user}
            greeting = ${qData.user}님 환영합니다. 이것은 ${q.pathname}입니다.
        } else if(q.pathname  == '/profile') {
            greeting = 'profile page'
        } else if(q.pathname  == '/gallery') {
            greeting = 'gallery page'
        } else if(q.pathname  == '/shop') {
            greeting = 'shop page'
        }
    }
    response.end(greeting);
}

const server = http.createServer(app);
server.listen(3000, function() {
    console.log("Nodejs 서버 실행 중>>> http://localhost:3000")
});