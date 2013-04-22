require_relative 'base'
require 'net/http'
require 'net/https'

class App < Base
  ATLAS_API_KEY = @sensitive_config['devint-api-key']

  get '/' do
    pois_request = Net::HTTP::Get.new(pois_path, {'API-Key' => ATLAS_API_KEY})
    pois_response = https.start { |http| http.request(pois_request) }

    if pois_response.code == "200"
      @poi = pois_response.body
      puts "poi: #{@poi}"
      haml :index
    else
      puts pois_response.body if pois_response
      raise "Response code from #{pois_url}: #{pois_response.code}"
    end

  end

  def lonely_planet_domain
    'atlas-devint.lonelyplanet.com'
  end

  def pois_path
    '/pois/444343?format=json'
  end

  def pois_url
    lonely_planet_domain + pois_path
  end

  def https
    https = Net::HTTP.new(lonely_planet_domain, Net::HTTP.https_default_port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE

    https
  end

end
