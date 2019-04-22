class UsersController < ApplicationController

def edit
@user = User.find(params[:id])
end

def index
@user = current_user
@book = Book.new
@users = User.all
end

def show
@user = User.find(params[:id])
@book = Book.new
@books = @user.books
end

def create
@book = Book.new(user_params)
@book.user_id = current_user.id
if@book.save
redirect_to books_path
else
 @books = Book.all
 @user = current_user
render :index
end
end

def update
@user = User.find(params[:id])
if@user.update(user_params)
 redirect_to user_path(current_user)
else
  render :edit
end
end


protected

        def user_params
			params.require(:user).permit(:name, :image, :introduction, :title)
		end

end
