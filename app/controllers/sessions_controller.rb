class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    new_gh_session = GithubService.new
    session[:token] = new_gh_session.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:username] = new_gh_session.get_username

    redirect_to '/'
  end
end