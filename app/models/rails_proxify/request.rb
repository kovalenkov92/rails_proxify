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

    @options[:headers].to_h.each_key do |header_name|
      if possible_headers.include?(header_name.downcase.underscore)
        req[header_name.downcase.gsub('_', '-')] = @options[:headers][header_name]
      end
    end

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

  def possible_headers
    %w(accept accept_charset accept_encoding accept_language accept_datetime authorization cache_control
       connection cookie content_length content_type date expect forwarded from host if_match if_modified_since
       if_none_match if_range if_unmodified_since max_forwards origin pragma proxy_authorization range referer
       te user_agent upgrade via warning
    )
  end

end
