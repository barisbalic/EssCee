require 'response_parser'
require 'service'

module EssCee
  class Host
    attr_reader :hostname
    
    def initialize(hostname)
      @hostname = hostname
    end
    
    def services
      responses = ResponseParser.get_services(%[sc \\\\#{@hostname} query state= all])
      responses.map {|service| EssCee::Service.new(@hostname, service) }
    end
    
  end
end