json.posts @posts do |post|
    json.id post.id
    json.caption post.caption
    json.image url_for(post.main_image.attachment)
end
