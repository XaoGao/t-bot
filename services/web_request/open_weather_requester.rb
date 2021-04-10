require 'httparty'

class OpenWeatherRequester
  include HTTParty
  def initialize
    @base_url = 'http://api.openweathermap.org/data/2.5/weather?'.freeze
  end

  def call(city, options = {})
    params = generate_params(city, options)
    HTTParty.get("#{@base_url}#{params}")
  end

  private

  def validate!(options)
    # TODO: валидация
    keys = [:q, :mode, :units, :lang, :appid]
    options.each_key { |key| options.delete(key) unless keys.include?(key) }
  end

  def appid
    ENV['OPEN_WEATHER_TOKEN']
  end

  def generate_params(city, options)
    validate! options
    add_city_and_appid! city, options
    convert_options_to_url_params options
  end

  def add_city_and_appid!(city, options)
    options[:q] = city
    options[:appid] = appid
    options
  end

  def convert_options_to_url_params(options)
    url_params = ''
    options.each do |k, v|
      url_params << "#{k}=#{v}&"
    end
    url_params
  end
end
