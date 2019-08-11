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
  	 if book.save
       flash[:successfully_save] = "Book was successfully created."
       redirect_to "/books/#{book.id}"
     end
  end

  def edit
  	@book = Book.find(params[:id])
  end
  
  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
      flash[:successfully_update] ="Book was successfully update."
  	  redirect_to "/books/#{book.id}"
    end
  end

  def destroy
      book = Book.find(params[:id])
      if book.destroy
        flash[:successfully_destroy] ="Book was successfully destroy."
      redirect_to new_book_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
