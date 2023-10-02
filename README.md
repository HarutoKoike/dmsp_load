# DMSP load procedure

## Usage
```
dmsp = dmsp_load(f, year, month, day, /tvar, /reload)
```
以下は全て整数型で与える。<br>
`f`: 衛星番号(16, 17, 18) <br>
`year`: 年 <br>
`month`: 月<br>
`day`: 日<br>

### パスの設定
ダウンロードしたデータはsaveファイルとして保存される。保存先のディレクトリは、環境変数`$DATA_PATH`になるが、存在しない場合は`$SPEDAS_DATA_PATH`となる。<br>
これらの2つも存在しない場合、`$HOME`に保存される。


# dmsp_load
