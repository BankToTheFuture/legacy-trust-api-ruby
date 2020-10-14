# frozen_string_literal: true

RSpec.describe LegacyTrust::ThirdPartyBankAccount, vcr: true do
  describe '.create' do
    subject(:method_execution) { described_class.create(**opts) }

    context 'when invalid params' do
      let(:opts) { {} }

      it_behaves_like 'invalid API setup'

      it 'raises error' do
        expect { method_execution }.to raise_error(LegacyTrust::RequestError)
      end
    end

    context 'when valid params' do
      let(:opts) do
        {
          body: {
            bank_id: 49_412, account_holder: 'Roboexpert',
            account_number: '27114020040000370241202935',
            detail: {
              line_1: 'Zygmunta Jórskiego 12', city: 'Warszawa', postal_code: '03-584',
              country_id: 26, relationship: 'Investor'
            }
          }
        }
      end

      it_behaves_like 'invalid API setup'

      it 'returns result' do
        expect(method_execution).to be_a(LegacyTrust::Result)
      end

      describe 'result' do
        it 'contains BankAccount ID' do
          expect(method_execution.body).to be_a(Integer)
        end
      end
    end
  end
end
