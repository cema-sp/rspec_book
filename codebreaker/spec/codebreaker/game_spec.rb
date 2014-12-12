require 'spec_helper'

module Codebreaker
  describe Game do
    describe '#start' do
      let(:output_stream) { double('output_stream').as_null_object }
      let(:game) { Game.new(output_stream) }

      it 'sends a welcome message' do
        expect(output_stream).to receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it 'prompts for the first guess' do
        expect(output_stream).to receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end
  end
end
