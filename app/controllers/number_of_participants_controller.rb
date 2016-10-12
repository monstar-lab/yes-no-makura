class NumberOfParticipantsController < ApplicationController
  before_action :set_number_of_participant, only: [:show, :edit, :update, :destroy]

  # GET /number_of_participants
  # GET /number_of_participants.json
  def index
    @number_of_participants = NumberOfParticipant.all
  end

  # GET /number_of_participants/1
  # GET /number_of_participants/1.json
  def show
  end

  # GET /number_of_participants/new
  def new
    @number_of_participant = NumberOfParticipant.new
  end

  # GET /number_of_participants/1/edit
  def edit
  end

  # POST /number_of_participants
  # POST /number_of_participants.json
  def create
    @number_of_participant = NumberOfParticipant.new(number_of_participant_params)

    respond_to do |format|
      if @number_of_participant.save
        format.html { redirect_to @number_of_participant, notice: 'Number of participant was successfully created.' }
        format.json { render :show, status: :created, location: @number_of_participant }
      else
        format.html { render :new }
        format.json { render json: @number_of_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_of_participants/1
  # PATCH/PUT /number_of_participants/1.json
  def update
    respond_to do |format|
      if @number_of_participant.update(number_of_participant_params)
        format.html { redirect_to @number_of_participant, notice: 'Number of participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @number_of_participant }
      else
        format.html { render :edit }
        format.json { render json: @number_of_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_of_participants/1
  # DELETE /number_of_participants/1.json
  def destroy
    @number_of_participant.destroy
    respond_to do |format|
      format.html { redirect_to number_of_participants_url, notice: 'Number of participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_of_participant
      @number_of_participant = NumberOfParticipant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_of_participant_params
      params.require(:number_of_participant).permit(:number)
    end
end
