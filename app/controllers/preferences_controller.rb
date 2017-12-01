class PreferencesController < ApplicationController
  before_filter :check_authenticated_admin, :except => [:login]
  layout "admin"

def list
  @page_heading = "Preferences"
  @preferences = Preference.find(:all)
end

def edit
  @preference = Preference.find(params[:id])
  @page_heading = "Edit " + @preference.setting
end

def update
  Preference.find(params[:id]).update_attributes(params[:preference])
  redirect_to :action => :list
end
end
