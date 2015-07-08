require 'spec_helper'

RSpec.describe Circuitry::Middleware, type: :model do
  subject { described_class.new(app, options) }

  let(:app) { double('app', call: nil) }
  let(:options) { {} }

  describe '.new' do
    subject { described_class }

    let(:options) { { publish_async_strategy: :fork, subscribe_async_strategy: :thread } }

    it 'passes the publish async strategy to circuitry config' do
      expect(Circuitry.config).to receive(:publish_async_strategy=).with(:fork)
      subject.new(app, options)
    end

    it 'passes the subscribe async strategy to circuitry config' do
      expect(Circuitry.config).to receive(:subscribe_async_strategy=).with(:thread)
      subject.new(app, options)
    end
  end

  describe '#call' do
    let(:env) { {} }

    it 'calls the app' do
      subject.call(env)
      expect(app).to have_received(:call).with(env)
    end

    it 'flushes batched circuitry requests' do
      expect(Circuitry).to receive(:flush)
      subject.call(env)
    end
  end
end
