module ApplicationHelper
    def gravatar_for(user, size:80)
        email_address=user.email.downcase
        hash=Digest::MD5.hexdigest(email_address)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
        image_tag(gravatar_url, alt:user.username)
    end
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end


end
