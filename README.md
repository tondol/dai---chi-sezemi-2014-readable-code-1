# リーダブルコード

## 開発言語
- ruby

## Usage

sh```
$ git clone https://github.com/dai---chi/dai---chi-sezemi-2014-readable-code-1
$ cd dai---chi-sezemi-2014-readable-code-1
```

### spec3-5

sh```
$ cat recipe-data.txt
オムライス
親子丼
杏仁豆腐
$ ruby recipe.rb recipe-data.txt
1: オムライス
2: 親子丼
3: 杏仁豆腐
```

### spec6-

sh```
$ ./recipe.sh recipe-data.txt 2
2: 親子丼
$ ./recipe.sh recipe-data.txt
1: オムライス
2: 親子丼
3: 杏仁豆腐
```

### spec8-
