module Orghunter
  class Category
    attr_reader :category_id, :description

    def initialize(args)
      @category_id = args['categoryId'] 
      @description = args['categoryDesc']
    end   
  end
end