class OrbsController < ApplicationController
  before_action :set_orb, only: [:show, :edit, :update, :destroy]

  # GET /orbs
  # GET /orbs.json
  def index
    @orbs = Orb.all
  end

  # GET /orbs/1
  # GET /orbs/1.json
  def show
  end

  # GET /orbs/new
  def new
    @orb = Orb.new
  end

  # GET /orbs/1/edit
  def edit
  end

  # POST /orbs
  # POST /orbs.json
  def create
    @orb = Orb.new(orb_params)

    respond_to do |format|
      if @orb.save
        format.html { redirect_to @orb, notice: 'Orb was successfully created.' }
        format.json { render :show, status: :created, location: @orb }
      else
        format.html { render :new }
        format.json { render json: @orb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orbs/1
  # PATCH/PUT /orbs/1.json
  def update
    respond_to do |format|
      if @orb.update(orb_params)
        format.html { redirect_to @orb, notice: 'Orb was successfully updated.' }
        format.json { render :show, status: :ok, location: @orb }
      else
        format.html { render :edit }
        format.json { render json: @orb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orbs/1
  # DELETE /orbs/1.json
  def destroy
    @orb.destroy
    respond_to do |format|
      format.html { redirect_to orbs_url, notice: 'Orb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orb
      @orb = Orb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orb_params
      params.require(:orb).permit(:category, :name, :description, :image)
    end
end
