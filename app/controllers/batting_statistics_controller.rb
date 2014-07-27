class BattingStatisticsController < ApplicationController
  before_action :set_batting_statistic, only: [:show, :edit, :update, :destroy]

  # GET /batting_statistics
  # GET /batting_statistics.json
  def index
    @batting_statistics = BattingStatistic.all
  end

  # GET /batting_statistics/1
  # GET /batting_statistics/1.json
  def show
  end

  # GET /batting_statistics/new
  def new
    @batting_statistic = BattingStatistic.new
  end

  # GET /batting_statistics/1/edit
  def edit
  end

  # POST /batting_statistics
  # POST /batting_statistics.json
  def create
    @batting_statistic = BattingStatistic.new(batting_statistic_params)

    respond_to do |format|
      if @batting_statistic.save
        format.html { redirect_to @batting_statistic, notice: 'Batting statistic was successfully created.' }
        format.json { render :show, status: :created, location: @batting_statistic }
      else
        format.html { render :new }
        format.json { render json: @batting_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batting_statistics/1
  # PATCH/PUT /batting_statistics/1.json
  def update
    respond_to do |format|
      if @batting_statistic.update(batting_statistic_params)
        format.html { redirect_to @batting_statistic, notice: 'Batting statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @batting_statistic }
      else
        format.html { render :edit }
        format.json { render json: @batting_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batting_statistics/1
  # DELETE /batting_statistics/1.json
  def destroy
    @batting_statistic.destroy
    respond_to do |format|
      format.html { redirect_to batting_statistics_url, notice: 'Batting statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batting_statistic
      @batting_statistic = BattingStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batting_statistic_params
      params.require(:batting_statistic).permit(:statistic_id, :g, :ab, :r, :h, :2b, :3b, :hr, :rbi, :sb, :cs)
    end
end
