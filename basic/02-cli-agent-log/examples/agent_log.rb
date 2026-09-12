#!/usr/bin/env ruby
# frozen_string_literal: true
# SPDX-License-Identifier: MIT

require "optparse"
require_relative "../../../lib/agent_lab/transcript"

options = { file: "transcript.json" }

parser = OptionParser.new do |opts|
  opts.banner = "Usage: agent_log.rb [options] add|list [args]"
  opts.on("--file PATH", "Transcript JSON path") { |path| options[:file] = path }
  opts.on("--role ROLE", "Message role for add") { |role| options[:role] = role }
end

parser.order!
command = ARGV.shift
transcript = AgentLab::Transcript.load(options.fetch(:file))

case command
when "add"
  role = options.fetch(:role, "user")
  content = ARGV.join(" ")
  transcript.add(AgentLab::Message.new(role: role, content: content))
  transcript.save(options.fetch(:file))
  puts "added #{role} message"
when "list"
  transcript.each do |message|
    puts "[#{message.created_at.iso8601}] #{message.role}: #{message.content}"
  end
else
  puts parser
end
