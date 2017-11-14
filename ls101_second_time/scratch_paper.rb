
$ad = 
  "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432,"\
  "54 Holy Grail Street Niagara Town ZP 32908,3200 Main Rd. Bern AE 56210,1 Gordon St. Atlanta RE 13000,"\
  "10 Pussy Cat Rd. Chicago EX 34342,10 Gordon St. Atlanta RE 13000,58 Gordon Road Atlanta RE 13000,"\
  "22 Tokyo Av. Tedmondville SW 43098,674 Paris bd. Abbeville AA 45521,10 Surta Alley Goodtown GG 30654,"\
  "45 Holy Grail Al. Niagara Town ZP 32908,320 Main Al. Bern AE 56210,14 Gordon Park Atlanta RE 13000,"\
  "100 Pussy Cat Rd. Chicago EX 34342,2 Gordon St. Atlanta RE 13000,5 Gordon Road Atlanta RE 13000,"\
  "2200 Tokyo Av. Tedmondville SW 43098,67 Paris St. Abbeville AA 45521,11 Surta Avenue Goodtown GG 30654,"\
  "45 Holy Grail Al. Niagara Town ZP 32918,320 Main Al. Bern AE 56215,14 Gordon Park Atlanta RE 13200,"\
  "100 Pussy Cat Rd. Chicago EX 34345,2 Gordon St. Atlanta RE 13222,5 Gordon Road Atlanta RE 13001,"\
  "2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,"\
  "2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,"\
  "2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000"
  
=begin

Input: 
  - string (all addresses separated by a comma)
  - string (state and zip code)
Output: 
  - string (format with state/zip code first,followed by streets/city, followed by house number)

Rules:
- if zipcode doesn't exist in list of client's addresses, return "zipcode:/"

Algorithm:
- split string of all addresses into an array
- use select to narrow list down to addresses you're concerned with
- create an empty string and push the values you're looking for into the string

=end

def travel(r, zipcode)
  address_array = r.split(',').select { |address| address[-8, 8] == zipcode }
  return "#{zipcode}:/" if address_array == []
  address_array.map! { |address| address.gsub(' ' + zipcode,'') }
  sorted_addresses = ''
  sorted_addresses << zipcode + ":"
  address_array.each do |address|
    breakdown = address.partition(" ")
    sorted_addresses << breakdown[-1] + ','
  end
  sorted_addresses[-1] = "/"
  address_array.each do |address|
    breakdown = address.partition(" ")
    sorted_addresses << breakdown[0] + ','
  end
  sorted_addresses[-1] = ""
  sorted_addresses
end

p travel($ad, "AA 45522")
p travel($ad, "NY 5643")