# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SepaFileParser::String do
  context "parse" do
    it "raises an exception if the namespace/format is unknown" do
      expect{
        described_class.parse File.open('spec/fixtures/general/invalid_namespace.xml').read
      }.to raise_exception(SepaFileParser::Errors::UnsupportedNamespaceError, 'urn:iso:std:iso:20022:tech:xsd:camt.053.001.03')
    end

    it "does not raise an exception for a valid namespace" do
      expect(SepaFileParser::Camt052::Base).to receive(:new)
      described_class.parse File.open('spec/fixtures/camt052/valid_namespace.xml').read
    end

    it "does not raise an exception for a valid namespace" do
      expect(SepaFileParser::Camt053::Base).to receive(:new)
      described_class.parse File.open('spec/fixtures/camt053/valid_namespace.xml').read
    end
  end
end
