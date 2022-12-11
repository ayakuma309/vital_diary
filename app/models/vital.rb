# == Schema Information
#
# Table name: vitals
#
#  id                :bigint           not null, primary key
#  day               :datetime         not null
#  high_bp           :integer          not null
#  low_bp            :integer          not null
#  oxygen_saturation :integer          not null
#  pulse             :integer          not null
#  temperature       :float            not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_vitals_on_user_id  (user_id)
#
class Vital < ApplicationRecord
  belongs_to :user
  has_many :defecations, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :day , presence: true
  validates :high_bp , presence: true
  validates :low_bp , presence: true
  validates :pulse , presence: true
  validates :temperature , presence: true
  validates :oxygen_saturation, presence: true, numericality: { greater_than_or_equal_to: 90 }
end
