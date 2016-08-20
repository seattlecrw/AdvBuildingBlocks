#! /usr/bin/ruby

# define methods
def bubble_sort(arr)
  loop do
    swaps = 0 # set up counter
    i = 0 # set up index
    while i < arr.length - 1
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swaps += 1
      end
      i += 1
    end
    break if swaps == 0
  end
  return arr
end

def bubble_sort_by(arr)
  loop do
    swaps = 0 # set up counter
    i = 0 # set up index
    while i < arr.length - 1
      if yield(arr[i], arr[i + i]) > 0
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swaps += 1
      end
      i += 1
    end
    break if swaps == 0
  end
  return arr
end


# call methods to print tests
test1 =  bubble_sort([4,3,78,2,0,2])
puts test1.inspect

test2 = bubble_sort_by(["hi","hello","hey"]) do |left,right|
          left.length - right.length
        end
puts test2.inspect
