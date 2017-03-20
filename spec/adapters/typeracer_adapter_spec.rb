require "rails_helper"

=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

describe TrelloAdapter do
  let(:subject) { TrelloAdapter }

  describe "validations" do
    context "when credentials missing token" do
      let(:credentials) { { secret: "secret" } }

      it "is invalid" do
        expect(subject.valid_credentials?(credentials)).to be false
      end

      it "Raise error on instantiation" do
        error_klass = BaseAdapter::InvalidCredentials
        expect { subject.new(credentials) }.to raise_error(error_klass)
      end
    end

    context "when credentials missing secret" do
      let(:credentials) { { token: "token" } }

      it "is invalid" do
        expect(subject.valid_credentials?(credentials)).to be false
      end

      it "Raise error on instantiation" do
        error_klass = BaseAdapter::InvalidCredentials
        expect { subject.new(credentials) }.to raise_error(error_klass)
      end
    end

    context "When credentials have token and secret" do
      let(:credentials) { { token: "t", secret: "s" } }

      it "is valid" do
        expect(subject.valid_credentials?(credentials)).to be true
      end

      it "Does not raise error on instantiation" do
        expect { subject.new(credentials) }.not_to raise_error
      end
    end
  end
end
