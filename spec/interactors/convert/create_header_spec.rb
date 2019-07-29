require 'rails_helper'

describe Convert::CreateHeader do
  let(:json_array) do
    [
      { 'name' => 'John Snow', 'age' => 29, 'height' => 180 },
      { 'name' => 'Iron Man', 'age' => 39, 'color' => 'green' }
    ]
  end
  describe '.call' do
    context 'when given valid context' do
      before do
        @context = described_class.call(
          json_array: json_array
        )
      end

      it 'succeeds' do
        expect(@context).to be_a_success
      end

      it 'creates header' do
        expect(@context.header).to eq(%w[name age height color])
      end
    end

    context 'when given invalid context' do
      before do
        @context = described_class.call(json_array: nil)
      end

      it 'fails' do
        expect(@context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(@context.errors).to be_present
      end
    end
  end
end
