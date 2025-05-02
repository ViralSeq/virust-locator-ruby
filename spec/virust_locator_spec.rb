# frozen_string_literal: true

RSpec.describe VirustLocator do # rubocop:disable Metrics/BlockLength
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

  it "can initialize the virust-locator command" do
    file = VirustLocator::Locator.init
    expect(file).not_to be nil
    expect(file).to match(/virust-locator/)
    expect(file).to match(/runnable/)
  end

  it "can run the virust-locator command with array" do
    my_query = %w[GAAAGCATAGTAATATGGGGAAAGACTCCTAAA
                  GAAAGCATAGTAATATGGGGAA].join("\s")
    info = VirustLocator::Locator.exec(my_query).split("\n")
    p info
    expect(info.size).to be 2
    expect(info[0].split("\t").size).to be 6
    expect(info[1].split("\t").size).to be 6
    expect(info[0].split("\t")[0]).to eq("3681")
    expect(info[0].split("\t")[1]).to eq("3713")
    expect(info[1].split("\t")[0]).to eq("3681")
  end
end
