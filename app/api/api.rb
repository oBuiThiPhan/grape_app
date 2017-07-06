require 'doorkeeper/grape/helpers'

class API < Grape::API
  format :json
  prefix "api"
  version "v1", using: :path

  helpers do
    def current_token
      env['api.token']
    end
    def current_user
      @current_user ||= User.find(current_token.resource_owner_id) if current_token
    end
  end

  mount V1::User_API
end
