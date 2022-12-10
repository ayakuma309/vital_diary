class DefecationsController < ApplicationController

  def create
    vital = Vital.find(params[:vital_id])
    current_user.defecation(vital)
    redirect_back fallback_location: vitals_path, success: t('.success')
  end

  def destroy
    vital = Vital.find(params[:vital_id])
    defecation = current_user.undefecation(vital)
    redirect_back fallback_location: vitals_path, success: t('.success')
  end
end
