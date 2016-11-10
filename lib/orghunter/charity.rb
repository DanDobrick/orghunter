module Orghunter
  class Charity
    attr_reader :name, :category, :org_hunter_URL, :donation_URL, :city, :state, :zip_code, :status, :search_score, :website, :mission, :ein, :in_care_of, :street, :country, :subsection, :classification, :affiliation, :ruling_date, :deductibility, :deductibility_status, :foundation, :organization, :exempt_status, :tax_period, :asset_code_desc, :income_code_desc, :filing_requirement_code_desc, :pf_filing_requirement_code_desc, :accounting_period, :asset_amount, :income_amount, :form990, :ntee_type, :ntee_cd, :ntee_class

    def initialize(args)
      @name = args["charityName"] || args["name"]
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

      @in_care_of = args["inCareOfName"]
      @street = args['street']
      @country = args['country']
      @subsection = args['subsection']
      @classification = args['classification']
      @affiliation = args['affiliation']
      # Ruling is spelled wrong!
      @ruling_date = args['rullingDate']
      @deductibility = args['deductibility']
      @deductibility_status = args['deductibilityStatus']
      @foundation = args['foundation']
      @organization = args['organization']
      @exempt_status = args['exemptStatus']
      @tax_period = args['taxPeriod']
      @asset_code_desc = args['assetCodeDesc']
      @income_code_desc = args['incomeCodeDesc']
      # there is a space at the end of this data descriptor!!!
      @filing_requirement_code_desc = args['filingRequirementCodeDesc ']

      @pf_filing_requirement_code_desc = args["pfFilingRequirementCodeDesc"]
      @accounting_period = args["accountingPeriod"]
      @asset_amount = args["assetAmount"]
      @income_amount = args["incomeAmount"]
      @form990 = args["form990"]
      @ntee_cd = args['nteeCd']
      @ntee_class = args["nteeClass"]
      @ntee_type = args["nteeType"]
    end

    def deductable?
      @deductability == 1
    end

    def eligible?
      @eligible_cd == 1
    end

    def accepting_donations?
      @accepting_donations.to_i == 1
    end

  end
end