class WeightRecordsController < ApplicationController
  before_action :set_weight_record, only: [:show, :edit, :update, :destroy]

  # GET /weight_records
  # GET /weight_records.json
  def index
    @weight_records = WeightRecord.all
  end

  # GET /weight_records/1
  # GET /weight_records/1.json
  def show
  end

  # GET /weight_records/new
  def new
    @weight_record = WeightRecord.new
  end

  # GET /weight_records/1/edit
  def edit
  end

  # POST /weight_records
  # POST /weight_records.json
  def create
    @weight_record = WeightRecord.new(weight_record_params)
    @weight_record.user = current_user

    respond_to do |format|
      if @weight_record.save
        format.html { redirect_to @weight_record, notice: 'Weight record was successfully created.' }
        format.json { render :show, status: :created, location: @weight_record }
      else
        format.html { render :new }
        format.json { render json: @weight_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weight_records/1
  # PATCH/PUT /weight_records/1.json
  def update
    respond_to do |format|
      if @weight_record.update(weight_record_params)
        format.html { redirect_to @weight_record, notice: 'Weight record was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight_record }
      else
        format.html { render :edit }
        format.json { render json: @weight_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_records/1
  # DELETE /weight_records/1.json
  def destroy
    @weight_record.destroy
    respond_to do |format|
      format.html { redirect_to weight_records_url, notice: 'Weight record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight_record
      @weight_record = WeightRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weight_record_params
      params.require(:weight_record).permit(:user_id, :weight, :date)
    end
end
