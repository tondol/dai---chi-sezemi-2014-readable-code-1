実装メモ
====

よかったところ
----

- mainメソッド
    - https://github.com/tondol/dai---chi-sezemi-2014-readable-code-1/commit/b3d605858b542646cfcabb8a62d26f13f8956d98
    - エントリポイントのロジックをmainメソッドに切り出している
    - エントリポイントの肥大化を防ぐ
- print_title，print_title_with_idメソッド
    - 同コミット
    - 出力部分をメソッドに切り出し，ロジックと出力の分離を図っている
    - idとtitleを渡すのではなく，Recipeクラスのメソッドにしたい，かも

保留しているところ
----

- open_fileメソッドで開いたFileインスタンスを，後ほど自分でcloseしているのが気になる
    - File.openにイテレータを渡せば自分でcloseを書かないで済む
    - open_fileにRecipe配列を作成するロジックを含め，Fileインスタンスをその中で閉じる
