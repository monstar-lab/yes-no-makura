class NumberOfParticipantsController < ApplicationController
  before_action :set_number_of_participant, only: [:show, :edit, :update, :destroy]

  # GET /number_of_participants
  def index
    @number_of_participants = NumberOfParticipant.all
  end

  # GET /number_of_participants/1
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
  def create
    @number_of_participant = NumberOfParticipant.new(number_of_participant_params)

    respond_to do |format|
      if @number_of_participant.save
        format.html { redirect_to @number_of_participant, notice: 'Number of participant was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /number_of_participants/1
  def update
    respond_to do |format|
      if @number_of_participant.update(number_of_participant_params)
        format.html { redirect_to @number_of_participant, notice: 'Number of participant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /number_of_participants/1
  def destroy
    @number_of_participant.destroy
    respond_to do |format|
      format.html { redirect_to number_of_participants_url, notice: 'Number of participant was successfully destroyed.' }
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
