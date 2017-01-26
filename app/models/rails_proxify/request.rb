class RailsProxify::Request

  def initialize(options = {})
    @errors = []
    @options = options
    @result= nil
    @response = nil
  end

  def execute
    url = URI(@options[:url])

    http = Net::HTTP.new(url.host, url.port)

    if url.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    req = Net::HTTP.const_get(@options[:method].downcase.capitalize).new(url)

    req.body = @options[:body].to_json

    begin
      @response = http.request(req)
      @result = response.read_body
      if response.code.to_i >= 400
        @errors << response.message
        @errors << response.body
      end
    rescue Exception => e
      @errors << e.message
    end

    errors.blank?
  end

  def errors
    @errors
  end

  def result
    @result
  end

  def response
    @response
  end

end
