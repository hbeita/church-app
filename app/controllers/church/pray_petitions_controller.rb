class Church::PrayPetitionsController < ApplicationController
  before_action :set_church_pray_petition, only: %i[ show edit update destroy ]

  # GET /church/pray_petitions or /church/pray_petitions.json
  def index
    @church_pray_petitions = Church::PrayPetition.all
  end

  # GET /church/pray_petitions/1 or /church/pray_petitions/1.json
  def show
  end

  # GET /church/pray_petitions/new
  def new
    @church_pray_petition = Church::PrayPetition.new
  end

  # GET /church/pray_petitions/1/edit
  def edit
  end

  # POST /church/pray_petitions or /church/pray_petitions.json
  def create
    @church_pray_petition = Church::PrayPetition.new(church_pray_petition_params)

    respond_to do |format|
      if @church_pray_petition.save
        format.html { redirect_to @church_pray_petition, notice: "Pray petition was successfully created." }
        format.json { render :show, status: :created, location: @church_pray_petition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @church_pray_petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /church/pray_petitions/1 or /church/pray_petitions/1.json
  def update
    respond_to do |format|
      if @church_pray_petition.update(church_pray_petition_params)
        format.html { redirect_to @church_pray_petition, notice: "Pray petition was successfully updated." }
        format.json { render :show, status: :ok, location: @church_pray_petition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @church_pray_petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /church/pray_petitions/1 or /church/pray_petitions/1.json
  def destroy
    @church_pray_petition.destroy
    respond_to do |format|
      format.html { redirect_to church_pray_petitions_url, notice: "Pray petition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church_pray_petition
      @church_pray_petition = Church::PrayPetition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def church_pray_petition_params
      params.require(:church_pray_petition).permit(:pray_for, :request_from)
    end
end
