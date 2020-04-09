class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]

	def top


	end


	def index
		@book = Book.new
		@books = Book.all
    @user = current_user


	end

	def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new

	end

    def edit
      @book = Book.find(params[:id])


    end

    def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated"
    redirect_to book_path(@book)
    else
      render :edit

  	end
  end

  	def create
	   @book = Book.new(book_params)
     @books = Book.all
	   @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "successfully"
  	   redirect_to book_path(@book)
     else
      render :index
    end
  end

    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    end



  	private
    def book_params
      params.require(:book).permit(:title,:body)
    end
    
    def correct_user
      user = current_user
      redirect_to(books_path) unless user == Book.find(params[:id]).user
    end

end


