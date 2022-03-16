module ApplicationHelper
    def gravatar_for(user, size:80)
        email_address=user.email.downcase
        hash=Digest::MD5.hexdigest("divyanshm1609@gmail.com")
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
        image_tag(gravatar_url, alt:user.username)
    end
end
