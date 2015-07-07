class ScriptBeatCharactersController < ApplicationController
  before_action :set_script_beat_character, only: [:show, :edit, :update, :destroy]

  # GET /script_beat_characters
  # GET /script_beat_characters.json
  def index
    @script_beat_characters = ScriptBeatCharacter.all
  end

  # GET /script_beat_characters/1
  # GET /script_beat_characters/1.json
  def show
  end

  # GET /script_beat_characters/new
  def new
    @script_beat_character = ScriptBeatCharacter.new
  end

  # GET /script_beat_characters/1/edit
  def edit
  end

  # POST /script_beat_characters
  # POST /script_beat_characters.json
  def create
    @script_beat_character = ScriptBeatCharacter.new(script_beat_character_params)

    respond_to do |format|
      if @script_beat_character.save
        format.html { redirect_to @script_beat_character, notice: 'Script beat character was successfully created.' }
        format.json { render :show, status: :created, location: @script_beat_character }
      else
        format.html { render :new }
        format.json { render json: @script_beat_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /script_beat_characters/1
  # PATCH/PUT /script_beat_characters/1.json
  def update
    respond_to do |format|
      if @script_beat_character.update(script_beat_character_params)
        format.html { redirect_to @script_beat_character, notice: 'Script beat character was successfully updated.' }
        format.json { render :show, status: :ok, location: @script_beat_character }
      else
        format.html { render :edit }
        format.json { render json: @script_beat_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /script_beat_characters/1
  # DELETE /script_beat_characters/1.json
  def destroy
    @script_beat_character.destroy
    respond_to do |format|
      format.html { redirect_to script_beat_characters_url, notice: 'Script beat character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script_beat_character
      @script_beat_character = ScriptBeatCharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def script_beat_character_params
      params.require(:script_beat_character).permit(:script_beat_id, :character_id)
    end
end
