require 'rails_helper'

describe User, type: :model do

  context "is able to review many restaurants" do
    it { is_expected.to have_many :reviewed_restaurants}
  end

end
