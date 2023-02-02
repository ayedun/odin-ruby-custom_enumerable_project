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
    return self.to_enum unless block_given?

    for item in self
      yield item
    end
  end


  def my_each_with_index
    return self.to_enum unless block_given?
    for i in 0..self.length-1
      yield self[i], i
    end
    self
  end

  def my_select
    result = []
    return self.to_enum unless block_given?

    for element in self
      if yield(element)
        result<< element
      end
    end
    result
  end

  def my_all?
    state = true
    for el in self
      if !(yield(el))
        state = false
      end
    end 
    return state
  end

  def my_any?
    state = false
    for el in self
      if yield(el)
        state=  true
      end
    end
    state
  end
  
  def my_none?
    state = true
    for el in self
      if yield(el)
        state = false
        break
      end
    end
    state
  end

  def my_count
    count = 0
    return self.length unless block_given?
    for el in self
      if yield(el)
        count += 1
      end
    end
    count
  end
  def my_map
    result = []
    for el in self 
      result<<yield(el)
    end
    result
  end

  def my_inject(initial_value)
    total = initial_value

    for el in self
      total = yield total, el
    end
    total
    
  end
  







end
