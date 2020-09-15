# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sub_id     :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_sub_id   (sub_id)
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
    validates :content,:title,:url,:sub_id,:user_id, presence: true
    validates :url, uniqueness: true
    
    belongs_to :user, # author
    foreign_key: :user_id,
    class_name: :user

    belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

end
