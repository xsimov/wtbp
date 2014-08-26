class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :query

  def initialize(query)
    @query = query
  end

  def persisted?
    false
  end

  def musicians(search_fields = [:first_name, :last_name])
    @results = []
    search_fields.each do |parameter|
      Musician.where("#{parameter} ILIKE ?", "%#{@query}%").each do |musician|
        @results << musician
      end
    end
    search_aliases
    @results
  end

  def bands
    @results = []
    Band.where("name ILIKE ?", "%#{@query}%").each do |band|
      @results << band
    end
    search_styles
    @results
  end

  private
  def search_aliases
    Musician.all.pluck(:id, :aliases).each do |alias_and_id|
      alias_and_id.last.map!(&:downcase)
      if alias_and_id.last.include? @query.downcase
        @results << Musician.find(alias_and_id.first)
      end
    end
  end

  def search_styles
    Band.all.pluck(:id, :styles).each do |styles_and_id|
      styles_and_id.last.map!(&:downcase)
      if styles_and_id.last.include? @query.downcase
        @results << Band.find(styles_and_id.first)
      end
    end
  end
end