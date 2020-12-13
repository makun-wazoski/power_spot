module PostsHelper
  def post_lists(posts)
    html = ''
    posts.each do |post|
      html += render(partial: 'post',locals: { post: post })
    end
    return raw(html)
  end
end
