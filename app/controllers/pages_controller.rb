class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def repo
    @github_repo = params[:github_repo]
  end
end
