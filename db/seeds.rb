# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create! (
  [
    {
      email: "aa@gmail.com",
      password: "654321",
    }
  ]
)

EndUser.create! (
  [
    {
      last_name: "高橋",
      last_name_kana: "ﾀｶﾊｼ",
      first_name:"恵理子",
      first_name_kana:"ｴﾘｺ",
      zipcode:"1234567",
      address:"東京都練馬区1-1-1",
      phone_number:"09012345678",
      email: "a@gmail.com",
      password: "654321",
    }
  ]
)
