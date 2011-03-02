require 'rubygems'
require 'rspec'

require File.dirname(__FILE__) + '/../lib/response_parser.rb'
require File.dirname(__FILE__) + '/../lib/service.rb'

describe EssCee::ResponseParser do
  before(:each) do
    @mock_response = ""
    file = File.open(File.dirname(__FILE__) + '/localhost.query.all')
    file.each_line {|line| @mock_response += line}
  end
  
  it "should know how many services are running on a host" do
    services = EssCee::ResponseParser.get_services(@mock_response)
    services.count.should == 191
  end
  
  it "should know the details of the application experience service" do
    services = EssCee::ResponseParser.get_services(@mock_response)
    ae_service = services.first

    ae_service[:name].should == "AeLookupSvc"
    ae_service[:display_name].should == "Application Experience"
    ae_service[:type][:code].should == 20
    ae_service[:type][:message].should == "WIN32_SHARE_PROCESS"
    ae_service[:state][:code].should == 1
    ae_service[:state][:message].should == "STOPPED"
  end
end