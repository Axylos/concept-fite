require 'spec_helper'

RSpec.describe FiteList do
  pending "add some examples to (or delete) #{__FILE__}"
  it "can save a fitelist" do
    list = FiteList.create(title: "a new list")
    list.save!
    expect(list.id).not_to be_nil
  end
end
