# リーダブルコード

## 開発言語

- ruby

## Usage

```sh
$ git clone https://github.com/dai---chi/dai---chi-sezemi-2014-readable-code-1
$ cd dai---chi-sezemi-2014-readable-code-1
```

### spec3-5

```sh
$ cat recipe-data.txt
オムライス
親子丼
杏仁豆腐
$ ruby recipe.rb recipe-data.txt
1: オムライス
2: 親子丼
3: 杏仁豆腐
```

### spec6-7

```sh
$ ruby recipe.rb recipe-data.txt 2
2: 親子丼
$ ruby recipe.rb recipe-data.txt
1: オムライス
2: 親子丼
3: 杏仁豆腐
```

### spec8-11

入力ファイルはN個指定できる。
各入力ファイルの先頭1行にはユーザー名を記述する。
また，引数の末尾2個はそれぞれユーザーIDとレシピIDであり，それぞれ-1を入れることで未指定にできる。

spec8-11に対応した時点でspec7以前の仕様は満たさなくなっているので注意すること。

```sh
$ cat recipe-data1.txt
kou
オムライス http://cookpad.com/recipe/2653946
親子丼 http://cookpad.com/recipe/2657882
杏仁豆腐 http://cookpad.com/recipe/2654398
$ ruby recipe.rb recipe-data1.txt recipe-data2.txt recipe-data3.txt recipe-data4.txt -1 -1
User => 1: kou
1: オムライス http://cookpad.com/recipe/2653946
2: 親子丼 http://cookpad.com/recipe/2657882
3: 杏仁豆腐 http://cookpad.com/recipe/2654398
User => 2: piro
4: オムライス http://cookpad.com/recipe/2653779
5: 鶏の唐揚げ http://cookpad.com/recipe/2660337
6: カレー http://cookpad.com/recipe/2661962
User => 3: okkez
7: トマトサラダ http://cookpad.com/recipe/2662101
8: 生ハムサラダ http://cookpad.com/recipe/2661792
9: 和風サラダ http://cookpad.com/recipe/279208
User => 4: kou
10: チョコケーキ http://cookpad.com/recipe/2661922
11: スイートポテト http://cookpad.com/recipe/2639428
12: 杏仁豆腐 http://cookpad.com/recipe/2565701
$ ruby recipe.rb recipe-data1.txt recipe-data2.txt recipe-data3.txt recipe-data4.txt 4 -1
User => 4: kou
10: チョコケーキ http://cookpad.com/recipe/2661922
11: スイートポテト http://cookpad.com/recipe/2639428
12: 杏仁豆腐 http://cookpad.com/recipe/2565701
$ ruby recipe.rb recipe-data1.txt recipe-data2.txt recipe-data3.txt recipe-data4.txt 4 12
User => 4: kou
12: 杏仁豆腐 http://cookpad.com/recipe/2565701
```
