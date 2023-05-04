require 'rails_helper'

describe Jokes::Random do
  describe '.call' do
    subject(:random_joke) { described_class.call }

    let(:category) { Category.create(name: 'test') }

    context 'when one joke in db' do
      let!(:joke) { Joke.create(message: 'test joke', category: category) }

      it { expect(random_joke).to eq(joke) }
    end

    context 'when no jokes in db' do
      let!(:joke) { nil }

      it { expect(random_joke).to eq(joke) }
    end
  end
end
