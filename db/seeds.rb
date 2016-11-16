# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user1 = User.create :email => "amreena@yahoo.com", :password => "userid"


osone = OfficeSought.create(sought: 'Mayor, City of Houston')
ostwo = OfficeSought.create(sought: 'City Council-District A')
osthree = OfficeSought.create(sought: 'City Council- District B')
osfour = OfficeSought.create(sought: 'City Council-District C')
osfive = OfficeSought.create(sought: 'City Council- District D')
ossix = OfficeSought.create(sought: 'City Council-District E')
osseven = OfficeSought.create(sought: 'City Council- District F')
oseigth = OfficeSought.create(sought: 'City Council-District G')
osnine = OfficeSought.create(sought: 'City Council- District H')
osten = OfficeSought.create(sought: 'City Council-District I')
oseleven = OfficeSought.create(sought: 'City Council- District J')
ostwelve=  OfficeSought.create(sought: 'City Council-District K')
osthirteen = OfficeSought.create(sought: 'City Council, At Large Position 1')
osfourteen = OfficeSought.create(sought: 'City Council, At Large Position 2')
osfifteen = OfficeSought.create(sought: 'City Council, At Large Position 3')
ossixteen = OfficeSought.create(sought: 'City Council, At Large Position 4')
osseventeen = OfficeSought.create(sought: 'City Council, At Large Position 5')
oseighteen = OfficeSought.create(sought: 'Controller')
osnineteen = OfficeSought.create(sought: 'Harris County School Trustee Position 6, PCT 1')
ostwenty = OfficeSought.create(sought: 'Texas State Board of Education, District 4')
ostwentyone = OfficeSought.create(sought: 'Trustee-Houston Community College District IV')
ostwentytwo = OfficeSought.create(sought: 'None')

ohone = OfficeHeld.create(held: 'Mayor, City of Houston')
ohtwo = OfficeHeld.create(held: 'City Council-District A')
ohthree = OfficeHeld.create(held: 'City Council- District B')
ohfour = OfficeHeld.create(held: 'City Council-District C')
ohfive = OfficeHeld.create(held: 'City Council- District D')
ohsix = OfficeHeld.create(held: 'City Council-District E')
ohseven = OfficeHeld.create(held: 'City Council- District F')
oheight = OfficeHeld.create(held: 'City Council-District G')
ohnine = OfficeHeld.create(held: 'City Council- District H')
ohten = OfficeHeld.create(held: 'City Council-District I')
oheleven = OfficeHeld.create(held: 'City Council- District J')
ohtwelve = OfficeHeld.create(held: 'City Council-District K')
ohthirteen = OfficeHeld.create(held: 'City Council, At Large Position 1')
ohfourteen = OfficeHeld.create(held: 'City Council, At Large Position 2')
ohfifteen = OfficeHeld.create(held: 'City Council, At Large Position 3')
ohsixteen = OfficeHeld.create(held: 'City Council, At Large Position 4')
ohseventeen = OfficeHeld.create(held: 'City Council, At Large Position 5')
oheighteen = OfficeHeld.create(held: 'Controller')
ohnineteen = OfficeHeld.create(held: 'Harris County School Trustee Position 6, PCT 1')
ohtwenty = OfficeHeld.create(held: 'Texas State Board of Education, District 4')
ohtwentyone = OfficeHeld.create(held: 'Trustee-Houston Community College District IV')
ohtwentytwo = OfficeHeld.create(held: 'None')

general = CommitteeType.create(comtype: 'General')
specific = CommitteeType.create(comtype: 'Specific')

hon = Prefix.create(prefix: 'Hon')
mr = Prefix.create(prefix: 'Mr.')
ms = Prefix.create(prefix: 'Ms.')
miss = Prefix.create(prefix: 'Miss.')
mrs = Prefix.create(prefix: 'Mrs.')
dr = Prefix.create(prefix: 'Dr.')
gov = Prefix.create(prefix: 'Gov.')
rep = Prefix.create(prefix: 'Rep')
sen = Prefix.create(prefix: 'Sen.')
prof = Prefix.create(prefix: 'Prof.')

prim = ElectionType.create(ectype: 'Primary')
general = ElectionType.create(ectype: 'General')
runoff = ElectionType.create(ectype: 'Runoff')
special = ElectionType.create(ectype: 'Special')
other = ElectionType.create(ectype: 'Other')

rpone = ReportType.create(rtype: 'COH')
rptwo = ReportType.create(rtype: 'SPAC')

econe = ExpendCategory.create(expendcat: 'Accounting')
ectwo = ExpendCategory.create(expendcat: 'Banking')
ecthree = ExpendCategory.create(expendcat: 'Advertising Expense')
ecfour = ExpendCategory.create(expendcat: 'Consulting Expense')
ecfive = ExpendCategory.create(expendcat: 'Contributions Made By Candidate/OfficeHolder')
ecsix = ExpendCategory.create(expendcat: 'Contributions Made By Politcal Committee')
ecseven = ExpendCategory.create(expendcat: 'Donations Made By Candidate/OfficeHolder')
eceight = ExpendCategory.create(expendcat: 'Donations Made By Politcal Committee')
ecnine = ExpendCategory.create(expendcat: 'Event Expense')
ecten = ExpendCategory.create(expendcat: 'Fees')
eceleven = ExpendCategory.create(expendcat: 'Food and Beverage Expense')
ectwelve = ExpendCategory.create(expendcat: 'Gifts and Awards Expense')
ecthirteen = ExpendCategory.create(expendcat: 'Memorials Expense')
ecfourteen = ExpendCategory.create(expendcat: 'Legal Services')
ecfifteen = ExpendCategory.create(expendcat: 'Loan Repayment and Reimbursement Office Rental Expense')
ecsixteen = ExpendCategory.create(expendcat: 'Polling Expense')
ecseventeen = ExpendCategory.create(expendcat: 'Printing Expense')
eceighteen = ExpendCategory.create(expendcat: 'Salaries')
ecnineteen = ExpendCategory.create(expendcat: 'Wages')
ectwenty = ExpendCategory.create(expendcat: 'Contract Labor')
ectwentyone = ExpendCategory.create(expendcat: 'Solicitation and Fundraising Expense')
ectwentytwo = ExpendCategory.create(expendcat: 'Transportation Equipment & Related Expense')
ectwentythree = ExpendCategory.create(expendcat: 'Travel in District')
ectwentyfour = ExpendCategory.create(expendcat: 'Travel Out District')
ectwentyfive = ExpendCategory.create(expendcat: 'Other Expenditures')

political = ExpendType.create(exptype: 'Political')
nonpolitical = ExpendType.create(exptype: 'Non-Political')


co = FilerType.create(ftype: 'Candidate/Officeholder')
pc = FilerType.create(ftype: 'Political Committee')

State.create([
                 {
                     state: "Alabama",
                 },
                 {
                     state: "Alaska",
                 },
                 {
                     state: "Arizona",
                 },
                 {
                     state: "Arkansas",
                 },
                 {
                     state: "California",
                 },
                 {
                     state: "Colorado",
                 },
                 {
                     state: "Connecticut",
                 },
                 {
                     state: "Delaware",
                 },
                 {
                     state: "Florida",
                 },
                 {
                     state: "Georgia",

                 },
                 {
                     state: "Hawaii",
                 },
                 {
                     state: "Idaho",
                 },
                 {
                     state: "Illinois",
                 },
                 {
                     state: "Indiana",
                 },
                 {
                     state: "Iowa",
                 },
                 {
                     state: "Kansas",
                 },
                 {
                     state: "Kentucky",
                 },
                 {
                     state: "Louisiana",
                 },
                 {
                     state: "Maine",
                 },
                 {
                     state: "Maryland",
                 },
                 {
                     state: "Massachusetts",
                 },
                 {
                     state: "Michigan",
                 },
                 {
                     state: "Minnesota",
                 },
                 {
                     state: "Mississippi",
                 },
                 {
                     state: "Missouri",
                 },
                 {
                     state: "Montana",
                 },
                 {
                     state: "Nebraska",
                 },
                 {
                     state: "Nevada",
                 },
                 {
                     state: "New Hampshire",
                 },
                 {
                     state: "New Jersey",
                 },
                 {
                     state: "New Mexico",
                 },
                 {
                     state: "New York",
                 },
                 {
                     state: "North Carolina",
                 },
                 {
                     state: "North Dakota",
                 },
                 {
                     state: "Ohio",
                 },
                 {
                     state: "Oklahoma",
                 },
                 {
                     state: "Oregon",
                 },
                 {
                     state: "Pennsylvania",
                 },
                 {
                     state: "Rhode Island",
                 },
                 {
                     state: "South Carolina",
                 },
                 {
                     state: "South Dakota",
                 },
                 {
                     state: "Tennessee",
                 },
                 {
                     state: "Texas",
                 },
                 {
                     state: "Utah",
                 },
                 {
                     state: "Vermont",
                 },
                 {
                     state: "Virginia",
                 },
                 {
                     state: "Washington",
                 },
                 {
                     state: "West Virginia",
                 },
                 {
                     state: "Wisconsin",
                 },
                 {
                     state: "Wyoming",
                 },
             ])