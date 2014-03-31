# encoding: UTF-8
#Suppression de tous les users de la base
User.delete_all

#Récupération de tous les CV utiles dans des variables
@cv_mfh = Rack::Test::UploadedFile.new('db/cv_files/cv_mfh.pdf')
@cv_ary = Rack::Test::UploadedFile.new('db/cv_files/cv_ary.pdf')
@cv_dtn = Rack::Test::UploadedFile.new('db/cv_files/cv_dtn.pdf')
@cv_cfc = Rack::Test::UploadedFile.new('db/cv_files/cv_cfc.pdf')
@cv_vdd = Rack::Test::UploadedFile.new('db/cv_files/cv_vdd.pdf')
@cv_rmr = Rack::Test::UploadedFile.new('db/cv_files/cv_rmr.pdf')

#User Mickael FARDILHA
User.create!({  :nom => "Mickaël FARDILHA",
				:email => "mfardilha@umanis.com",
				:ddn => Date.new(1991,02,04),
				:poidsActu => 65,
				:poidsIdeal => 63,
				:taille => 160,
				:isSportif => true,
				:wantDoSport => false,
				:cv => @cv_mfh})


#User Martin ROY
User.create!({  :nom => "Martin ROY",
				:email => "mroy@umanis.com",
				:ddn => Date.new(1970,03,17),
				:poidsActu => 88,
				:poidsIdeal => 82,
				:taille => 182,
				:isSportif => true,
				:wantDoSport => false,
				:cv => @cv_ary})



#User Cédric FERELLEC
User.create!({  :nom => "Cédric FERELLEC",
				:email => "cferellec@umanis.com",
				:ddn => Date.new(1969,01,19),
				:poidsActu => 86,
				:poidsIdeal => 80,
				:taille => 179,
				:isSportif => false,
				:wantDoSport => false,
				:cv => @cv_cfc})



#User Romain DEL BOCCIO
User.create!({  :nom => "Romain DEL BOCCIO",
				:email => "rdelboccio@umanis.com",
				:ddn => Date.new(1984,01,21),
				:poidsActu => 70,
				:poidsIdeal => 69,
				:taille => 177,
				:isSportif => false,
				:wantDoSport => true,
				:cv => nil})



#User Duy TRAN VAN
User.create!({  :nom => "Duy TRAN VAN",
				:email => "dtranvan@umanis.com",
				:ddn => Date.new(1981,11,10),
				:poidsActu => 95,
				:poidsIdeal => 72,
				:taille => 174,
				:isSportif => false,
				:wantDoSport => true,
				:cv => @cv_dtn})



#User Yohan POTIRON
User.create!({  :nom => "Yohan POTIRON",
				:email => "ypotiron@umanis.com",
				:ddn => Date.new(1980,02,04),
				:poidsActu => 102,
				:poidsIdeal => 83,
				:taille => 183,
				:isSportif => false,
				:wantDoSport => true,
				:cv => nil})


#User Valérie DAVID
User.create!({  :nom => "Valérie DAVID",
				:email => "vdavid@umanis.com",
				:ddn => Date.new(1986,03,26),
				:poidsActu => 73,
				:poidsIdeal => 64,
				:taille => 168,
				:isSportif => false,
				:wantDoSport => true,
				:cv => @cv_vdd})


#User Rémy MACHEFER
User.create!({  :nom => "Rémy MACHEFER",
				:email => "rmachefer@umanis.com",
				:ddn => Date.new(1985,10,19),
				:poidsActu => 68,
				:poidsIdeal => 67,
				:taille => 167,
				:isSportif => true,
				:wantDoSport => false,
				:cv => @cv_rmr})


#User Romain CARREAU
User.create!({  :nom => "Romain CARREAU",
				:email => "rcarreau@umanis.com",
				:ddn => Date.new(1988,04,30),
				:poidsActu => 67,
				:poidsIdeal => 66,
				:taille => 169,
				:isSportif => true,
				:wantDoSport => false,
				:cv => nil})