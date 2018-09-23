# Dwango

## 型パラメータ
- インスタンス化するときに型を決定したいときに使う

## 共変
- Scalaでは何も指定しないなら、型パラメータは非変
```
// A=B
val : G[A] = G[B]
```

- **共変**は以下が許される
```
// AがBを継承
val : G[B] = G[A]
// クラス定義
class G[+A]
```

- 例
``` 
class Pair[+A, +B](val a: A, val b: B)
val pair: Pair[AnyRef, AnyRef] = new Pair[String, String]("foo", "bar")
``` 
つまり,+ついてたら、そのスーパークラスの型パラメータをもつ変数に代入可能

もし[A, B]ならerror: type mismatch
Anyはすべてのスーパークラス
Any -> AnyRef,AnyVal

## 反変
- **反変**は以下が許される
```
// AがBを継承
val : G[A] = G[B]
// クラス定義
class G[-A]
```

- 例
```
// x1に実際に入っているのはAnyRef => AnyRef型の値のため、引数としてString型の値を与えても成功
val x1: String => AnyRef = (x: AnyRef) => x

// エラー
val x1: AnyRef => AnyRef = (x: String) => (x:AnyRef)
```


## 上限境界
- 型パラメータがどのような型を継承しているかを指定する上限境界
```
// A,BにはShowを継承したクラスしか指定できない
class ShowablePair[A <: Show, B <: Show](val a: A, val b: B)
```

## 下限境界
- 型パラメータがどのような型のスーパタイプであるかを指定する
