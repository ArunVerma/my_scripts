class Mysort
	def mergesort(list)
	  return list if list.size <= 1
	  mid   = list.size / 2
	  puts "mid... #{mid}"
	  left  = list[0, mid]
	  right = list[mid, list.size]
	  merge(mergesort(left), mergesort(right))
	end

	def merge(left, right)
	  sorted = []
	  puts "inside merge..."
	  until left.empty? || right.empty?
	    if left.first <= right.first
	      sorted << left.shift
	    else
	      sorted << right.shift
	    end
	  end
	  sorted.concat(left).concat(right)
	end
end

myArray = [14, 10, 2, 22, 58, 45, 6]
puts Mysort.new.mergesort(myArray)

=begin STEPS / ALGO =======================

1. Devide the array in two halves.
2. Pick first half and devide it again in two till it can not be devided any further.
3. Compare and merge all the elements of the all the halfs of first one.
4. Repeat step 2 & 3 for second half.
5. Finally first and second half gets merged automatically in sorted order as per above steps.(1, 2 and 3)

Take a look at the below log and output -----------------------------------

mid... 3
mid... 1
mid... 1
inside merge...
inside merge...
mid... 2
mid... 1
inside merge...
mid... 1
inside merge...
inside merge...
inside merge...
[2, 6, 10, 14, 22, 45, 58]

=end