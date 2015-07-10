class ScriptBeatsController < ApplicationController
  before_action :set_script_beat, only: [:show, :edit, :update, :destroy]

  # GET /script_beats
  # GET /script_beats.json
  def index
    limit  = params[:limit_to]   ? Integer(params[:limit_to])   : ScriptBeat.count
    offset = params[:skip_to]    ? Integer(params[:skip_to])    : 0
    clause = params[:episode_id] ? "episode_id = #{params[:episode_id]}" : "1=1"

    @script_beats = ScriptBeat.where(clause)
      .limit(limit)
      .offset(offset)

    respond_to do |format|
      format.html
      format.json { render json: @script_beats }
    end
  end

  # GET /script_beats/1
  # GET /script_beats/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @script_beat }
    end
  end

  # GET /script_beats/new
  def new
    @script_beat = ScriptBeat.new
  end

  # GET /script_beats/1/edit
  def edit
  end

  # POST /script_beats
  # POST /script_beats.json
  def create
    @script_beat = ScriptBeat.new(script_beat_params)

    respond_to do |format|
      if @script_beat.save
        format.html { redirect_to @script_beat, notice: 'Script beat was successfully created.' }
        format.json { render :show, status: :created, location: @script_beat }
      else
        format.html { render :new }
        format.json { render json: @script_beat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /script_beats/1
  # PATCH/PUT /script_beats/1.json
  def update
    respond_to do |format|
      beat = script_beat_params
      if beat[:characters]
        beat[:characters].map! do |char|
          Character.find(char[:id])
        end
      end

      if @script_beat.update_attributes(beat)
        format.html { redirect_to @script_beat, notice: 'Script beat was successfully updated.' }
        format.json { render json: @script_beat, status: 202}
      else
        format.html { render :edit }
        format.json { render json: @script_beat, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /script_beats/1
  # DELETE /script_beats/1.json
  def destroy
    @script_beat.destroy
    respond_to do |format|
      format.html { redirect_to script_beats_url, notice: 'Script beat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script_beat
      @script_beat = ScriptBeat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def script_beat_params
      params.require(:script_beat).permit(
        :start_line,
        :beat_type,
        :content,
        :episode_id,
        :start_time,
        :end_time,
        characters: [
          :id,
          :name
        ]
      )
    end
end
