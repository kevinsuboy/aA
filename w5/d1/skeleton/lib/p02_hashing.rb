class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # self.length.hash
    self.length.times.map{|i| self[i].hash ^ i.hash}.sum
  end
end

class String
  def hash
    # each char, convert char val to int val
      # hash the int, sum the hash
      weird_arr = []
      self.each_char.with_index{|char, index| weird_arr << (char.ord.hash ^ index.ord.hash)}
      return weird_arr.sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.each.map {|k,v| k.hash ^ v.hash}.sum
  end
end
