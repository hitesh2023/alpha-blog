require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "sports")
	end

	test "category should be valid" do 
		assert @category.valid?
	end

	test "name should be unique" do 
		@category.save
		category2 = Category.new(name: "sports")
		assert_not category2.valid?
	end

	test "name should be present" do 
		@category.name = ''
		assert_not @category.valid?
	end

	test "name should be minimum 3 characters long" do 
		@category.name ='ab'
		assert_not @category.valid?
	end

	test "name should be maximum 20 characters long" do 
		@category.name ='1234567891234567812345678'
		assert_not @category.valid?
	end

end