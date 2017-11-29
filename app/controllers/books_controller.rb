class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about]
	def top
		if	user_signed_in?
			redirect_to user_path(current_user.id)
		end
	end

	def about
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@bookshow = Book.find(params[:id])
		@book = Book.new
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:success] = 'Post was successfully created.'
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			render :index
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:success] = 'Post was successfully edited.'
			redirect_to book_path(@book.id)
		else
			redirect_to edit_book_path(@book.id)
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash[:success] = 'Post was successfully destroy.'
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :opinion, :user_id)
	end

end
