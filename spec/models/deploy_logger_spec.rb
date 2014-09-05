describe DeployLogger do
  describe "log" do
    let(:stream) { double('stream') }

    before do
      allow(stream).to receive(:write)
    end

    subject { described_class.new(stream) }

    it 'outputs to the stream' do
      expect(stream).to receive(:write).with("This message\n")
      subject.log('This message')
    end

    context 'when no newline is required' do
      it 'does not append a newline' do
        expect(stream).to receive(:write).with("This message")
        subject.log('This message', newline: false)
      end
    end

    context 'when no stream is passed in' do
      it 'does not break' do
        expect { DeployLogger.new(nil).log('Does not break') }.to_not raise_error
      end
    end
  end
end
