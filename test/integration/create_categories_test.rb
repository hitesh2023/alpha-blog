require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new Category form and create new Category" do 
		get new_category_path
		assert_template 'categories/new'

		assert_difference 'Category.count', 1 do 
			post categories_path, params: { category: {name: "sports" } } # handle form submission
			follow_redirect!
		end

		assert_template 'categories/index'
		assert_match "sports", response.body
	end
end