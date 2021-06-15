class PagesController < ApplicationController
  def home
  end

  def search(search)
    if search
      @vans = Van.where(model: search)
    else
      "#{search} do not meet any record"
    end
  end
end
