class TwittersController < ApplicationController
  before_action :set_twitter, only: %i[ show edit update destroy ]

  # GET /twitters or /twitters.json
  def index
    @twitters = Twitter.all
  end

  # GET /twitters/1 or /twitters/1.json
  def show
  end

  # GET /twitters/new
  def new
    @twitter = Twitter.new
    self.create
  end

  # GET /twitters/1/edit
  def edit
  end

  # POST /twitters or /twitters.json
  def create
    
    
  end

  # PATCH/PUT /twitters/1 or /twitters/1.json
  def update
    respond_to do |format|
      if @twitter.update(twitter_params)
        format.html { redirect_to @twitter, notice: "Twitter was successfully updated." }
        format.json { render :show, status: :ok, location: @twitter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitters/1 or /twitters/1.json
  def destroy
    @twitter.destroy
    respond_to do |format|
      format.html { redirect_to twitters_url, notice: "Twitter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter
      @twitter = Twitter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twitter_params
      params.fetch(:twitter, {})
    end
end
