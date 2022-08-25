def range(start, finish)
    return [] if finish < start
    range(start, finish - 1) << finish
end

def exponentiation(base, power)
    return base if power == 1 
    return 1 if power == 0 
    exponentiation(base, power - 1) * base 
end 

def exponentiation2(base, power)
    return base if power == 1
    return 1 if power==0
    expo = exponentiation2(base, power / 2)
    if power.even? 
        expo **2 
    else 
        base * exponentiation2(base, (power -1) / 2) **2
    end 
end

class Array

    def deep_dup
    #array contain multidmentional array
        arr_copy = self.map do |ele|
            if ele.is_a?(Array)
                ele.deep_dup
            else
                ele
            end
        end
        arr_copy
    end
end

def fib(n)
    #returning array
    return [] if n == 0
    return [0] if n == 1 
    return [0,1] if n == 2 
    first = fib(n-1) 
    first << first[-1] + first[-2]
end

def bsearch(arr, target)
    return nil if arr.empty?
    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid+1..-1]
    return mid if arr[mid] == target
    if target < arr[mid]
        bsearch(left, target)
    else
        edge = bsearch(right, target)
        mid + 1 + edge if edge
    end
end

def mergesort(array) #doc => CS50
    return array if array.length <= 1 
    # array divide by two 
    #first array and second array 
    #mergesort(first) mergesort(second)
    #check if first is greater or second
        #merge(second, first)
        #merge(first, second)
    mid = array.length / 2
    # first = mergesort(array[0...mid]) #.take before index 
    first = mergesort(array.take(mid))
    second = mergesort(array.drop(mid))
    # second = mergesort(array[mid..-1]) #.drop before index 
    merge(first,second)
end 

def merge(first, second)
    merged = []
    until first.empty? || second.empty?
        if first[0] < second[0]
            merged << first.shift
        else
            merged << second.shift
        end
    end
    merged + first + second
end

# def subsets(arr)
#     return [[]] if arr.length == 0
#     subsets(arr[0...-1]) + add_subarr(arr)
# end 

# def add_subarr(arr)
#     return [[1]] if arr.length == 1
#     new_arr = [[arr[-1]]]

#     (0...arr.length-1).each do |i|
#         new_arr << [arr[i], arr[-1]]
#     end 

#     new_arr << arr
# end

def subsets(arr)
    return [[]] if arr.length == 0
    subs = subsets(arr[0...-1])
    rest = subs.map {|subarray| subarray + [arr[-1]] }
    subs + rest 
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# p subsets([1, 2, 3,4])
require 'byebug'

def permutation(array)
    return [[]] if array.length == 0 
    subs = permutation(array[0...-1])
    # debugger
    solution = []
    subs.each do |subarray| # 2
        (0...array.length).each do |i| # 3
            solution << (subarray[0...i] + [array[-1]] + subarray[i..-1])
        end
    end
    return solution
end 


# def greedy_make_change(num, array) #contain types of coins 
        #array[0] num - #of array[0] = result
        #we have to find all permutation of the coins where the permutation length is the smallest 
        #greedy_make_change(result, array[1..-1])

def make_better_change

end
