# == Schema Information
#
# Table name: poems
#
#  id         :bigint           not null, primary key
#  complete   :boolean          not null
#  stanzas    :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_poems_on_user_id  (user_id)
#
class Poem < ApplicationRecord
    validates :title, :stanzas, presence: true
    validates :complete, inclusion: {in: [true,false]}
    belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
end
