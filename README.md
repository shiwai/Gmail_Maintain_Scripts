Gmail_Maintain_Scripts
======================

Gmailメンテナンス用スクリプト
# 前提条件
- .configureファイルにアカウント情報が記載されていること

`
username=xxxxxxxx
password=yyyyyyyy
`
- GmailでIMAPアクセスが有効になっていること
	自動消去がオフになっていること
	メールを今すぐ完全に削除する設定がされていること

## delete_at_label_mails.rb
指定したラベルに含まれるメールを全て削除

`
ruby delete_at_label_mails.rb meiwaku
`
→ 「meiwaku」ラベルのメッセージを全削除
