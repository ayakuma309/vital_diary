# == Schema Information
#
# Table name: medical_histories
#
#  id           :bigint           not null, primary key
#  disease_name :string           not null
#  in_treatment :boolean          not null
#  when_onset   :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_medical_histories_on_user_id  (user_id)
#
class MedicalHistory < ApplicationRecord
  belongs_to :user

  validates :disease_name , presence: true
  validates :when_onset , presence: true
  validates :in_treatment, inclusion: {in: [true, false]}

  scope :is_during_treatment, -> (value){ where(in_treatment: value).order(when_onset: :asc) }
end
