require 'rubygems'
require 'typhoeus'
require 'json'

module Devicraft
  class Server

    def parse_response(response)
      if response.code == 200
        puts "200"
        response.body
      elsif response.code == 404
        puts "404"
        nil
      else
        raise response.body
      end
    end

    def start
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "start")
      self.parse_response response
    end

    def stop
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "stop")
      self.parse_response response
    end

    def list
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "console list")
      players = self.parse_response response
      players = players.gsub("Connected players:", "")
      players.split(" ")
    end

    def status
      response = Typhoeus::Request.get("http://localhost:25560/server/status")
      self.parse_response response
    end

    def say(message)
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "console say #{message}")
      self.parse_response response
    end

    def kick(user_name)
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "console kick #{user_name}")
      self.parse_response response
    end

    def help
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "console help")
      self.parse_response response
    end

    def give(user, object, number)
      response = Typhoeus::Request.get("http://localhost:25560/server", body: "console give #{user} #{object} #{number}")
      self.parse_response response
    end

  end
end