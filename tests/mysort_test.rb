require 'test/unit'
require './sort'
class MysortTest < Test::Unit::TestCase
	def test_mergesort
		my_array = [14, 10, 2, 22, 58, 45, 6]
		sorted_array = Mysort.new.mergesort(my_array)
		assert_equal(sorted_array, my_array.sort)
	end

	def test_merge
		exp_array = [2, 10]
		# case 1
		left_array = [10]
		right_array = [2]
		sorted_array = Mysort.new.merge(left_array, right_array)
		assert_equal(sorted_array, exp_array)

		# case 2
		left_array = [2]
		right_array = [10]
		sorted_array = Mysort.new.merge(left_array, right_array)
		assert_equal(sorted_array, exp_array)
	end
end