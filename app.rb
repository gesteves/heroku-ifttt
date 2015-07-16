# encoding: utf-8
require "sinatra"
require "dotenv"
require "httparty"

configure do
  # Load .env vars
  Dotenv.load
  # Disable output buffering
  $stdout.sync = true
end

post "/ifttt/:key" do
  url = "https://maker.ifttt.com/trigger/heroku_deploy/with/key/#{params[:key]}"
  body = {
    value1: "#{params[:app]} #{params[:release]} was deployed to Heroku by #{params[:user]}",
    value2: params[:url]
  }
  HTTParty.post(url, body: body.to_json, headers: { "Content-Type" => "application/json" })
  status 200
  body "ok"
end