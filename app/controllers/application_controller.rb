class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def decode_token(payload)
        JWT.decode(payload, Rails.application.credentials.secret_key_base)
    end
end
