# frozen_string_literal: true

module Github
  class ExampleComponent < ViewComponent::Base

    def initialize(user: "", repo: "", path: "/")
      @user = user
      @repo = repo
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

    private

    def get_party(url_path)
      HTTParty.get("#{base_uri}#{url_path}", headers: @headers)
    end

    def base_uri
      "https://api.github.com/"
    end

  end
end
