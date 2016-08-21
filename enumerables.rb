#!  /usr/bin/ruby

# adjust Enumerable module
module Enumerable
  def my_each
    return self unless block_given?
    for i in 0...self.length
      yield(self[i])
    end
    return self
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0...self.length
      yield(self[i], i)
    end
    return self
  end

  def my_select
    return self unless block_given?
    new_arr = []
    self.my_each do |item|
      if yield(item)
        new_arr.push(item)
      end
    end
    return new_arr
  end

  def my_all?
    if block_given?
      # process block
      filt = self.my_select { yield }
      if filt.length == self.length
        return true
      else
        return false
      end
    else
      # check for 'truthiness'
      trues = 0
      self.my_each do |item|
        if item
          trues += 1
        end
      end
      if trues == self.length
        return true
      else
        return false
      end
    end
  end

  def my_any?
    if block_given?
      filt = self.my_select { yield }
      if filt.length > 0
        return true
      else
        return false
      end
    else
      trues = 0
      self.my_each do |item|
        if item
          trues += 1
        end
      end
      if trues > 0
        return true
      else
        return false
      end
    end
  end

  def my_none?
    if block_given?
      filt = self.my_select { yield }
      if filt.length == 0
        return true
      else
        return false
      end
    else
      trues = 0
      self.my_each do |item|
        if item
          trues += 1
        end
      end
      if trues == 0
        return true
      else
        return false
      end
    end
  end

  def my_count
    return self unless block_given?
    filt = self.my_select { yield }
    return filt.length
  end

  def my_map(&proc)
    new_arr = []
    if proc
      self.my_each do |item|
        new_arr.push(proc.call(item))
      end
    elsif block_given?
      self.my_each do |item|
        new_arr.push(yield(item))
      end
    else
      return self
    end
    return new_arr
  end

  def my_inject(initial = 0)
    self.myeach do |item|
      initial = (yield initial, item)
    end
    return initial
  end

  def multiply_els
    answer = self.my_inject(1) { |initial, item| initial * item}
    return answer
  end
end
