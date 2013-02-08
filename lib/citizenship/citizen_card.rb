module Citizenship
  #http://www.cartaodecidadao.pt/images/stories/Algoritmo_Num_Documento_CC.pdf
  def self.valid_citizen_card!(number)
    raise ArgumentError, 'number can\'t be nil' if number.nil?

    number = number.delete(' ')

    raise Error, 'Invalid size' if number.size != 12

    double_digit = false

    check_digit = number.reverse.split('').map do |element|
      #switch letters for the value in the conversion table (see 2.3. on Algoritmo_Num_Documento_CC.pdf)
      is_number?(element) ? element : ('a'..'z').to_a.find_index(element.downcase) + 10
    end.map(&:to_i).map do |digit|
      begin
        if double_digit #starting on the 2nd value double every value steping by 2
          value = digit * 2
          value >= 10 ? value - 9 : value #If the doubling result is 10 or more, subtract 9
        else
          digit
        end
      ensure
        double_digit = not(double_digit)
      end
    end.reduce(:+) #sum everything

    raise Error, "Invalid check digit" if check_digit % 10 != 0
    true
  end

  def self.valid_citizen_card?(number)
    valid_citizen_card!(number)
  rescue Error
    false
  end
end