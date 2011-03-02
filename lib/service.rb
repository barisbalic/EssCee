module EssCee
  class Service
    attr_reader :name, :display_name, :type, :state
    
    def initialize(hostname, details)
      @hostname, @name, @display_name, @type, @state = hostname, details[:name], details[:display_name], details[:type], details[:state]
    end
        
    def stop
      %x[sc \\\\#{@hostname} stop #{@name}]
    end
    
    def start
      %x[sc \\\\#{@hostname} start #{@name}]
    end 
  end
end
  