require 'rails_helper'

RSpec.describe Onlineticket do
  it "works" do
    Onlineticket.new.parse(file_fixture("scanned_tickets/6RGH47.txt").read)
  end

end
