
### Find uniq element and number of its occurance from array
arr = [1,2,2,3,4,5,5,5,6,6,7,7]
arr_hs = {}
arr.each do |n|
	nkey = n.to_s
	if arr_hs.keys.include?(nkey)
		arr_hs[nkey] += 1
	else
		arr_hs[nkey] = 1
	end
end


### replace elements of the array as below
# if  n % 3 == 0 -> 'Fiz'
# if  n % 4 == 0 -> 'Foo'
# if  n % 5 == 0 -> 'Buz'
# or if divisible by 3 & 4 FizFoo or 4 & 5 FooBuz or all 'FizFooBuz'

arr2 = [1,3,4,5,7,9,15,21, 60]
arr2.each_with_index do |n, i|
	arr2[i] = ''
	if(n%3 == 0)
		arr2[i] = arr2[i]+'Fizz'
	if(n%4 == 0)
		arr2[i] = arr2[i]+'Foo'
	if(n%5 == 0)
		arr2[i] = arr2[i]+'Buzz'
end

		
# Find nth repeated number
def nth_repeated_element(array, n)
    arr_hash = {}
    count = 0
    array.each do |a|
       if arr_hash.keys.include?(a)
           arr_hash[a] = arr_hash[a] + 1
           if(arr_hash[a] == 2)
               count += 1
               if count == n # return element when found
                   return a
							 end
           else
               next
           end
       else
            arr_hash[a] = 1
       end
    end
end

p nth_repeated_element([3,4,3,4], 1) # 3
p nth_repeated_element([3,4,3,4], 2) # 4

p nth_repeated_element([3,4,4,3], 1) # 4

puts nth_repeated_element([3,4,4,4,3], 2) # 3
