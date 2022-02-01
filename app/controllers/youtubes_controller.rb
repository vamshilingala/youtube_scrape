class YoutubesController < ApplicationController
  before_action :set_youtube, only: %i[ show edit update destroy ]
  
  # GET /youtubes or /youtubes.json
  def index
    @youtubecontents=YoutubeContent.all.paginate(:page => params[:page], :per_page =>5)
    if @youtubecontents.present? 
     render template: "pages/home"
    end
  end

  # GET /youtubes/1 or /youtubes/1.json
  def show
  end

  # GET /youtubes/new
  def new
    @youtube = Youtube.new
    self.create

  end

  # GET /youtubes/1/edit
  def edit
  end

  # POST /youtubes or /youtubes.json
  def create
    puts "hello"
    puts params[:url]
    puts params[:commit]
    data=YoutubeScrapperService.new.scrape(params[:url])
    puts data
    @content=YoutubeContent.create(url:data[:url],title:data[:title])
    puts @content
    @metric=YoutubeMetric.create(likes:data[:likes],views:data[:views],channel: data[:channel],youtube_content_id:@content.id)
      if @content.present? and @metric.present?
          render template: "pages/home", locals: {content:@content, metric: @metric}
    end
  end

  # PATCH/PUT /youtubes/1 or /youtubes/1.json
  def update
    respond_to do |format|
      if @youtube.update(youtube_params)
        format.html { redirect_to @youtube, notice: "Youtube was successfully updated." }
        format.json { render :show, status: :ok, location: @youtube }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @youtube.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtubes/1 or /youtubes/1.json
  def destroy
    @youtube.destroy
    respond_to do |format|
      format.html { redirect_to youtubes_url, notice: "Youtube was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def action
    @youtubemetrics=YoutubeMetric.all
    @youtubecontents=YoutubeContent.all
  end
# helper_method :my_method
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube
      @youtube = Youtube.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def youtube_params
      params.fetch(:youtube, {})
    end
    
end
#https://www.youtube.com/watch?v=bMknfKXIFA8
#yc=YoutubesController.new()
#puts yc.class