class SessionsController < ApplicationController
    def create
        user = User.find_by(
            username: params[:user][:username])
            .try(:authenticate, params[:user][:password])
        if user
            session[:user_id] = user.id
            payload = {user_id: session[:user_id]}
            token = encode_token(payload)
            render json: {jwt: token}
        else
            render json: {errors: 'Incorrect Username or Password'}
        end
    end

    def destroy
        payload = decode_token(params[:jwt])
        user_id = payload[0]['user_id']
        session.delete_if {|key, value| value == user_id}
        render json: {status: 'logged out'}
    end
end
