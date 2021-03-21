class HomeController < ApplicationController
  def new
    require 'net/http'
    
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=32452&distance=100&API_KEY=850B5FE2-7605-4D60-A852-BABB6E6597CE'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    if @output.empty?
      @final_output = "Error"
    elsif !@output
      @final_output = "Error"

    else
      @final_output = @output[0]['AQI']
    end
      
    if @final_output == "Error"
      @api_color = "gray"
    elsif  @final_output <=50
      @api_color = "green"
    elsif  @final_output >=51 && @final_output <=100
      @api_color = "yellow"
    elsif  @final_output >101 && @final_output <=200
      @api_color = "orange"
    elsif  @final_output <=201 && @final_output <=300
      @api_color = "red"
    elsif  @final_output <=301 && @final_output <=400
      @api_color = "purple"
    elsif  @final_output <=401 && @final_output <=500
      @api_color = "maroon"
    end

  end
  def show
    puts "HI!!!!"
  end
end
