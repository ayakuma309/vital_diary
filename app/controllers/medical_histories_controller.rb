class MedicalHistoriesController < ApplicationController
  before_action :set_medical_history, only: %i[edit update]
  
  def new
    @medical_history = current_user.medical_histories.build
  end

  def create
    @medical_history = current_user.medical_histories.build(medical_history_params)
    if @medical_history.save
      redirect_to profile_path, success: t('defaults.message.created', item: MedicalHistory.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_created', item: MedicalHistory.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @medical_history.update(medical_history_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: MedicalHistory.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: MedicalHistory.model_name.human)
      render :edit
    end
  end

  def destroy
    medical_history = current_user.medical_histories.find(params[:id])
    medical_history.destroy!
    redirect_to profile_path, notice: '削除に成功しました'
  end

  private
  def medical_history_params
    params.require(:medical_history).permit(:disease_name,:in_treatment,:when_onset)
  end

  def set_medical_history
    @medical_history = current_user.medical_histories.find(params[:id])
  end
end
