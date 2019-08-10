class BooksController < ApplicationController
  
  def show
  	@book = Book.find(params[:id])
  end

  def index
  
  end

  def new
	@books = Book.all
  	@book = Book.new
  end

  def create
  	book =Book.new(book_params)
  	book.save
  	redirect_to '/books'
  end

  def edit
  	@book = Book.find(params[:id])
  end
  
  def update
  	book = Book.find(params[:id])
  	blog.update(blog_params)
  	redirect_to book_path(book)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
