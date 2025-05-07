const express = require('express');
const app = express();
const PORT = 3000;

// JSON 파싱 미들웨어
app.use(express.json());

// 정적 파일 폴더 설정 (선택)
app.use(express.static("public"));

// 자동차 리스트 (더미 데이터)
const carList = [
    {_id: "0001", name: "Sonata", price: 3000, year: 2020, company: "HYUNDAI"},
    {_id: "0002", name: "Grandeur", price: 3050, year: 2019, company: "HYUNDAI"},
    {_id: "0003", name: "Volvo", price: 4000, year: 2021, company: "VOLVO"},
    {_id: "0004", name: "Benz", price: 4500, year: 2022, company: "Mercedes"}
];

// RESTful API: 자동차 리스트와 사용자 정보 반환
app.get('/api/home', (req, res) => {
    const userData = {
        user: req.query.user || "홍길동",
        home: req.query.home || "서울"
    };

    res.status(200).json({
        userData,
        carList
    });
});

app.listen(PORT, () => {
    console.log(`REST API 서버 실행 중: http://localhost:${PORT}/api/home`);
});
