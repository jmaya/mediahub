class BooksController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name,:book)
  end
end
