# frozen_string_literal: true

module Api
  module V1
    class PraysController < ApiController
      def create
        @pray = Pray.new(pray_params)

        if @pray.save
          render json: @pray
        else
          render json: @pray.errors
        end
      end

      private

      def pray_params
        params.require(:pray).permit(:submitted_by, :pray)
      end
    end
  end
end
