require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validation tests" do
    it 'title present' do
      article = Article.new(title:'', description:'divyansh@gmail.com').save
      expect(article).to eq(false)
    end

    it 'minimum length of description' do
      article = Article.new(title:'Boards Examination', description:'class-12').save
      expect(article).to eq(false)
    end
    

  end

end
