# frozen_string_literal: true

# apply luhn algo
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit

    # Get check dig
    check_dig = nums_a[-1]

    # Remove check digit
    nums_a.pop

    varify_num = luhn_varify_num(nums_a)

    # Mutiply with 9 & mod by 10 & check true or false
    varify_num == check_dig
  end

  def luhn_varify_num(nums_a)
    check_nums = nums_a.reverse

    # Multiply and sum the numbers
    sum = check_nums.each_with_index.reduce(0) do |start, (dig, idx)|
      if idx.even? && ((dig * 2) < 10) then start + dig * 2
      elsif idx.even? then start + ((dig * 2) - 9)
      else start + dig end
    end

    # Mutiply with 9 & mod by 10
    sum * 9 % 10
  end
end
