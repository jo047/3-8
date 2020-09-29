class BooksController < ApplicationController
  def top

  end

  def index
    @books=Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params_update)
    redirect_to book_path(@book.id), notice:"Book was successfully updated."
    else
    render 'edit'
    end
  end

  def create
    @books=Book.all
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice:"Book was successfully created."
    else
    render 'index'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path,notice:"Book was successfully destroyed."
  end

  private
  def book_params
		params.require(:book).permit(:title, :body)
	end

	def book_params_update
		params.require(:book).permit(:title, :body)
	end
end