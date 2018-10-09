100.times do |t|
  User.seed do |u|
    u.name = "ユーザー#{t}"
    u.email = "aaa@aaa#{t}"
    u.password = "aaaaaa#{t}"
  end
end