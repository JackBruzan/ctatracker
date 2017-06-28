class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @schedules = Schedule.all
  end

  include HTTParty
  include JSON

  def show
    estimate
  end

  def new
    @schedule = current_user.schedules.build
  end

  def edit
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def estimate
    response = self.class.get("http://www.ctabustracker.com/bustime/api/v2/getpredictions?key=qtQscN352d8Z6WVaQpcUYM99z&rt=78&dir=Westbound&stpid=15519&format=json",{})
    prediction = response["bustime-response"]["prd"][0]["prdctdn"]
    if prediction == "DUE"
      @schedule.estimate = prediction
    else
      @schedule.estimate = prediction + " minutes"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:bustrain, :routeid, :starttime, :endtime, :days)
    end
end
