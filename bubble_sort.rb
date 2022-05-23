def bubble_sort(arr)
  arr.to_enum.with_index.reverse_each do |_, outer_index|
    swaps = {}
    break if outer_index < 1

    arr.each_with_index do |number, inner_index|
      break unless inner_index + 1 < arr.length

      if number > arr[inner_index + 1]
        arr[inner_index] = arr[inner_index + 1]
        arr[inner_index + 1] = number
        swaps[inner_index] = "swapped"
      end
    end
    break if swaps.empty?
  end
  arr
end

# random_array = Array.new(8) { rand(1...10) }
bubble_sort(random_array)
