module Api
  module V1
    class MessagesController < ApplicationController
      before_action :set_message, only: [:show, :update, :destroy]
      before_action :authorize_access_request!

      def index
        @messages = current_user.sended_messages.all

        render json: @messages
      end

      def show
        render json: @message
      end

      # def create
      #   @message = current_user.messages.build(message_params)

      #   if @message.save
      #     render json: @message, status: :created
      #   else
      #     render json: @message.errors, status: :unprocessable_entity
      #   end
      # end

      # def update
      #   if @message.update(message_params)
      #     render json: @message
      #   else
      #     render json: @message.errors, status: :unprocessable_entity
      #   end
      # end

      # def destroy
      #   @message.destroy
      # end

      private
      def set_message
        @message= current_user.messages.find(params[:id])
      end

      def record_params
        params.require(:message).permit(:text, :sender_id, :receiver_id)
      end
    end
  end
end
