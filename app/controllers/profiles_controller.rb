class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
    @current_medical_history = current_user.medical_histories.is_during_treatment(true)
    @medical_histories = current_user.medical_histories.is_during_treatment(false)
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)

    if @profile.save
      redirect_to profile_path, success: t('defaults.message.created', item: Profile.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Profile.model_name.human)
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :blood_type,
      :important_term,
      :gender,
      :birthday,
      :weight
    )
  end
end
