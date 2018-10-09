5.times do |t|
    Admin.seed do |u|
        u.email = "aaa@aaa#{t}"
        u.password = "aaaaaa#{t}"
    end
end