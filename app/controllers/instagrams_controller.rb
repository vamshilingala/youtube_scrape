class InstagramsController < ApplicationController
  before_action :set_instagram, only: %i[ show edit update destroy ]

  # GET /instagrams or /instagrams.json
  def index
    @instagrams = Instagram.all
  end

  # GET /instagrams/1 or /instagrams/1.json
  def show
  end

  # GET /instagrams/new
  def new
    @instagram = Instagram.new
  end

  # GET /instagrams/1/edit
  def edit
  end

  # POST /instagrams or /instagrams.json
  def create
    @instagram = Instagram.new(instagram_params)

    respond_to do |format|
      if @instagram.save
        format.html { redirect_to @instagram, notice: "Instagram was successfully created." }
        format.json { render :show, status: :created, location: @instagram }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instagrams/1 or /instagrams/1.json
  def update
    respond_to do |format|
      if @instagram.update(instagram_params)
        format.html { redirect_to @instagram, notice: "Instagram was successfully updated." }
        format.json { render :show, status: :ok, location: @instagram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instagrams/1 or /instagrams/1.json
  def destroy
    @instagram.destroy
    respond_to do |format|
      format.html { redirect_to instagrams_url, notice: "Instagram was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instagram
      @instagram = Instagram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instagram_params
      params.fetch(:instagram, {})
    end
end
