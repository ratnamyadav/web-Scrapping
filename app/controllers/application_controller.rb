class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null
  
  def scrap_patients
    agent = Mechanize.new
    page = agent.get("https://curegistry.flhealth.gov/Public/LogIn")
    page.form['LoginId'] = params[:LoginId]
    page.form['password'] = params[:password]
    page.form.submit

    page = agent.get('https://curegistry.flhealth.gov/Patient/EditPatient/0')
    page.form['LastName'] = params[:LastName]
    page.form['FirstName'] = params[:FirstName]
    page.form['MiddleInitial'] = params[:MiddleInitial]
    page.form['PrimaryPhone'] = params[:PrimaryPhone]
    page.form['EmailAddress'] =  params[:EmailAddress]
    page.form['DateOfBirth'] =  params[:DateOfBirth]
    page.form['SSN'] =  params[:SSN]
    page.form['PatientWeight'] =  params[:PatientWeight]
    page.form['WeightType'] =  params[:WeightType]
    page.form['Address1'] =  params[:Address1]
    page.form['Address2'] =  params[:Address2]
    page.form['City'] =  params[:City]
    page.form['Zipcode'] =  params[:Zipcode]
    page.form['GenderID'] =  params[:GenderID]
    page.form['County'] =  params[:County]
    page.form.submit
    render json: {successfull: true}
  end
end
