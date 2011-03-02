module EssCee
  class Host
    attr_reader :hostname
    
    def initialize(hostname)
      @hostname = hostname
    end
    
    def services
      responses = ResponseParser.get_services(%x[sc \\\\#{@hostname} query state= all])
      responses.map_to_hash {|service| {service[:name] => EssCee::Service.new(@hostname, service)} }.merge
    end
    
  end
end