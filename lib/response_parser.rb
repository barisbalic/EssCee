module EssCee
  class ResponseParser
    
    LABELS = [/\s*SERVICE_NAME:\s*/i, /\s*DISPLAY_NAME:\s*/i, /\s*TYPE\s*:/, /\s*STATE\s*:/]
    
    def self.get_services(response)
      delimited_response, services = response.split("\n"), []
  
      delimited_response.each_with_index do |line, index|
        if(start_of_service?(line)) then
          services << {
            :name => clean_up(line),
            :display_name => clean_up(delimited_response[index + 1]),
            :type => code_and_message( clean_up(delimited_response[index + 2]) ),
            :state => code_and_message( clean_up(delimited_response[index + 3]) )
            }
        end
      end
      
      services
    end
    
    private      
    def self.start_of_service?(line)
      line.include?("SERVICE_NAME")
    end    
    
    def self.code_and_message(line)
      { :code => get_code(line), :message => get_literal(line) }
    end
    
    def self.get_code(line)
      line[1..2].to_i
    end
    
    def self.get_literal(line)
      line.split('  ').last.strip
    end    
    
    def self.clean_up(line)
     LABELS.each {|label| return line.gsub!(label, '') if line =~ label }
    end
  end
end