require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.new(name:"Sports")
    @category.save
    @category2 = Category.new(name:"Travel")
    @category2.save
  end

  test "should show categories" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text:@category.name
    assert_select "a[href=?]", category_path(@category2), text:@category2.name
  end


end
