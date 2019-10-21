
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
