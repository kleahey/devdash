require 'rubygems'
require 'net/http'
require 'net/https'
require 'xmlsimple'
require 'pp'
require 'time'
require 'rufus-scheduler'

$configuration =
{
  :hostname   => ENV['PARATURE_HOSTNAME'],
  :account_id => ENV['PARATURE_ACCOUNT'],
  :token      => ENV['PARATURE_TOKEN'],
  :applicant_id => ENV['PARATURE_APPLICANT'], # ID for a specific example customer you want to use
  :recommender_id => ENV['PARATURE_RECOMMENDER']  # ID for a specific example CSR you want to use
}

# Connect to Parature's API for Applicant accounts
def applicant_requests(configuration, request_params, request_method, request_body = nil)

  # Build the host name and port portion of the URL that will be used by all future requests.
  base_url = URI.parse("https://#{$configuration[:hostname]}/")

  # Create a request object and configure it to use HTTPS.
  request = Net::HTTP.new(base_url.host, base_url.port)
  request.use_ssl = true
  request.verify_mode = OpenSSL::SSL::VERIFY_NONE

  # Assemble the request URL from the connection parameters (fixed for each request)
  # request specific parameters and then append the authentication token.
  request_url = "/api/v1/#{$configuration[:account_id]}/#{configuration[:applicant_id]}/#{request_params}&_token_=#{configuration[:token]}"

  # If the call provided a request body then convert it from the XmlSimple format of nested hashes
  # and lists to raw xml and then send it with the request. Specify the 'KeepRoot' parameter to
  # prevent XmlSimple from wrapping the xml with a spurious <opt> tag.
  args = [request_method, request_url]
  args << XmlSimple.xml_out(request_body, { 'KeepRoot' => true }) if request_body

  # Use Ruby's send method to invoke the appropriate method on request (get(), post(), or put()).
  # Note the splat (*) that dynamically expands the args array into a parameter list at runtime.
  response = request.send(*args)

  # Convert the raw xml from the response to the XmlSimple format and return it.
  XmlSimple.xml_in(response.body, { 'KeepRoot' => false })
end

# Connect to Parature's API for Recommender account
def recommender_requests(configuration, request_params, request_method, request_body = nil)

  base_url = URI.parse("https://#{$configuration[:hostname]}/")

  request = Net::HTTP.new(base_url.host, base_url.port)
  request.use_ssl = true
  request.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request_url = "/api/v1/#{$configuration[:account_id]}/#{configuration[:recommender_id]}/#{request_params}&_token_=#{configuration[:token]}"

  args = [request_method, request_url]
  args << XmlSimple.xml_out(request_body, { 'KeepRoot' => true }) if request_body

  response = request.send(*args)

  XmlSimple.xml_in(response.body, { 'KeepRoot' => false })
end


class Parature

  def self.active_app_tickets
    # Get active Applicant tickets
    dataApp = applicant_requests($configuration, 'Ticket?_total_=true&_status_type_=open', :get, nil)
    @activeAppTickets = dataApp['total'].to_i - 6
  end

  def self.solved_app_tickets
    # Get Total Solved Applicant Tickets for Today
    dataSolvedApp = applicant_requests($configuration, "Ticket?_total_=true&Date_Created_min_=_last_week_&Ticket_Status_id_=7&Date_Updated_min_=#{Time.now.strftime('%Y-%m-%d')}T05:00:00Z", :get, nil)
    @solvedAppTickets = dataSolvedApp['total'].to_i
  end

  def self.solved_app_chat
    configuration = @configuration
    # Get Total Solved Applicant Chats for Today
    dataAppChat = applicant_requests($configuration, "Chat?_total_=yes&Date_Created_min_=#{Time.now.strftime('%Y-%m-%d')}T05:00:00Z&Date_Ended_min_=_today_", :get, nil)
    @solvedAppChat = dataAppChat['total'].to_i
  end

  def self.active_rec_tickets
    configuration = @configuration
    # Get active Recommender tickets
    dataRec = recommender_requests($configuration, 'Ticket?_total_=true&_status_type_=open', :get, nil)
    @activeRecTickets = dataRec['total'].to_i - 4
  end

  def self.solved_rec_tickets
    configuration = @configuration
    # Get Total Solved Recommender Tickets for Today
    dataSolvedRec = recommender_requests($configuration, "Ticket?_total_=true&Date_Created_min_=_last_week_&Ticket_Status_id_=13&Date_Updated_min_=#{Time.now.strftime('%Y-%m-%d')}T05:00:00Z", :get, nil)
    @solvedRecTickets = dataSolvedRec['total'].to_i
  end

  def self.solved_rec_chat
    configuration = @configuration
    # Get Total Recommender Chats for Today
    dataRecChat = recommender_requests($configuration, "Chat?_total_=yes&Date_Created_min_=#{Time.now.strftime('%Y-%m-%d')}T05:00:00Z&Date_Ended_min_=_today_", :get, nil)
    solvedRecChat = dataRecChat['total'].to_i
  end

  def self.total_solved_chats
    # Calculate the Total Number of Today's Chats
    @totalSolvedChats = solvedAppChat + solvedRecChat
  end

  def self.total_interations
    # Calculate the Total Number of Today's Interactions
    @totalInteractions = solvedAppTickets + solvedRecTickets + totalSolvedChats
  end

end