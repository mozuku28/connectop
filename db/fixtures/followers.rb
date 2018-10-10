100.times do |t|
    t += 1
    #上記、データを入れる際に０を省く記述。
    Follower.seed do |f|
        f.user_id = t
        f.follower_user_id = 1
    end
end

100.times do |t|
    t += 1
    #上記、データを入れる際に０を省く記述。
    Follower.seed do |f|
        f.user_id = t
        f.follower_user_id = 2
    end
end

100.times do |t|
    t += 1
    #上記、データを入れる際に０を省く記述。
    Follower.seed do |f|
        f.user_id = t
        f.follower_user_id = 3
    end
end

100.times do |t|
    t += 1
    #上記、データを入れる際に０を省く記述。
    Follower.seed do |f|
        f.user_id = t
        f.follower_user_id = 4
    end
end

100.times do |t|
    t += 1
    #上記、データを入れる際に０を省く記述。
    Follower.seed do |f|
        f.user_id = t
        f.follower_user_id = 5
    end
end