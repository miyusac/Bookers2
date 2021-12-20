class BookCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        comment = BookComment.new(book_comment_params)
        comment.user_id = current_user.id
        comment.book_id = book.id
        if comment.save
            flash[:notice]="Comment was successfully created."
            redirect_to book_path(book)
        else 
            @nbook = Book.new
            @book = Book.find(params[:book_id])
            @user = @book.user
            @comment = BookComment.new
            render 'books/show'
        end
    end
    
    def destroy
        BookComment.find_by(id: params[:id]).destroy
        redirect_to book_path(params[:book_id])
    end
    
    private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
