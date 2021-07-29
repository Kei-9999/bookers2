class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @book_comment = BookComment.new



  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render action: :index
    end

  end

  def update
    @book = Book.find(params[:id])

     if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
     else
      render action: :edit
     end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
