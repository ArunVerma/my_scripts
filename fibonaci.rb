# Below class is for showing how to take inputs from user
# This will take 3 inputs from user and will create the fibonaci series
# input 1 : first number of the series
# input 2 : second number of the series
# input 3 : length of the series
# return print the series array
# Program will start on creating new object of FibonaciSeries class.
# FibonaciSeries.new

class FibonaciSeries
  def initialize
    @first_num = nil
    @second_num = nil
    @series_length = nil
    @series = nil
    ask_first_number_input
  end

  def ask_first_number_input
    puts "Please enter first number of the series: "
    @first_num = gets.chomp.strip
    if @first_num.nil? || @first_num.empty?
      ask_first_number_input
    else
      @first_num = @first_num.to_i
      ask_second_number_input
    end
  end

  def ask_second_number_input
    puts "Please enter second number of the series: "
    @second_num = gets.chomp.strip
    if @second_num.nil? || @second_num.empty?
      ask_second_number_input
    else
      @second_num = @second_num.to_i
      ask_series_length
    end
  end

  def ask_series_length
    puts "Please enter length of the series greater than 2: "
    @series_length = gets.chomp.strip
    if @series_length.nil? || @series_length.empty?
      ask_series_length
    else
      @series_length = @series_length.to_i
      ask_series_length if @series_length < 3
      create_and_display_series
    end
  end

  def create_and_display_series
    puts "Thank you for your inputs. Creating your desired series..."
    num = 2
    @series = [@first_num, @second_num]
    while num < @series_length do
      next_num = @series[-2] + @series.last
      @series.push(next_num)
      num += 1
    end
    puts "Your desired series is:-"
    puts @series
    puts "Do you want to test more?"
    puts "Enter 'yes' to continue, anything else to exit"
    answer = gets.chomp
    if answer == 'yes'
      FibonaciSeries.new
    else
      puts "Bye Bye.."
    end
    exit
  end
end