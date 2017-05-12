  class Api < Grape::API
    format :json
    prefix :api
      get do
        User.find(1)
      end
  end