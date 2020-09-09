# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the presence validation of
  # likeable and user out here.
  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type] }

  belongs_to :likeable, polymorphic: true
  belongs_to :user
end
