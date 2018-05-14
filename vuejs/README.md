
[参考](https://v1-jp.vuejs.org/guide/syntax.html)
- データバインディング構文
  - テキスト
```
<div id="app">
  {{ message }}
</div>


var app = new Vue({
  el: '#app',
  data: {
    message: '<span style="color: red">Hello Vue!</span>'
  }
})
```
    - 基本的に属性の展開には使わない

# ディレクティブ
  - 引数: v-bind
```
<a v-bind:href="url"></a>
<div id="app-2">
  <span v-bind:title="message">
    Hover your mouse over me for a few seconds
    to see my dynamically bound title!
  </span>
</div>
```

