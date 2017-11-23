class BooksController < ApplicationController

  def new
  	@book = Book.new
  end

  def create
  	@books = Book.all
  	@book = Book.new(book_params)

  	if @book.save
      flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book.id)
  	else
  		render :index
  		# rails validatesで検索、book.rbにも書くこと有り
  	end
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
    flash[:notice] = "Book was successfully updated."
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	redirect_to book_path(@book.id)
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
    flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body, :category)
  end

end
