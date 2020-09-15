# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :string           not null
#
# Indexes
#
#  index_subs_on_user_id  (user_id)
#
class Sub < ApplicationRecord
    validates :title,:description, presence: true
    
    belongs_to :user, # moderator
    foreign_key: :user_id,
    class_name: :User

    has_many :posts,
    # has_many :post_subs,
    foreign_key: :sub_id,
    class_name: :Post

    # has_many :posts,
    # through: :post_subs, # brings us to post
    # source: :post
end
