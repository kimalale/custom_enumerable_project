module Enumerable
  # Your code goes here
  def my_all?

    all_match = nil

    each do |value|
      all_match = yield value
      break if !all_match
    end

    all_match
  end

  def my_any?
    any_match = nil

    each do |value|
      any_match = yield value
      break if any_match
    end

    any_match
  end

  def my_count
    counter = 0

    if !block_given?
      each do |value|
      counter += 1
      end
      return counter
    end

    each do |value|
      counter += 1 if yield value
    end

    counter
  end

  def my_each_with_index
    index = 0
    each do |value|
      yield value, index
      index += 1
    end
  end

  def my_inject(initial_value)
    operand = initial_value
    each do |value|
      operand = yield operand, value
    end
    operand
  end

  def my_map
    new_array = []
    each do |element|
      new_array << yield(element)
    end
    new_array
  end

  def my_none?
    none_match = false
    each do |value|
      none_match = yield value
      break if none_match
    end

    !none_match
  end

  def my_select
    filtered_array = []
    each do |element|
      filtered_array << element if yield(element)
    end
    filtered_array
  end

end




# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
  def my_each
    each do |value|
      yield value
    end
  end

end
