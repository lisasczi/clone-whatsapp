module Api
  module V1
    class MessagesController < ApplicationController
      before_action :set_message, only: [:show]
      before_action :authorize_access_request!

      def index
        @messages = current_user.sended_messages.all
        render json: @messages
      end

      def show
        render json: @message
      end

      private
      def set_message
        @message= current_user.messages.find(params[:id])
      end

      def record_params
        params.require(:message).permit(:text, :sender_id, :chat_id)
      end
    end
  end
end
