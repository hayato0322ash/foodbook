shop_id = 1
name = 'スターバックスラテ'
price = 420
evaluation = 3
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/47defad3-7113-450f-899f-c4c1cf690e8f.jpg'),
             evaluation: evaluation)
name = 'キャラメルフラペチーノ'
price = 540
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/88fdf91f-8fbb-43a0-87af-d85a1b40e37a.jpg'),
             evaluation: evaluation)
name = 'ダークモカフラペチーノ'
price = 440
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/445feee9-a142-48e2-ad51-9634a95f8f5d.jpg'),
             evaluation: evaluation)
name = '抹茶クリームフラペチーノ'
price = 540
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/0f82c57d-9b6c-4364-9b15-f0700dcd855d.jpg'),
             evaluation: evaluation)
name = 'カフェミスト'
price = 320
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/e243302f-32af-44e0-b6e2-5e48c5371893.jpg'),
             evaluation: evaluation)
name = 'バニラクリームフラペチーノ'
price = 540
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/c0069fdc-a114-42ab-be46-97c547fd5764.jpg'),
             evaluation: evaluation)
name = 'コーヒージェリーフラペチーノ'
price = 540
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/6b348466-c843-481c-8c70-b9fd44095949.jpg'),
             evaluation: evaluation)

# ドトール
shop_id = 2
name = 'アイスコーヒー'
price = 300
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/2796cc44-aaf0-4f9a-89f9-cbefaec95ac9.jpg'),
             evaluation: evaluation)
name = '沖縄黒糖ラテ'
price = 300
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             image: File.open('./public/uploads/4b85fa5c-8296-4e13-8c11-a330064be48b.jpg'),
             evaluation: evaluation)
name = '抹茶ラテタピオカ入り'
price = 300
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             evaluation: evaluation)
name = 'ホットコーヒー'
price = 300
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             evaluation: evaluation)
name = 'チョコクッキー'
price = 300
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             evaluation: evaluation)
name = 'ミルクレープ'
price = 300
evaluation = 5
Menu.create!(shop_id: shop_id,
             name: name,
             price: price,
             evaluation: evaluation)
