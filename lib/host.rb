module EssCee
  class Host
    attr_reader :hostname
    
    def initialize(hostname)
      @hostname = hostname
    end
    
    def services
     responses = ResponseParser.get_services(%x[sc \\\\#{@hostname} query state= all])
     responses.map { |service| EssCee::Service.new(@hostname, service) }
    end
    
    def service(name)
      services.find {|service| service.name == name}
    end
    
  end
end