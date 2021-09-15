# frozen_string_literal: true

require 'rails_helper'

describe TripsQuery::ForPeriod do
  subject { described_class.call(period: period) }

  let(:expected_sql) do
    "SELECT \"trips\".* FROM \"trips\" WHERE \"trips\".\"date\" >= '2021-12-01' AND \"trips\".\"date\" <= '2021-12-31'"
  end

  describe '.call' do
    let(:period) { Periods::MonthValue.new(Date.new(2021, 12, 1)) }

    it { expect(subject.to_sql).to eql(expected_sql) }
  end
end
