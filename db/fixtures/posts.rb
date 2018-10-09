100.times do |t|
    Post.seed do |u|
      u.post_title = "title#{t}"
      u.post_body = "body#{t}"
      u.user_id = "#{t}"
    end
  end