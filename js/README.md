- 無名関数
```
var hello = function(){console.log("hello")}
```
- 即時関数
```
(function(){
  var x =10,
      y = 20;
      console.log(x+y)
      })();
```
- タイマー処理
  - setInterval:前の処理の終了にかかわらず実行を繰り返す
  - setTimeout:前の処理が終わってから1回だけ
```
var i = 0;
function show() {
    console.log(i++);
    var tid = setTimeout(function() {
        show();
    }, 1000);
    if (i > 3) {
        clearTimeout(tid); # 指定されたID解除
    }
}
show();
```

- オブジェクト
  - メンバ：値
    - オブジェクト > プロパティ
```

var user = {
    email: "taguchi@gmail.com", // プロパティ
    score: 80,
    greet: function(name) { // メソッド
        console.log("hello, " + name + " from " + this.email); # thisはオブジェクトの他プロパティにアクセスできる
    }
};
// var user = new Object({~})
user.greet("Tom");
```

- Array
```
var a = new Array(100, 300, 200);
// var a = [100, 300, 200];
console.log(a.length);
// unshift -> array <- push
// shift   <- array -> pop
a.push(500);
console.log(a);
a.splice(1, 2, 800, 1000);
console.log(a);
```

- Math , Date

```
console.log(Math.PI);
console.log(Math.ceil(5.3));
console.log(Math.floor(5.3));
console.log(Math.round(5.3));
console.log(Math.random());

var d = new Date();
// var d = new Date(2014, 1, 11, 10, 20, 30);
console.log(d.getFullYear());
console.log(d.getMonth());
console.log(d.getTime()); // 1970/1/1 
```

- EventLisner
```
document.getElementById('add').addEventListener('click', function() {
    var greet = document.createElement('p'),
        text = document.createTextNode('hello world');
    document.body.appendChild(greet).appendChild(text);
});
```
