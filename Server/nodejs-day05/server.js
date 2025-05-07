const http = require("http");
const express = require("express");
const app = express();
const { Server } = require("socket.io");
const path = require("path");
const router = express.Router();

app.set("port", 3000);

app.use("/", express.static(path.join(__dirname, "public")));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

router.get("/home", (req, res) => {
  //   req.app.render("home", {}, (err, html) => {
  //     if (err) throw err;
  //     res.end(html);
  //   });
  res.render("home", {});
});

app.use("/", router);
const httpServer = http.createServer(app);
httpServer.listen(app.get("port"), () => {
    console.log(`서버 실행 중 http://localhost:${app.get("port")}`);
});
const io = new Server(httpServer);
io.sockets.on("connection", (socket) => {
  console.log("새 클라이언트 소켓이 접속 됨!");
  // console.log("current connetion socket info: ", socket.request);
  // 클라이언트 소켓에 메세지 보내기 (emit)
  socket.emit("welcome message", "welcome to server socket!");

  // 클라이언트 메세지를 받을 준비 (대기) 이벤트 핸들러.
  socket.on("message", (data) => {
    console.log(data);
  });
});