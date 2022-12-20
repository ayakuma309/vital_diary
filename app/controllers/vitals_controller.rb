class VitalsController < ApplicationController
  before_action :set_vital, only: %i[show edit update]

  def index
    @vitals = current_user.vitals.order(day: :desc).page(params[:page])
  end

  def show
    @comment = Comment.new
    @comments = @vital.comments
  end

  def new
    @vital = current_user.vitals.build
  end

  def create
    @vital = current_user.vitals.build(vital_params)
    if @vital.save
      redirect_to vital_path(@vital), success: t('defaults.message.created', item: Vital.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Vital.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @vital.update(vital_params)
      redirect_to vital_path(@vital), success: t('defaults.message.updated', item: Vital.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Vital.model_name.human)
      render :edit
    end
  end

  def destroy
    vital = current_user.vitals.find(params[:id])
    vital.destroy!
    redirect_to vitals_path, success: t('defaults.message.deleted', item: Vital.model_name.human)
  end

  private

  def set_vital
    @vital = current_user.vitals.find(params[:id])
  end

  def vital_params
    params.require(:vital).permit(:temperature,:high_bp,:low_bp,:pulse,:oxygen_saturation,:day)
  end
end
