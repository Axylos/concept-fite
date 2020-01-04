#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)
require  './slack_votebot'
require 'dotenv'
Dotenv.load

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackVote::Bot.run
  rescue Exception => e
    p e
    raise e
  end
end


run Padrino.application
