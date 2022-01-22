module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield i
    end  
  end

  def my_each_with_index
    y = 0
    for i in self
      yield i, y
      y += 1
    end
  end

  def my_select
    result = is_a?(Hash) ? {} : []
    for el in self
      if yield el
        is_a?(Hash) ? result.store(el[0], el[1]) : result << el
      end
    end
    result
  end
  
  def my_all?
    my_each {|i| return false unless yield i}
    true
  end

  def my_any?
    my_each { |i| return true if yield i}
    false
  end

  def my_none?
    my_each { |i| return false if yield i}
    true
  end

  def my_count(item = nil)
    count = 0
    if block_given?
      my_each { |i| count += 1 if yield i }
    elsif !item.nil?
      my_each { |i| count += 1 if i == item }
    else
      count = self.size
    end
    count
  end

  def my_map(jo = nil)
    nr = []
    my_each { |i| nr << (jo ? jo.call(i) : (yield i)) }
    return nr
  end

  def my_inject
    str_val = self
    my_each { |i| str_val = (yield str_val, i)}
    return str_val
  end  

end
