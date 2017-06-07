class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null
  
  def scrap_patients
    agent = Mechanize.new
    page = agent.get("https://curegistry.flhealth.gov/Public/LogIn")
    County = Hash["Alachua"=> 1, "Baker"=> 2 , "Bay"=> 3 , "Bradford"=> 4 , "Brevard"=> 5, "Broward"=> 6 , 
                  "Calhoun" => 7 , "Charlotte" => 8, "Citrus" => 9, "Clay" => 10 , "Collier" => 11 , "Columbia" => 12, 
                  "Desoto"=> 13, "Dixie" => 14, "Duval"=> 15, "Escambia" => 16, "Flager" => 17, "Franklin" =>18 , "Gadsden"=> 19, 
                  "Gilchrist"=>20 , "Galdes" => 21,"Gulf" => 22,"Hamilton" => 23,"Hardee" => 24,"Hendry" => 25,"Hernando" => 26,
                  "Highlands" => 27,"Hillsborough" => 28,"Holmes" => 29,"Indain River" => 30,"Jackson" => 31,"Jefferson" => 32,
                  "Lafayette" => 33,"Lake" => 34,"Lee" => 35,"Leon" => 36,"Levy" => 37,"Liberty" => 38,"Madison" => 39,"Manatee" => 40,
                  "Marion" => 41,"Martin" => 42,"Miami-Dade" => 43,"Monroe" => 44,"Nassau" => 45, "Okaloosa"=> 46 "Okeechobee"=> 47,
                  "Orange" => 48,"Osceola"=>49 , "Palm Beach" => 50, "Pasco"=> 51, "Pinellas"=> 52, "Polk"=>53, "Putnam"=> 54, "Santa Rosa"= 55
                  "Sarasota" => 56, "Seminole" => 57,"St.Johns"=>58, "St.Lucie"=>59,"Sumter"=60, "Suwannee"=> 61, "Taylor"=> 62, "Union"=>63,
                  "Volusia" =>64, "Wakulla"=> 65, "Walton"=>66, "Washinton"=>67]
                  
    page.form['LoginId'] = params[:LoginId]
    page.form['password'] = params[:password]
    page.form.submit

    page = agent.get('https://curegistry.flhealth.gov/Patient/EditPatient/0')
    if page.uri.to_s != 'https://curegistry.flhealth.gov/Patient/EditPatient/0'
      render json: {success: false, message: 'Login Error'}
    else
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
       render json: {success: true, message: 'Patient successfully created'}
      
=begin   
# edit for validation condition in case of empty page form
    else
      page.form['LastName'].empty?
      page.form['FirstName'].empty?
      page.form['DateOfBirth'].empty?
      page.form['SSN'].empty?
      page.form['PatientWeight'].empty?
      page.form['Address1'].empty?
      page.form['City'].empty?

      render json: {success: false, message: 'Please check missing field, FirstName ,LastName DateOfBirth, SSN, PatientWeight, Address1, City is madotry'}
     
      page.form.submit
      render json: {success: true, message: 'Patient successfully created'}
      
=end 

    end
  end
end
