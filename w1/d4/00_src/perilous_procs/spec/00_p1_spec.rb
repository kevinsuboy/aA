require "phase1"

describe "Phase 1" do
  describe "some?" do
    it "description" do
      expect {some?([3, 1, 11, 5]) { |n| n.even? }}.to_not raise_error
    end
    it "description" do
      expect(some?([3, 1, 11, 5]) { |n| n.even? }                                ).to eq(false)
      expect(some?([3, 4, 11, 5]) { |n| n.even? }                                ).to eq(true)
      expect(some?([8, 2]) { |n| n.even? }                                       ).to eq(true)
      expect(some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } ).to eq(false)
      expect(some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } ).to eq(true)
      expect(some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        ).to eq(true)
    end
  end
  describe "exactly?" do
    it "description" do
    end
    it "description" do
    end
  end
  describe "filter_out" do
    it "description" do
    end
    it "description" do
    end
  end
  describe "at_least?" do
    it "description" do
    end
    it "description" do
    end
  end
  describe "every?" do
    it "description" do
    end
    it "description" do
    end
  end
  describe "at_most?" do
    it "description" do
    end
    it "description" do
    end
  end
  describe "first_index?" do
    it "description" do
    end
    it "description" do
    end
  end
end
