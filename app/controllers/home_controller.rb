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
  end

  def features
  end
end
