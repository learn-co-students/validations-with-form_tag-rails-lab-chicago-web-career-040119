class AuthorsController < ApplicationController

  before_action :find_author, only: [:show, :edit, :update]

  def show
    # @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
       redirect_to author_path(@author)
    else
      @errors = @author.errors.full_messages
      render :new
    end
  end
    def edit
      # @author = Author.find(params[:id])
    end

    def update
      if @author.update(author_params)
        redirect_to author_path(@author)
      else
        render :edit
      end
    end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
