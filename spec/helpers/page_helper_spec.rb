require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PageHelper. For example:
#
# describe PageHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PageHelper, type: :helper do
  describe "Happy" do
    it "string parameter is send" do
      welcome_user("user name")
    end
  end

  describe "Sad" do
    it "if parameter is not a string" do
      expect {welcome_user(45)}.to raise_error(TypeError)
    end
  end
end
