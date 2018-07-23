require "spec_helper"

RSpec.describe GbAgencies do
  it "returns standard class in English" do
    gba = GbAgencies::Agencies.new("en", LABELS, "My Org")
    expect(gba.standard_class("national", "GB", "mandatory")).to eq "National standard"
    expect(gba.standard_class("national", "GB", "recommended")).to eq "National standard (Recommended)"
    expect(gba.standard_class("national", "GB", "guide")).to eq "Standardized guidelines"
    expect(gba.standard_class("sector", "AQ", "guide")).to eq "PRC Production Safety Industry Standard"
    expect(gba.standard_class("local", "81", "guide")).to eq "Hong Kong Special Administrative Region Local Standard"
    expect(gba.standard_class("enterprise", "ZZZ", "guide")).to eq "My Org Enterprise Standard"
    expect(gba.standard_class("social-group", "ZZZ", "guide")).to eq "Social Standard"
  end

  it "returns standard class in Chinese" do
    gba = GbAgencies::Agencies.new("zh", LABELS, "My Org")
    expect(gba.standard_class("national", "GB", "mandatory")).to eq "\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u6807\u51C6"
    expect(gba.standard_class("national", "GB", "recommended")).to eq "\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u6807\u51C6"
    expect(gba.standard_class("national", "GB", "guide")).to eq "\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u6307\u5BFC\u6027\u6280\u672F\u6587\u4EF6"
    expect(gba.standard_class("sector", "AQ", "guide")).to eq "PRC\u5B89\u5168\u751F\u4EA7Industry Standard"
    expect(gba.standard_class("local", "81", "guide")).to eq "\u9999\u6E2F\u7279\u522B\u884C\u653F\u533ALocal Standard"
    expect(gba.standard_class("enterprise", "ZZZ", "guide")).to eq "My OrgEnterprise Standard"
    expect(gba.standard_class("social-group", "ZZZ", "guide")).to eq "Social Standard"
  end

  it "returns standard agency in English as single string" do
    gba = GbAgencies::Agencies.new("en", LABELS, "My Org")
    expect(gba.standard_agency1("national", "GB", "mandatory")).to eq "General Administration of Quality Supervision, Inspection and Quarantine; Standardization Administration of China"
    expect(gba.standard_agency1("national", "GB", "recommended")).to eq "General Administration of Quality Supervision, Inspection and Quarantine; Standardization Administration of China"
    expect(gba.standard_agency1("national", "GB", "guide")).to eq "General Administration of Quality Supervision, Inspection and Quarantine; Standardization Administration of China"
    expect(gba.standard_agency1("sector", "AQ", "guide")).to eq "State Administration of Work Safety"
    expect(gba.standard_agency1("local", "81", "guide")).to eq "Hong Kong Special Administrative Region"
    expect(gba.standard_agency1("enterprise", "ZZZ", "guide")).to eq "My Org Enterprise Standard"
    expect(gba.standard_agency1("social-group", "ZZZ", "guide")).to eq "Social Standard"
  end


end
