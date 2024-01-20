# frozen_string_literal: true

class GithubExampleComponent < ViewComponent::Base

  def initialize(user: "markdoeswork")
    @user = HTTParty.get("#{base_uri}/users/#{user}")
  end

  private

  def base_uri
    "https://api.github.com"
  end

end
