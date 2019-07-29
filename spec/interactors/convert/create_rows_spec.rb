require 'rails_helper'

describe Convert::CreateRows do
  let(:json_array) do
    [
      { 'name' => 'John Snow', 'age' => 29, 'height' => 180 },
      { 'name' => 'Iron Man', 'age' => 39, 'color' => 'green' }
    ]
  end
  let(:rows) { [['John Snow', 29, 180, nil], ['Iron Man', 39, nil, 'green']] }

  describe '.call' do
    context 'when given valid context' do
      before do
        @context = described_class.call(
          json_array: json_array,
          header: %w[name age height color]
        )
      end

      it 'succeeds' do
        expect(@context).to be_a_success
      end

      it 'creates rows' do
        expect(@context.rows).to eq(rows)
      end
    end

    context 'when given invalid context' do
      before do
        @context = described_class.call(
          json_array: nil,
          header: nil
        )
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
