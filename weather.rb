require 'http'

while true
  p "Please enter your city:"
  city = gets.chomp
  p "Do you prefer Celsius or Farenheit?"
  answer = gets.chomp
  if answer == "Celsius"
    units = "metric"
  elsif answer = "Farenheit"
    units = "imperial"
  end

  report = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=#{units}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")

  # pp "The weather today will be mostly: " + report.parse(:json)["weather"][0]["description"]
  # pp "The real temp is: " + report.parse(:json)["main"]["temp"].to_s
  # pp "The feels like temp is: " + report.parse(:json)["main"]["feels_like"].to_s
  # pp "The humidity today is " + report.parse(:json)["main"]["humidity"].to_s

  description = report.parse(:json)["weather"][0]["description"]
  real_temp = report.parse(:json)["main"]["temp"].to_s
  feels_like = report.parse(:json)["main"]["feels_like"].to_s
  humidity = report.parse(:json)["main"]["humidity"].to_s

  p "The weather today in #{city} will be mostly #{description}. The average temperature will be #{real_temp} degrees, and will feel like #{feels_like} degrees. The average humidity will be #{humidity}%."
end
