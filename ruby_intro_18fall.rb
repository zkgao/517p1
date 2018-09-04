# Part 1

def unique_array(a)
  return a.uniq
end

def two_sum?(a,n)
  # ADD YOUR CODE HERE
  for i in 0...a.length
    for j in i+1...a.length
      if(a[i]+a[j]==n)
        return true;
      end
    end
  end
  false
end

def group_anagrams(a)
  res=Hash.new
  a.each do |w|
    key=w.split('').sort.join
     if res.has_key?(key) then res[key].push(w)
     else res[key]=[w]
     end
  end
  res.values
end


# Part 2

def palindrome?(s)
  # ADD YOUR CODE HERE
  s = s.downcase
  return true if s == s.reverse
  return false
end

def remove_and_append_vowels(s)
  # ADD YOUR CODE HERE
  vowels = 'aeiou'.chars
  vowels_found = s.chars.select{|char| vowels.include? char.downcase}
  s_with_vowels_appended = (s.chars - vowels_found + vowels_found).join('')
  return s_with_vowels_appended
end

def highest_frequency_word(s)
  # ADD YOUR CODE HERE
  counter = Hash.new
  s = s.downcase.gsub(/[^a-z0-9\s]/i, '')
  s.split(' ').each do |word|
    if counter.has_key? word
      counter[word] += 1
    else
      counter[word] = 1
    end
  end
  max_freq_word = counter.key(counter.values.max)
  return max_freq_word
end

# Part 3

class Book
  # ADD YOUR CODE HERE
    def initialize(name, price)
      raise ArgumentError if (name==nil || name == "") || (price==nil || price <=0)
      @name=name
      @price=price
    end
    attr_accessor :name, :price
    def formatted_price()
      dollar_str, cents_str = @price.to_s.split('.')
      if cents_str != nil && cents_str.length == 1 && cents_str[0] != 0
        cents_str += "0"
      end
      dollar, cent = dollar_str.to_i, cents_str.to_i
      ans="only "
      if dollar>1
         ans+="#{dollar} dollars"
      elsif dollar==1
        ans+="1 dollar"
      end
      if cent >1
        if dollar>0
          ans+=" and "
        end
        ans+="#{cent} cents"
      elsif cent==1
        if dollar >0
          ans+=" and "
        end
        ans+="1 cent"
      end
      ans
    end
end


#################### test#########################
correct = 0
wrong = 0
unique_array([1,2,3,-4,-5,1,3,2]) == [1,2,3,-4,-5] ? correct+=1 : wrong+=1
print "#{correct} #{wrong}\n"
two_sum?([-1,-2,4,4],2) == true ? correct+=1 : wrong+=1
print "#{correct} #{wrong}\n"
group_anagrams(['elbow','cried','below','cider']) == [['elbow','below'],['cried','cider']] ? correct+=1 : wrong+=1
print "#{correct} #{wrong}\n"
palindrome?("pop") == true ? correct+=1 : wrong+=1
print "#{correct} #{wrong}\n"
remove_and_append_vowels("pray") == 'prya' ? correct+=1 : wrong+=1
print "#{correct} #{wrong}\n"
highest_frequency_word("She says she got married.") == 'she' ? correct+=1 : wrong+=1
print "#{correct} #{wrong}\n"
b2 = Book.new("The Great Gatsby", 1.01)
#b2.formatted_price=="only 17 dollars and 0 cents" ? correct+=1 : wrong+=1
p b2.formatted_price
p group_anagrams([])
p two_sum?([],3)

print "#{correct} #{wrong}\n"