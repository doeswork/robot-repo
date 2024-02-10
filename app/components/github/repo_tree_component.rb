# frozen_string_literal: true

module Github
  class RepoTreeComponent < ViewComponent::Base

    def initialize(git_repo: "", path: "")
      @git_repo = git_repo
      return if git_repo.nil?
      return unless git_repo.include? "github.com/"

      url_path = git_repo.split("github.com/")[1].split("/")
      @user = url_path[0]
      @repo = url_path[1]
      @path = path
      @headers = {
        "Authorization" => "Bearer #{ENV['GITHUB_TOKEN']}"
      }
    end

    def user_json
      get_party("users/#{@user}")
    end

    def repo_json
      get_party("repos/#{@user}/#{@repo}/contents/#{@path}")
    end

    def path_content(url)
      url.split("/contents/")[1].split("?")[0]
    end

    private

    def get_party(url_path)
      HTTParty.get("#{base_uri}#{url_path}", headers: @headers)
    end

    def base_uri
      "https://api.github.com/"
    end

  end
end
