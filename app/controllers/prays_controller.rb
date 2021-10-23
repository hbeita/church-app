# frozen_string_literal: true

class PraysController < ApplicationController
  before_action :set_pray, only: %i[show edit update destroy]

  # GET /prays or /prays.json
  def index
    @prays = Pray.all
  end

  # GET /prays/1 or /prays/1.json
  def show; end

  # GET /prays/new
  def new
    @pray = Pray.new
  end

  # GET /prays/1/edit
  def edit; end

  # POST /prays or /prays.json
  def create
    @pray = Pray.new(pray_params)

    respond_to do |format|
      if @pray.save
        format.html { redirect_to @pray, notice: 'Pray was successfully created.' }
        format.json { render :show, status: :created, location: @pray }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pray.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prays/1 or /prays/1.json
  def update
    respond_to do |format|
      if @pray.update(pray_params)
        format.html { redirect_to @pray, notice: 'Pray was successfully updated.' }
        format.json { render :show, status: :ok, location: @pray }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pray.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prays/1 or /prays/1.json
  def destroy
    @pray.destroy
    respond_to do |format|
      format.html { redirect_to prays_url, notice: 'Pray was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pray
    @pray = Pray.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pray_params
    params.require(:pray).permit(:checked, :submitted_by, :pray)
  end
end
