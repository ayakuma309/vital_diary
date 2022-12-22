# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string
#  email            :string           not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :vitals, dependent: :destroy
  has_many :defecations, dependent: :destroy
  #便秘機能
  has_many :defecation_vitals, through: :defecations, source: :vital

  has_many :comments, dependent: :destroy

  has_one :profile, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  #排便記録
  def defecation_by?(vital)
    defecations.exists?(vital_id: vital.id)
  end

  def defecation(vital)
    defecations.create!(vital_id: vital.id)
  end

  def undefecation(vital)
    defecation = defecations.find_by!(vital_id: vital.id)
    defecation.destroy!
  end

  def search_vitals(keyword)
    return vitals.order(day: :desc) unless keyword.present?

    vitals.search_information(keyword)
  end

  def user_constipation
    if vitals.vital_three_days.exists?
      defecation_vitals.vital_three_days
    end
  end

  #プロフィール
  def prepare_profile
    profile || build_profile
  end
end
