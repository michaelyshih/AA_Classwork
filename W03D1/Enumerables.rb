class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    # return_value = [1, 2, 3].my_each do |num|
    #     puts num
    # end.my_each do |num|
    #     puts num
    # end
    # #    # => 1
    # #        2
    # #        3
    # #        1
    # #        2
    # #        3

    # p return_value  # => [1, 2, 3]

    def my_select(&prc)
        new_array = []
        self.my_each do |ele|
            if prc.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []
    # p a


    def my_reject(&prc)
        new_array = []
        self.my_each do |ele|
            if !prc.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    # a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]
    # p a

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        false
    end

    # p a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false

    def my_all?(&prc)
        self.my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        true
    end

    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true

    def my_flatten
        new_arr = []
        return [] if self.length == 0
        if self.length > 0
            self.my_each do |ele|
                if ele.class == Array
                    new_arr += ele.my_flatten
                else
                    new_arr << ele
                end
            end
        end
        new_arr
    end

    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

require "byebug"
    def my_zip(*any)
        subs = self.length
        new_array = Array.new(subs){[]}
        (0...subs).each do |i|
            new_array[i] << self[i]
            (0...any.length).each do |j|
                new_array[i] << any[j][i]

            end
            new_array[i] << nil until new_array[i].length >= subs
        end
        new_array
    end

    # a = [ 4, 5, 6 ]
    # b = [ 7, 8, 9 ]
    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # c = [10, 11, 12]
    # d = [13, 14, 15]
    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

    def my_rotate(num = 1)
        # debugger
        new_array = self
        if num >= 1
            num.times do
                new_array = new_array[1..-1] + [new_array[0]]
            end
        end

        if num < 1
            num *= -1
            num.times do
                new_array = [new_array[-1]] + new_array[0..-2]
            end
        end
        new_array
    end

    # a = [ "a", "b", "c", "d" ]
    # p a.my_rotate         #=> ["b", "c", "d", "a"]
    # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]

    # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

    def my_join(arg = "")
        new_string = ""
        # if arg != ""
        self.each do |ele|
            new_string += ele + arg
        end
        # else
        #     self.split(arg)
        # end
        new_string.chomp(arg)
    end

    # a = [ "a", "b", "c", "d" ]
    # p a.my_join         # => "abcd"
    # p a.my_join("$")    # => "a$b$c$d"

    def my_reverse
        new_arr = []
        (1..self.length).each do |i|
            new_arr << self[-i]
        end
        new_arr
    end

    # p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    # p [ 1 ].my_reverse               #=> [1]
end
