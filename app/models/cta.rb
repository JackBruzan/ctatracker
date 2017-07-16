class Cta
  include httparty

  base_uri = "www.ctabustracker.com/bustime/api/v2/gettime?key=qtQscN352d8Z6WVaQpcUYM99z&format=json"

  def posts
    self.class.get()
    end
    
end
