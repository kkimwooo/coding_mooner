## 실행
python simple_server.py

## API 사용
```
$ curl -X POST -H "Content-type: application/json" -d '{"req":"hello world"}' http://localhost:4890/eng2kor
안녕하세요.

$ curl -X POST -H "Content-type: application/json" -d '{"req":"안녕하세요?"}' http://localhost:4890/kor2eng
Hi, how are you?
```