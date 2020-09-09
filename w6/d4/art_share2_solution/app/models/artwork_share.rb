# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default(FALSE)
#
class ArtworkShare < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the validation of artwork
  # and viewer out here.
  validates :artwork_id, uniqueness: { scope: :viewer_id }
  validates :favorite, inclusion: { in: [true, false] }

  belongs_to :artwork
  belongs_to :viewer, class_name: 'User'
end
