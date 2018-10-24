100.times do |t|
  t += 1
  #上記、データを入れる際に０を省く記述。
  User.seed do |u|
    u.name = "ユーザー#{t}"
    u.email = "aaa@aaa#{t}"
    u.password = "aaaaaa#{t}"
  end
end