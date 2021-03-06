class UsersController < ApplicationController
    before_action :set_user, only:[:show, :edit, :destroy, :update]
    # before_action :require_user, only:[:edit, :update]
    # before_action :require_same_user, only:[:edit, :update, :destroy]


    # def new
    #     @user=User.new
    # end
    # def create 
    #     @user = User.new(params.require(:user).permit(:username, :email, :password))
    #     @user.save
    #     session[:user_id] = @user.id
    #     if @user.save
    #         redirect_to articles_path
    #     else
    #         render 'new'
    #     end

    # end
    # def edit
    # end

    def update
        if(@user.update(params.require(:user).permit(:username, :email, :password)))
            flash[:notice]="User was edited successfully"
            redirect_to @user
        else
            render 'edit'
        end

    end
    def show
        @articles = @user.articles
    end
    def index
        @users=User.paginate(page:params[:page], per_page:5)
    end
    # def destroy
    #     @user.destroy
        
    #     session[:user_id]=nil if @user==current_user
    #     flash[:notice]="Accounts and associated articles deleted"
    #     redirect_to articles_path
    # end

    # private
    # def user_params
    #     params.require(:user).permit(:username, :password, :email)
    # end
    def set_user
        @user = User.find(params[:id])
    end

    # def require_same_user
       
    #     if current_user!=@user && !current_user.admin?
    #       flash[:alert]="You can only delete or edit your own profile"
    #       redirect_to users_path(@user)
    #     end
    #   end

end