class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def create
  end

  def update
  end

  def new
    @wiki = Wiki.new
  end

  def destroy
  end

end
