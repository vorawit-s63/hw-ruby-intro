# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0
  arr.each {|number| sum += number} #บวกเลข
  return sum
end

def max_2_sum arr
  sum = 0
  if arr.length == 1
    arr.each {|number| sum += number} #ถ้า array = 1 ให้ return ค่าตัวเองออก
    return sum
  else
    arr.sort! do |first,second|
      second <=> first #จัดเรียง array จากมากไปน้อย
    end
    arr.select {|number| sum = arr[0] + arr[1]} #บวกเลข 2 อันที่มากที่สุด
    return sum
  end
end

def sum_to_n? arr, n
  if arr.length >= 2
    arr.each do |i| 
      arr.each do |y|
        if i == y #ถ้าเท่ากับตัวมันเองจะข้ามไป
        elsif i+y == n #ถ้า array ตัวที่ 1 , 2 เท่ากับ n ที่ส่ง parameter มาจะให้ return true
          puts "#{i} : #{y}"
          return true
        end
      end
    end
    return false
  else
    return false #ถ้า array น้อยกว่าสองตัวที่ต้องการจะเป็น false เสมอ
  end
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, #{name.to_s}"
end

def starts_with_consonant? s
  # YOUR CODE HERE
  consonant = ['A', 'E', 'I', 'O', 'U']
  if s.length == 0 #ถ้า empty ให้ false
    return false
  end
  x = ('A'..'Z').select {|letter| letter == s[0].upcase}
  if x.length == 0 #ถ้าไม่ใช่ A-Z ให้ false
    return false
  end
  consonant.each do |con|
    if s[0].upcase == con #ถ้าเป็นสระ AEIOU ให้ false
      return false 
    end
  end
  return true #ไม่ใช่สระ ให้ true
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s.length == 0 #ถ้า empty ให้ false
    return false
  end
  array = s.split("")
  array.each do |n|
    unless n == '1' || n == '0' #ถ้าไม่มี 1 0 เลย ให้ false
      return false
    end
  end
  if s.to_i % 4 == 0 #ถ้าเป็นเลขหาร 4 ลงตัว multiple of 4 ให้ true
    return true
  else
    return false
  end
end

# Part 3

class BookInStock
  attr_accessor :isbn #สามารถ input / write ค่าได้
  attr_accessor :price
  def initialize(isbn,price)
    @isbn = isbn
    @price = price
    raise ArgumentError if @isbn.nil? || @isbn.length == 0 #ถ้า isbn ว่าง และความยาวเท่ากับ 0 ให้ error
    raise ArgumentError if @price == nil || @price <= 0 #ถ้าไม่มี price หรือ price ติดลบให้ error
  end

  def price_as_string
    if price % 1 == 0 #ถ้า price เป็นจำนวนเต็มให้เติม .00
      return "$#{price.floor}.00" 
    end
    arr = price.to_s.split(".") #แบ่งตัวเต็มกับหน่วยแล้วใส่ .
    if arr[1].length == 1 #ถ้าหน่วยมีตัวเดียวให้เพิ่ม 0
      return "$#{price}0"
    end
    return "$#{price.round(2)}"
  end
end
