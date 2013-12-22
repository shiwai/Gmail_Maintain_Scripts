Gmail_Maintain_Scripts
======================

Gmailメンテナンス用スクリプト
## 前提条件
- .configファイルにアカウント情報が記載されていること

`
username=xxxxxxxx
password=yyyyyyyy
`
- GmailでIMAPアクセスが有効になっていること
	自動消去がオフになっていること
	メールを今すぐ完全に削除する設定がされていること

### delete_at_label_mails.rb
指定したラベルに含まれるメールを全て削除する

`
ruby delete_at_label_mails.rb meiwaku
`
→ 「meiwaku」ラベルのメッセージを全削除

### seen_at_label_mails.rb
指定したラベルに含まれるメールを全て既読にする

`
ruby seen_at_label_mails.rb kidoku/shitai
`

→「kidoku」ラベルのサブラベル「shitai」のメールを全て既読にする
