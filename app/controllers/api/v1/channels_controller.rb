module Api
  module V1
    class ChannelsController < ApplicationController
      def index
         render json: Channel.all
      end

      def create
        channel = Channel.new(channel_params)
        if channel.save
          render json: channel, status: :created
        else
          render json: channel.errors, status: :unprocessable_entity
        end
      end

      def destroy
        channel = Channel.find(params[:id])
        channel.destroy!
        head :no_content
      end

      private

      def channel_params
        params.require(:channel).permit(:name)
      end
    end
  end
end
