require 'mechanize'
agent = Mechanize.new
page = agent.get("https://curegistry.flhealth.gov/Public/LogIn")
page.form['LoginId'] = 'drlovaas'
page.form['password'] = 'Cannabis1!'
page.form.submit

page = agent.get('https://curegistry.flhealth.gov/Patient/EditPatient/0')
page.form['LastName'] = 'Yadav'
page.form['FirstName'] = 'Ratnam'
page.form['MiddleInitial'] = ''
page.form['PrimaryPhone'] = '934-456-3444'
page.form['EmailAddress'] = 'ratnam.yadav@icloud.com'
page.form['DateOfBirth'] = '04/27/1987'
page.form['PatientIdentifier'] = ''
page.form.submit