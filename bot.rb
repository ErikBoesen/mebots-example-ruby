require "sinatra"
require "mebots"
require "json"
require "net/http"

BOT = Bot.new("your_bot_shortname_here", ENV["BOT_TOKEN"])
POST_URI = URI("https://api.groupme.com/v3/bots/post")
POST_HTTP = Net::HTTP.new(POST_URI.host, POST_URI.port)
POST_HTTP.use_ssl = true
POST_HTTP.verify_mode = OpenSSL::SSL::VERIFY_PEER

def process(message)
  text = message["text"].downcase
  response = nil
  if message["sender_type"] == "user"
    if text == "ping":
      response = "Pong!"
    end
  end
  return response
end

def reply(message, group_id)
  req = Net::HTTP::Post.new(POST_URI, "Content-Type" => "application/json")
  req.body = {
      bot_id: BOT.instance(group_id).id,
      text: message,
  }.to_json
  POST_HTTP.request(req)
end

get "/" do
  "You can show HTML content here if you like! See the Sinatra documentation for more."
end

post "/" do
  message = JSON.parse(request.body.read)
  responses = process(message)
  if responses
    reply(responses, message["group_id"])
  end
end
