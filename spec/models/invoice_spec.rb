require 'spec_helper'

describe Invoice do
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:client_id) }
  it { should validate_presence_of(:net_id) }

  describe 'next_number' do
    it 'should use the base number with no existing invoices' do
      Invoice.next_number.should eq(Invoice::BASE_INVOICE_NUMBER)
    end

    it 'should use the last number plus one with existing invoices' do
      Invoice.stub_chain(:last, :number).and_return(100)
      Invoice.next_number.should eq(101)
    end
  end
end
