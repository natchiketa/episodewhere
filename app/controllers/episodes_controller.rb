class EpisodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_episode, only: [:show, :edit, :beats, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all

    respond_to do |format|
      format.html
      format.json {
        render json: @episodes, each_serializer: EpisodePreviewSerializer
      }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @episode }
    end
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # GET /episodes/1/beats
  def beats

  end

  #TODO: Fix dumb HTTP responses
  def connect
    vlc = VLC::System.new('127.0.0.1', 9999, auto_start: false)
    vlc.server.start unless vlc.server.running?
    vlc.client.connect unless vlc.client.connected?

    render nothing: true, status: 200
  end

  def play
    media = params[:media]
    vlc = VLC::Client.new('127.0.0.1', 9999)
    vlc.connect unless vlc.connected?
    vlc.play(media)

    render nothing: true, status: 200
  end

  def time
    vlc = VLC::Client.new('127.0.0.1', 9999)
    vlc.connect unless vlc.connected?

    render json: {seconds: vlc.time}
  end

  def seek
    seconds = params[:seconds]
    vlc = VLC::Client.new('127.0.0.1', 9999)
    vlc.connect unless vlc.connected?
    vlc.seek(seconds)

    render json: {seconds: vlc.time}
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      episode_id = params[:id] || params[:episode_id]
      @episode = Episode.find(episode_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:episode, :title, :prod_code, :plot, :season_id)
    end

    def vlc_client
      @vlc_client ||= VLC::Client.new('localhost', 9999)
    end

    def vlc_system
      @vlc_system ||= VLC::System.new
    end
end

