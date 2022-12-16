class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
   if @book.save
     flash[:notice] = "you have created book successfully."
    # 4. 投稿した本の詳細へリダイレクト（book#showへ）
    redirect_to book_path(@book.id)
   else
    render :index
   end
  end

  def index
    # bookの定義
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
     @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
   else
     render :edit
   end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book.id)
  end





  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
