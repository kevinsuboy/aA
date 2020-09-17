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
require 'rails_helper'

RSpec.describe Poem, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:stanzas) }
  it { should allow_value(true, false).for(:complete) }
  it { should belong_to(:author) }
end
