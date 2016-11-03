module Orghunter
  class Charity
    attr_reader :name, :category, :org_hunter_URL, :donation_URL, :city, :state, :zip_code, :status, :search_score, :website, :mission, :ein

    def initialize(args)
      @name = args["charityName"]
      @category = args["category"]
      @org_hunter_URL = args["url"]
      @donation_URL = args["donationUrl"]
      @eligible_cd = args["eligibleCd"]
      @city = args["city"]
      @state = args["state"]
      @zip_code = args["zipCode"]
      @deductability = args["deductibilityCd"]
      @status = args["statusCd"]
      @search_score = args["score"]
      @website = args["website"]
      @mission = args["missionStatement"]
      @accepting_donations = args["acceptingDonations"]
      @ein = args["ein"]
    end

    def deductable?
      @deductability == 1
    end

    def eligible?
      @eligible_cd == 1
    end

    def accepting_donations?
      @accepting_donations == 1
    end

  end
end