module Api
  module V1
    class UserChatsController < ApplicationController
      before_action :authorize_access_request!

      def index
        @user_chats = User_chat.all
        render json: @user_chats
      end

      def show
        render json: @user_chat
      end

      private

      def set_user_chat
          @user_chat = User_chat.find(params[:id])
      end
    end
  end
end
