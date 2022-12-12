class DefecationsController < ApplicationController

  def create
    @vital = Vital.find(params[:vital_id])
    current_user.defecation(@vital)
  end

  def destroy
    @vital = Vital.find(params[:vital_id])
    defecation = current_user.undefecation(@vital)
  end
end
