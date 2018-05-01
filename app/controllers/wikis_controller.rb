class WikisController < ApplicationController
  def index
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user_id = params[:wiki][:user]

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else

      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
  end
end
