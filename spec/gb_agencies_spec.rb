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
    expect(gba.standard_agency1("enterprise", "ZZZ", "guide")).to eq "My Org"
    expect(gba.standard_agency1("social-group", "ZZZ", "guide")).to eq "My Org"
  end

  it "returns standard agency in Chinese as single string" do
    gba = GbAgencies::Agencies.new("zh", LABELS, "My Org")
    expect(gba.standard_agency1("national", "GB", "mandatory")).to eq "\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u8D28\u91CF\u76D1\u7763\u68C0\u9A8C\u68C0\u75AB\u603B\u5C40 \u4E2D\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u7BA1\u7406\u59D4\u5458\u4F1A"
    expect(gba.standard_agency1("national", "GB", "recommended")).to eq "\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u8D28\u91CF\u76D1\u7763\u68C0\u9A8C\u68C0\u75AB\u603B\u5C40 \u4E2D\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u7BA1\u7406\u59D4\u5458\u4F1A"
    expect(gba.standard_agency1("national", "GB", "guide")).to eq "\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u8D28\u91CF\u76D1\u7763\u68C0\u9A8C\u68C0\u75AB\u603B\u5C40 \u4E2D\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u7BA1\u7406\u59D4\u5458\u4F1A"
    expect(gba.standard_agency1("sector", "AQ", "guide")).to eq "\u56FD\u5BB6\u5B89\u5168\u751F\u4EA7\u7BA1\u7406\u5C40"
    expect(gba.standard_agency1("local", "81", "guide")).to eq "\u9999\u6E2F\u7279\u522B\u884C\u653F\u533A"
    expect(gba.standard_agency1("enterprise", "ZZZ", "guide")).to eq "My Org"
    expect(gba.standard_agency1("social-group", "ZZZ", "guide")).to eq "My Org"
  end

  it "returns standard agency in English as string or array" do
    gba = GbAgencies::Agencies.new("en", LABELS, "My Org")
    expect(gba.standard_agency("national", "GB", "mandatory")).to eq "General Administration of Quality Supervision, Inspection and Quarantine; Standardization Administration of China"
    expect(gba.standard_agency("national", "GB", "recommended")).to eq "General Administration of Quality Supervision, Inspection and Quarantine; Standardization Administration of China"
    expect(gba.standard_agency("national", "GB", "guide")).to eq "General Administration of Quality Supervision, Inspection and Quarantine; Standardization Administration of China"
    expect(gba.standard_agency("sector", "AQ", "guide")).to eq "State Administration of Work Safety"
    expect(gba.standard_agency("local", "81", "guide")).to eq "Hong Kong Special Administrative Region"
    expect(gba.standard_agency("enterprise", "ZZZ", "guide")).to eq "My Org"
    expect(gba.standard_agency("social-group", "ZZZ", "guide")).to eq "My Org"
  end

  it "returns standard agency in Chinese as string or array" do
    gba = GbAgencies::Agencies.new("zh", LABELS, "My Org")
    expect(gba.standard_agency("national", "GB", "mandatory")).to eq  ["\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u8D28\u91CF\u76D1\u7763\u68C0\u9A8C\u68C0\u75AB\u603B\u5C40", "\u4E2D\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u7BA1\u7406\u59D4\u5458\u4F1A"]
    expect(gba.standard_agency("national", "GB", "recommended")).to eq  ["\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u8D28\u91CF\u76D1\u7763\u68C0\u9A8C\u68C0\u75AB\u603B\u5C40", "\u4E2D\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u7BA1\u7406\u59D4\u5458\u4F1A"]
    expect(gba.standard_agency("national", "GB", "guide")).to eq  ["\u4E2D\u534E\u4EBA\u6C11\u5171\u548C\u56FD\u56FD\u5BB6\u8D28\u91CF\u76D1\u7763\u68C0\u9A8C\u68C0\u75AB\u603B\u5C40", "\u4E2D\u56FD\u56FD\u5BB6\u6807\u51C6\u5316\u7BA1\u7406\u59D4\u5458\u4F1A"]
    expect(gba.standard_agency("sector", "AQ", "guide")).to eq "\u56FD\u5BB6\u5B89\u5168\u751F\u4EA7\u7BA1\u7406\u5C40"
    expect(gba.standard_agency("local", "81", "guide")).to eq "\u9999\u6E2F\u7279\u522B\u884C\u653F\u533A"
    expect(gba.standard_agency("enterprise", "ZZZ", "guide")).to eq "My Org"
    expect(gba.standard_agency("social-group", "ZZZ", "guide")).to eq "My Org"
  end

  it "returns document identifier" do
    gba = GbAgencies::Agencies.new("en", LABELS, "My Org")
    expect(gba.docidentifier("local", "PREFIX", "guide", "2002", "123")).to eq "DBPREFIX/Z 123&mdash;2002"
    expect(gba.docidentifier("social-group", "PREFIX", "guide", "2002", "123")).to eq "T/Z/PREFIX 123&mdash;2002"
    expect(gba.docidentifier("enterprise", "PREFIX", "guide", "2002", "123")).to eq "Q/Z/PREFIX 123&mdash;2002"
    expect(gba.docidentifier("sector", "PREFIX", "guide", "2002", "123")).to eq "PREFIX/Z&#x2002;123&mdash;2002"
    expect(gba.docidentifier("national", "PREFIX", "guide", "2002", "123")).to eq "PREFIX/Z&#x2002;123&mdash;2002"
    expect(gba.docidentifier("national", "PREFIX", "guide", nil, "123")).to eq "PREFIX/Z&#x2002;123"
  end

  it "validates prefixes" do
    gba = GbAgencies::Agencies.new("en", LABELS, "My Org")
    expect { gba.gbtype_validate("national", "ZZ") }.to output(/ZZ is not a recognised national prefix/).to_stderr
    expect { gba.gbtype_validate("national", "GB") }.not_to output(/GB is not a recognised national prefix/).to_stderr
    expect { gba.gbtype_validate("sector", "ZZ") }.to output(/ZZ is not a recognised sector prefix/).to_stderr
    expect { gba.gbtype_validate("sector", "NY") }.not_to output(/NY is not a sector national prefix/).to_stderr
    expect { gba.gbtype_validate("local", "ZZ") }.to output(/ZZ is not a recognised local prefix/).to_stderr
    expect { gba.gbtype_validate("local", "81") }.not_to output(/81 is not a recognised local prefix/).to_stderr
  end
end
