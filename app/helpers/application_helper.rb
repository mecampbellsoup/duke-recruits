module ApplicationHelper
  def avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "https://gravatar.com/avatar/#{gravatar_id}.png?s=96"
    end
  end
end
