class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)

        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {jwt: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
