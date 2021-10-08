require 'http'

response = HTTP.get("https://data.ny.gov/resource/xjya-f8ng.json")

i = 1
while i < response.parse(:json).length
  market = response.parse(:json)[i]["market_name"]
  operating_season = response.parse(:json)[i]["operation_season"]
  p "#{market} is open from #{operating_season}."
  i += 1
end

#pp = pretty print
