class API < Grape::API
  format :json
  prefix "api"
  version "v1", using: :path
  mount V1::User_API
end
