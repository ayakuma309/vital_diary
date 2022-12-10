# == Schema Information
#
# Table name: defecations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  vital_id   :bigint           not null
#
# Indexes
#
#  index_defecations_on_user_id               (user_id)
#  index_defecations_on_user_id_and_vital_id  (user_id,vital_id) UNIQUE
#  index_defecations_on_vital_id              (vital_id)
#
class Defecation < ApplicationRecord
  belongs_to :user
  belongs_to :vital

  validates :user_id, uniqueness: {scope: :vital_id}
  #排便記録
  def defecation_by?(vital)
    defecations.exists?(vital_id: vital.id)
  end
end
