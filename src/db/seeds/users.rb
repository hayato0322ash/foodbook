name = '河上　勇人'
email = 'hayato.drsp@gmail.com'
password = 'h03220322'
birthday = Date.new(1990, 3, 22)
sex = '男性'
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             birthday: birthday,
             sex: sex)
name = '岡本　和也'
email = 'contact@starskill.jp'
password = 'h03220322'
birthday = Date.new(1993, 4, 28)
sex = '男性'
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             birthday: birthday,
             sex: sex)
