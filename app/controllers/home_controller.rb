class HomeController < ApplicationController
  layout 'mainLayout'

  def index
    @topStory = Story.first
  end

  def facts
  end

  def resources
  end

  def whyquit
  end

  def signup
    @quitting_options = ["Cold Turkey", "Weening", "Nicotine Lozenges", "Nicotine Patches",
                          "Nicotine Gum", "Electronic Cigarettes"]
    @us_states = [
      'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'D.C.', 'FL', 'GA', 'HI', 'ID',
      'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO',
      'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA',
      'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY', 'Puerto Rico',
      'Outside U.S.'
    ]

    @cigarette_brands = ["Marlboro", "Camel", "L & M", "Not Listed"]
    @dip_brands = ["Copenhagen", "Skoal", "Grizzly", "RedMan", "Longhorn", "Not Listed"]
    @cigar_brands = ["Acid", "Monte Cristo", "Black & Mild", "Not Listed"]
  end

  def get_date
    month = params[:month]
    year = params[:year]
    @daysInMonth = Time.days_in_month(month.to_i, year.to_i)
    
    render :nothing => true, :json => @daysInMonth
  end

  def features
  end
end
