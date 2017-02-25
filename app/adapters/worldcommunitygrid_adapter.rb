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

    def valid_credentials?(credentials)
      uid = credentials.fetch(:uid)
      verification_code = credentials.fetch(:verification_code)
	  uid.present? && verification_code.present?
    end
  end

  def runtime
    uid = credentials.fetch(:uid)
	verification_code = credentials.fetch(:verification_code)
    doc = Nokogiri::HTML(open("https://www.worldcommunitygrid.org/verifyMember.do?name=#{uid}&code=#{verification_code}"))

	doc.xpath('//MemberStatsWithTeamHistory//MemberStats//MemberStat//StatisticsTotals//RunTime')&.first
  end
  
  def points
    uid = credentials.fetch(:uid)
	verification_code = credentials.fetch(:verification_code)
    doc = Nokogiri::HTML(open("https://www.worldcommunitygrid.org/verifyMember.do?name=#{uid}&code=#{verification_code}"))

	doc.xpath('//MemberStatsWithTeamHistory//MemberStats//MemberStat//StatisticsTotals//Points')&.first
  end
  
  def results
    uid = credentials.fetch(:uid)
	verification_code = credentials.fetch(:verification_code)
    doc = Nokogiri::HTML(open("https://www.worldcommunitygrid.org/verifyMember.do?name=#{uid}&code=#{verification_code}"))

	doc.xpath('//MemberStatsWithTeamHistory//MemberStats//MemberStat//StatisticsTotals//Results')&.first
  end

end
