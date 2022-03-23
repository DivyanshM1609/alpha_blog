require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation" do
    it "unique category" do
      category = Category.new(name:"Furniture").save
      category1 = Category.new(name:"Furniture").save
      expect(category1).to eq(false)
    end
  end
  context "authentication" do
    it "only admin can create new category" do
      category = Category.new(name:"Furniture").save
      expect(category).to eq(true)
    end

  end

end

