user_id = 2
comment_id = 1
content = 'めっちゃわかる。自分も毎日飲んでます。'
Reply.create!(user_id: user_id,
              comment_id: comment_id,
              content: content)
