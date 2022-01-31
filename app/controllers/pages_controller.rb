class PagesController < ApplicationController
    before_action :set_page, only: %i[ show edit update destroy ]

    def home
    end
  # GET /pages or /pages.json
  def index
    @pages = page.all
  end

  # GET /pages/1 or /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    puts params[:url]
    data=pageScrapperService.new.scrape(params[:url])
    puts data
    content=pageContent.create(title:data[:title])
    metric=pageMetric.create(likes:data[:likes],views:data[:views],page_content_id:content.id)
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: "page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: "page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: "page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = page.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.fetch(:page, {})
    end
end
