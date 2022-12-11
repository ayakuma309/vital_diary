# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  vital_id   :bigint           not null
#
# Indexes
#
#  index_comments_on_user_id   (user_id)
#  index_comments_on_vital_id  (vital_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vital_id => vitals.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vital

  validates :content, presence: true
end
