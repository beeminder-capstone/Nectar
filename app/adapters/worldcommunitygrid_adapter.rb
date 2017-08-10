class WorldcommunitygridAdapter < BaseAdapter
  require 'nokogiri'
  require 'open-uri'

  class << self
    def required_keys
      %i(uid verification_code)
    end

    def auth_type
      :verify
    end

    def website_link
      "https://join.worldcommunitygrid.org?recruiterId=734146"
    end

    def title
      "World Community Grid"
    end

    def note
      "Donate your idle computer time: <a href=\"#{website_link}\" target=\"_blank\">Join World Community Grid</a>. Get your Verification code at: <a href=\"https://www.worldcommunitygrid.org/ms/viewMyProfile.do\" target=\"_blank\">https://www.worldcommunitygrid.org/ms/viewMyProfile.do</a>."
    end

    def valid_credentials?(credentials)
      uid = credentials.fetch(:uid)
      verification_code = credentials.fetch(:verification_code)
	  uid.present? && verification_code.present?
    end
  end
  
  def doc
    doc = Nokogiri::XML(open("https://www.worldcommunitygrid.org/verifyMember.do?name=#{uid}&code=#{verification_code}"))
  end

  def runtime
    member_stats = doc.xpath('MemberStatsWithTeamHistory//MemberStats//MemberStat//StatisticsTotals//RunTime')
    if member_stats
      member_stats.first.text.to_s
    else
      raise "Can't fetch run time"
    end
  end
  
  def points
    member_stats = doc.xpath('MemberStatsWithTeamHistory//MemberStats//MemberStat//StatisticsTotals//Points')
	if member_stats
      member_stats.first.text.to_s
    else
      raise "Can't fetch points"
    end
  end
  
  def results
    member_stats = doc.xpath('MemberStatsWithTeamHistory//MemberStats//MemberStat//StatisticsTotals//Results')
	if member_stats
      member_stats.first.text.to_s
    else
      raise "Can't fetch results"
    end
  end
  
  def verification_code
    credentials.fetch :verification_code
  end

end
