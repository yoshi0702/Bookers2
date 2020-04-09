class UsersController < ApplicationController
before_action :authenticate_user!,only: [:index, :show, :edit, :update]
before_action :correct_user,   only: [:edit, :update]


	def top


	end


	def index
        @book = Book.new
        @users = User.all
        @user = current_user


	end

	def show
        @user = current_user
        @book_detail = Book.where(user_id: params[:id])
        @book = Book.new


	end

    def edit
    	@user = User.find(params[:id])


    end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
        flash[:notice] = "successfully"
    	redirect_to user_path(@user)
        else
        render :edit
        end


    end

    def about

    end

    def destroy

    end

    private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end



    def correct_user
      @user = User.find(params[:id])
      redirect_to(user_path(current_user)) unless current_user == @user
    end





end
