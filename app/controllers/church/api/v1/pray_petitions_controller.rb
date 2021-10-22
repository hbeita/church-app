module Church
  module Api
    module V1
      class PrayPetitionsController < ApplicationController
        protect_from_forgery except: [:create, :new]
        before_action :set_pray_petition, only: [:show, :destroy]

        def index
          @pray_petitions = PrayPetition.all

          render json: @pray_petitions
        end

        def create
          @pray_petition = PrayPetition.new(pray_petition_params)

          if @pray_petition.save
            render json: @pray_petition
          else
            render json: @pray_petition.errors
          end
        end

        def update
          respond_to do |format|
            if @church_pray_petition.update(pray_petition_params)
              render json: { status: :ok, location: @church_pray_petition }
            else
              render json: { errors: @church_pray_petition.errors, status: :unprocessable_entity }
            end
          end
        end

        def destroy
          @church_pray_petition.destroy
          respond_to do |format|
            format.html { redirect_to church_pray_petitions_url, notice: "Pray petition was successfully destroyed." }
            format.json { head :no_content }
          end
        end

        private

        def set_pray_petition
          @pray_petition = PrayPetition.find(params[:id])
        end

        def pray_petition_params
          params.require(:pray_petition).permit(:pray_for, :pray_from)
        end
      end
    end
  end
end
