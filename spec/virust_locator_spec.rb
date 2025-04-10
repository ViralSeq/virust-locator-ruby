# frozen_string_literal: true

RSpec.describe VirustLocator do
  it "has a version number" do
    expect(VirustLocator::VERSION).not_to be nil
  end

  it "can run the virust-locator command" do
    info = VirustLocator::Locator.exec("GAAAGCATAGTAATATGGGGAAAGACTCCTAAA").split("\t")
    expect(info.size).to be 6
    expect(info[0]).to eq("3681")
    expect(info[1]).to eq("3713")
    expect(info[2]).to eq("100")
    expect(info[3]).to eq("false")
    expect(info[4]).to eq("GAAAGCATAGTAATATGGGGAAAGACTCCTAAA")
    expect(info[5]).to eq("GAAAGCATAGTAATATGGGGAAAGACTCCTAAA")
  end
end
