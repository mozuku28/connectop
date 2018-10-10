5.times do |t|
    t += 1
    Admin.seed do |u|
        u.email = "aaa@aaa#{t}"
        u.password = "aaaaaa#{t}"
    end
end