require 'spec_helper'

describe Invoice do
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:client_id) }
  it { should validate_presence_of(:net_id) }

  describe 'outstanding' do
    let!(:some_invoice) { Factory(:invoice, paid_at: 1.week.ago ) }
    let!(:tech_invoice) { Factory(:invoice) }

    specify { Invoice.outstanding.should have(1).item }
  end

  describe 'total' do
    let!(:some_invoice) { Factory(:invoice) }
    let!(:tech_invoice) { Factory(:invoice) }

    before do
      2.times {
        some_invoice.items.create(name: 'Expense', cost: 1000)
        tech_invoice.items.create(name: 'Expense', cost: 500)
      }
    end

    specify { pending; Invoice.total.should eq(3000) }
  end

  describe 'next_number' do
    it 'should use the base number with no existing invoices' do
      Invoice.next_number.should eq(Invoice::BASE_INVOICE_NUMBER)
    end

    it 'should use the highest number plus one with existing invoices' do
      newest  = Factory(:invoice, number: 200)
      highest = Factory(:invoice, number: 100)

      Invoice.next_number.should eq(201)
    end
  end

  describe 'net' do
    subject { Factory.build(:invoice, net_id: nil) }

    it 'sets the net_id when the net is set' do
      subject.net = 30
      subject.net_id.should_not be_nil
    end

    it 'does not allow unlisted net periods' do
      subject.net = 25
      subject.should_not be_valid
    end
  end

  describe 'due_at' do
    subject { Factory(:invoice, net: 30) }
    specify { subject.due_at.should_not eq(subject.created_at) }
  end

  describe 'due?' do
    subject { Factory.build(:invoice, net: 30) }

    it 'is not due before the due_at date' do
      subject.should_not be_due
    end

    it 'is due after we pass due_at date' do
      subject.created_at = 2.months.ago
      subject.should be_due
    end
  end
end
