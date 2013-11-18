require 'rubygems'
require 'mechanize'
require 'open-uri'

agent = Mechanize.new
agent.get("http://somepagewithaform.com")
form = agent.page.parser.css('form')[0]
puts agent.page.forms[0]
puts agent.page.forms[0].fields