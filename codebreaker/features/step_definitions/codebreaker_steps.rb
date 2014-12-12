Given(/^I am not yet playing$/) do
end

Given(/^the secret code is "(.*?)"$/) do |secret|
  @game = Codebreaker::Game.new(output_stream)
  @game.start(secret)
end

When(/^I start a new game$/) do
  @game = Codebreaker::Game.new(output_stream)
  @game.start('1234')
end

When(/^I guess "(.*?)"$/) do |guess|
  @game.guess(guess)
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(output_stream.messages).to include(message)
end

Then(/^the mark should be "(.*?)"$/) do |mark|
  expect(output_stream.messages).to include(mark)
end

#------------------------------------------------

class OutputStream
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output_stream
  @output_stream ||= OutputStream.new
end
