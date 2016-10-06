card_number = "4929735477250543"

#VALID: 4929735477250543, 5541808923795240, 4024007136512380, 6011797668867828
#INVALID: 5541801923795240, 4024007106512380, 6011797668868728

valid = false

#step 1: card_number => array with multiple elements
credit = card_number.split(//)
#step 2: changes numbers in array to integers then shovels them into new_array  
new_array = []

credit.each do |num|
     new_array << num.to_i
 end

 p new_array
#step 3: doubles every other index in the array and places it in a new array (doubled_array) 
doubled_array = new_array.map.with_index do |num, index|
                    if index % 2 == 0 #modulo index(0) / 2 has a remainder of 0, so num at index 0 is doubled
                        num * 2
                    else
                        num
                    end
                end

p doubled_array
#step 4: for numbers greater than or equal to 10, adds the sum of the digits together and places it in a new array

add_array = doubled_array.map do |num|
                if num >= 10
                    num = num.to_s.chars #a number 10 will look like ["1", "0"]
                    num = num[0].to_i + num[1].to_i # adds 1 and 0 to get one and defines that as a new num
                    num #new number 1 [1+0]
                else
                    num
                end
            end

p add_array
#step 5: sum all the numbers (excluding index[-1]) together, take second digit of summed number and subtract it from 10. that 
#sum should be = index[-1] in order for the card number to be valid. If index[-1] != add_array.sum then the number is invalid.

sum_array = []

add_array.each do |num|
    sum_array << num.to_i
end

p sum_array
#numbers in sum_array are integers
# If the total modulo 10 is equal to 0 (if the total ends in zero) then the number is valid according to the Luhn formula; else it is not valid.

modulo = sum_array.inject(0) { |result, element| result + element }
            if modulo.to_s.include?("0")
                puts "The modulo is #{modulo}."
                puts "This credit card number is valid."
            else
                puts "The modulo is #{modulo}."
                puts "This credit card number is invalid."
            end

"The modulo is #{modulo}."
#modulo is already an integer. if the second element of the modulo is 0, then the number is valid. <= doesn't work for the invalid side
# have to change modulo back to a string and then use .include? method to differentiate modulo

# cd enums-exercises
# remote: Permission to turingschool/enums-exercises.git denied to Dpalazzari.
# fatal: unable to access 'https://github.com/turingschool/enums-exercises.git/': The requested URL returned error: 403