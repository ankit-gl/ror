class BookController < ApplicationController
  layout 'application'
  before_action :require_user_logged_in!, :set_constants

  def set_constants
    @is_user_logged_in = :is_user_logged_in
  end

  def list
    @books = Book.all
    @subjects = Subject.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @subjects = Subject.all
  end

  def book_params
    params.require(:books).permit(:title, :price, :subject_id, :description)
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to action: 'list'
    else
      @subjects = Subject.all
      render action: 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end

  def book_param
    params.require(:book).permit(:title, :price, :subject_id, :description)
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_param)
      redirect_to action: 'show', id: @book
    else
      @subjects = Subject.all
      render action: 'edit'
    end
  end

  def delete
    Book.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  def show_subjects
    @subject = Subject.find(params[:id])
  end
end
