class SessionsController < ApplicationController
    def create
        user = User.find_by(
            username: params[:user][:username])
            .try(:authenticate, params[:user][:password])
        if user
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {jwt: token}
        else
            render json: {errors: 'Incorrect Username or Password'}
        end
    end

end
