class WeightRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_weight_record, only: [:show, :edit, :update, :destroy]
  
  def index
    @weight_records = current_user.weight_records.order(date:"ASC").page(params[:page]).per(20)
  end
  
  def new
    @weight_record = WeightRecord.new
  end
  
  def edit
    @weight_record = WeightRecord.find(params[:id])
  end

  def create
    @weight_record = WeightRecord.new(weight_record_params)
    @weight_record.user = current_user
     if @weight_record.save
       redirect_to user_weight_records_path(current_user)
     end
  end

  def update
    @weight_record = WeightRecord.find(params[:id])
    @weight_record.update(weight_record_params)
    redirect_to user_weight_records_path(current_user)
  end
  
  def destroy
    @weight_record.destroy
    redirect_to user_weight_records_path(current_user)
  end

  private
    
    def set_weight_record
      @weight_record = WeightRecord.find(params[:id])
    end

    
    def weight_record_params
      params.require(:weight_record).permit(:user_id, :weight, :date)
    end
end
