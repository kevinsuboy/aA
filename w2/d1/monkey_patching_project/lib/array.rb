# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    1.0*self.sum / self.length
  end

  def median
    return nil if self.length == 0
    self.sort!
    if self.length % 2 == 0
        # even
        1.0*(self[self.length/2]+self[self.length/2-1])/2
    else
        # odd
        self[self.length/2]
    end
  end
  def counts
    hash = Hash.new(0)
    self.each {|num| hash[num]+=1}
    hash
  end
  def my_count(n)
    hash = self.counts
    hash[n]
  end
  def my_index(num)
    self.each_with_index do |ele, i|
        return i if ele == num
    end
    nil
  end

  def my_uniq
    hash = self.counts
    hash.keys
  end

  def my_transpose
    new_arr = Array.new(self.length) {Array.new(self[0].length)}
    (0...self.length).each do |i|
        (0...self[i].length).each do |j|
            new_arr[j][i] = self[i][j]
        end
    end
    new_arr
  end 
end
