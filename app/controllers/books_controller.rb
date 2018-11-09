class BooksController < ApplicationController
	before_action :all_books, only: [:index, :create]
	before_action :set_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.all
	end
	def show
		@number_of_likes = 0
    @number_of_votes = 0

    @liked_by = []
    @disliked_by = []

    User.all.each do |user|
      if user.liked_books.include?(@book.id)
        @number_of_likes += 1
        @number_of_votes += 1
      elsif user.disliked_books.include?(@book.id)
        @number_of_votes += 1
      end

      if @book.likes.include?(user.id)
        @liked_by.push(user)
        @disliked_by.delete(user)
      elsif @book.dislikes.include?(user.id)
        @disliked_by.push(user)
        @liked_by.delete(user)
      end
    end
	end
	def new
		@book = Book.new
	end
  	def create
    	# @book = Book.new(book_params)
			@book = Book.create(book_params)
  	end
  	def update
    	respond_to do |format|
      		if @book.update(book_params)
        		format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        		format.json { render :show, status: :ok, location: @book }
      		else
        		format.html { render :edit }
        		format.json { render json: @book.errors, status: :unprocessable_entity }
      		end
    	end
  	end
  	def destroy
    	@book.destroy
    	respond_to do |format|
      		format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end
  private
    # Use callbacks to share common setup or constraints between actions.
		def all_books
			@books = Book.all
		end
		def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :page_length)
    end
end
