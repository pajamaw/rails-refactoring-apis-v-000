class RepositoriesController < ApplicationController
  def index
    set_repos = GithubService.new('access_token'=> session[:token])
    @repos_array = set_repos.get_repos
  end

  def create
    new_repo = GithubService.new('access_token'=> session[:token])
    new_repo.create_repo(params[:name])
    redirect_to '/'
  end
end
