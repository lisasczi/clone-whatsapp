module Api
  module V1
    class ChatsController < ApplicationController
      before_action :set_chat, only: [:show]
      before_action :authorize_access_request!

      def index
        @chats =  Chat.all
        render json: @chats
      end

      def show
        render json: @chat
      end


      private

      def set_chat
          @chat = Chat.find(params[:id])
      end

    end
  end
end
