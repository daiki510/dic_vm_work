# 自動販売機プログラム

`lib/vm.rb`: 【メイン】自動販売機クラス
`lib/drink.rb`: 飲み物クラス
`lib/process.rb`: RunCode用

> ## 動作の流れ
1. 自動販売機の起動
2. お金を入れる
3. 購入できる飲み物が表示される
4. 飲み物を選んで購入する
5. 投入金額、売上金額、在庫数が自動で計算される
6. 在庫を補充する
7. 返金される
8. 返金を実行するまで`2~6`のサイクルを繰り返す

> ## 手順 - irb -

1.  対象フォルダへ移動<br>
`cd vending_machine`
2. `irb`を起動
3. ファイルの読込<br>
`require_relative 'lib/vm.rb'`
4. クラス作成<br>
`vm = VendingMachine.new`
5. お金の投入：( )内に金額を入力<br>
`vm.insert(500)`
6. 購入可能な飲み物を表示<br>
`vm.available_drink_list`
7. 飲み物を購入する：( )内に飲み物番号を入力<br>
`vm.select_drink(1)`
8. 売り上げ金額の確認<br>
`vm.current_total_sales`
9. 投入合計金額の確認<br>
`vm.current_total_money`
10. 投入金の返金<br>
`vm.return_money`
11. 在庫の確認<br>
`vm.stock_info`
12. 在庫の補充：( )内に`飲み物名`と`補充本数`を入力<br>
`vm.store_drink(:Coke, 5)`

> ## 手順 - Run Codeがある場合 -
1. `process.rb`を開く
2. `RunCode`を起動
