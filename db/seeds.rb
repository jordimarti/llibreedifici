# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Operacio.create(id: 1, descripcio_ca: "Primera descripció en català", descripcio_es: "Primera descripción en español", periodicitat: 5, periodicitat_text_ca: "5 anys", periodicitat_text_es: "5 años", document_referencia: "EHE-08", responsable: "Tècnic de capçalera", obligatorietat: true, creat_usuari: false, sistema: "fonamentacio")
Operacio.create(id: 2, descripcio_ca: "Segona descripció en català", descripcio_es: "Segunda descripción en español", periodicitat: 3, periodicitat_text_ca: "3 anys", periodicitat_text_es: "3 años", document_referencia: "EHE-08", responsable: "Tècnic de capçalera", obligatorietat: true, creat_usuari: false, sistema: "fonamentacio")
Operacio.create(id: 3, descripcio_ca: "Tercera descripció en català", descripcio_es: "Tercera descripción en español", periodicitat: 3, periodicitat_text_ca: "3 anys", periodicitat_text_es: "3 años", document_referencia: "EHE-08", responsable: "Tècnic de capçalera", obligatorietat: true, creat_usuari: false, sistema: "estructura")