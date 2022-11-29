class BooksController < ApplicationController
  before_action :set_book, only: %i[ show ]
  before_action :require_user!

  # GET /books or /books.json
  def index
    @books = Book.all.includes(:author).order(published_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
end
