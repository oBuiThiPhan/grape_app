class V1::User_API < Grape::API

  resource :users do
    desc "List all User"

    get do
      User.all
    end

    desc "create user"
    params do
      requires :user, type: Hash do
        requires :name, type: String
        requires :address, type: String
        requires :age, type: Integer
      end
    end

    post do
      User.create! params[:user]
    end

    desc "delete a user"
    params do
      requires :id, type: String
    end

    delete ":id" do
      User.find_by(id: params[:id]).destroy!
    end

    get ":id" do
      User.find_by(id: params[:id])
    end

    desc "update user"
    params do
      requires :id, type: String
      group :user, type: Hash do
        optional :name, type: String
        optional :address, type: String
        optional :age, type: Integer
      end
    end

    put ":id" do
      User.find_by(id: params[:id]).update!(params[:user])
    end
  end
end
