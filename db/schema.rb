# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150904103714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aigues", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "connexio_directa"
    t.boolean  "connexio_aforament"
    t.boolean  "captacio_propia"
    t.boolean  "comptador_unic"
    t.boolean  "comptadors_individuals_habitatge"
    t.boolean  "comptadors_individuals_centralitzats"
    t.boolean  "grup_pressio"
    t.boolean  "muntants_plom"
    t.boolean  "muntants_ferro"
    t.boolean  "muntants_coure"
    t.boolean  "muntants_plastic"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "ascensors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "habitatge_unifamiliar"
    t.boolean  "edifici_comunitari"
    t.boolean  "mes_20_plantes"
    t.boolean  "altres"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "carregues", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_carrega"
    t.string   "document_carrega"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "checklist_edifici_nou_plurifamiliars", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "llicencies_preceptives"
    t.boolean  "certificat_final_obra"
    t.boolean  "acta_recepcio_obra"
    t.boolean  "escriptura_publica"
    t.boolean  "documents_garantia"
    t.boolean  "documents_garantia_parts_comunes"
    t.boolean  "certificacio_energetica"
    t.boolean  "polissa_assegurances"
    t.boolean  "escriptura_propietat_horitzontal"
    t.boolean  "estatus_comunitat"
    t.boolean  "cedules_regims_juridics"
    t.boolean  "carregues_reals"
    t.boolean  "documents_complementaris"
    t.boolean  "documents_acreditatius_ajuts"
    t.boolean  "documents_justificacio_operacions"
    t.boolean  "certificat_final_obra_instalacions"
    t.boolean  "declaracions_ce_ascensors"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "checklist_nou_plurifamiliars", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "llicencies_preceptives",             default: true
    t.boolean  "certificat_final_obra",              default: true
    t.boolean  "acta_recepcio_obra",                 default: true
    t.boolean  "escriptura_publica",                 default: true
    t.boolean  "documents_garantia",                 default: true
    t.boolean  "documents_garantia_parts_comunes",   default: true
    t.boolean  "certificacio_energetica",            default: true
    t.boolean  "polissa_assegurances",               default: true
    t.boolean  "escriptura_propietat_horitzontal",   default: true
    t.boolean  "estatus_comunitat",                  default: true
    t.boolean  "cedules_regims_juridics",            default: true
    t.boolean  "carregues_reals",                    default: true
    t.boolean  "documents_complementaris",           default: true
    t.boolean  "documents_acreditatius_ajuts",       default: true
    t.boolean  "documents_justificacio_operacions",  default: true
    t.boolean  "certificat_final_obra_instalacions", default: true
    t.boolean  "declaracions_ce_ascensors",          default: true
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "climatitzacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "escalfador_pn_menor_24"
    t.boolean  "escalfador_pn_24_70"
    t.boolean  "escalfador_pn_major_70"
    t.boolean  "caldera_gas_pn_menor_70"
    t.boolean  "caldera_gas_pn_major_70"
    t.boolean  "caldera_biomassa"
    t.boolean  "caldera_solar_termica"
    t.boolean  "altres_pn_menor_70"
    t.boolean  "altres_pn_major_70"
    t.boolean  "clima_pn_menor_12_autonoms"
    t.boolean  "clima_pn_menor_12_torres"
    t.boolean  "clima_pn_menor_12_recuperador"
    t.boolean  "clima_pn_12_70_autonoms"
    t.boolean  "clima_pn_12_70_torres"
    t.boolean  "clima_pn_12_70_recuperador"
    t.boolean  "clima_pn_major_70_autonoms"
    t.boolean  "clima_pn_major_70_torres"
    t.boolean  "clima_pn_major_70_recuperador"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "cobertes", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "terrat_transitable"
    t.boolean  "terrat_no_transitable"
    t.boolean  "terrat_aillament_termic"
    t.boolean  "terrat_lamina_impermeabilitzant"
    t.boolean  "coberta_teula_arab"
    t.boolean  "coberta_teula_plana"
    t.boolean  "coberta_teula_ciment"
    t.boolean  "coberta_pissarra"
    t.boolean  "coberta_fibrociment"
    t.boolean  "coberta_asfaltica"
    t.boolean  "coberta_xapa_acer"
    t.boolean  "coberta_xapa_coure"
    t.boolean  "coberta_aillament_termic"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "constructors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_constructor"
    t.string   "nif_constructor"
    t.string   "adreca_constructor"
    t.string   "cp_constructor"
    t.string   "poblacio_constructor"
    t.string   "provincia_constructor"
    t.string   "pais_constructor"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "declaracions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "notari"
    t.string   "n_protocol"
    t.string   "data_declaracio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "directors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_director"
    t.string   "titulacio_director"
    t.string   "rao_social_director"
    t.string   "nif_director"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "edificis", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nom_edifici"
    t.string   "tipus_edifici"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "electricitats", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "enllumenat_comunitari"
    t.boolean  "mes_100k"
    t.boolean  "connexio_terra"
    t.boolean  "centre_transformacio"
    t.boolean  "fotovoltaica"
    t.boolean  "comptador_unic"
    t.boolean  "comptadors_individuals_habitatge"
    t.boolean  "comptadors_centralitzats"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "elements", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_element"
    t.string   "sistema_element"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "entitat_controls", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_entitat_control"
    t.string   "nif_entitat_control"
    t.string   "adreca_entitat_control"
    t.string   "cp_entitat_control"
    t.string   "poblacio_entitat_control"
    t.string   "provincia_entitat_control"
    t.string   "pais_entitat_control"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "entitats", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_entitat"
    t.decimal  "superficie"
    t.string   "destinacio"
    t.decimal  "quota"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "especials", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "piscina_estructura_obra"
    t.boolean  "piscina_estructura_composite"
    t.boolean  "piscina_estructura_acer"
    t.boolean  "piscina_vores_formigo"
    t.boolean  "piscina_vores_pedra"
    t.boolean  "piscina_ceramica"
    t.boolean  "piscina_resines"
    t.boolean  "piscina_porcellana"
    t.boolean  "piscina_climatitzacio"
    t.boolean  "piscina_iluminacio"
    t.boolean  "piscina_purificador"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "estructures", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "parets_pedra"
    t.boolean  "parets_formigo_armat"
    t.boolean  "parets_tova"
    t.boolean  "parets_tapia"
    t.boolean  "parets_fabrica_mao"
    t.boolean  "parets_bloc_ceramic"
    t.boolean  "parets_bloc_formigo"
    t.boolean  "parets_entramat_fusta"
    t.boolean  "pilars_mao"
    t.boolean  "pilars_ferro_colat"
    t.boolean  "pilars_acer"
    t.boolean  "pilars_formigo_armat"
    t.boolean  "bigues_fusta"
    t.boolean  "bigues_metaliques"
    t.boolean  "bigues_formigo_armat"
    t.boolean  "forjat_fusta"
    t.boolean  "forjat_metalic"
    t.boolean  "forjat_formigo_armat"
    t.boolean  "forjat_ceramica_armada"
    t.boolean  "entrebigat_taulell"
    t.boolean  "entrebigat_revolto_ceramic"
    t.boolean  "entrebigat_revolto_formigo"
    t.boolean  "forjat_reticular"
    t.boolean  "llosa_formigo"
    t.boolean  "forjat_sanitari"
    t.boolean  "solera"
    t.boolean  "forjat_horitzontal_coberta_capa_pendent"
    t.boolean  "forjat_horitzontal_coberta_envanets"
    t.boolean  "forjat_inclinat_coberta_formigo"
    t.boolean  "encavallada_bigues_formigo"
    t.boolean  "encavallada_bigues_metall"
    t.boolean  "encavallada_bigues_fusta"
    t.boolean  "coberta_taulell_ceramic"
    t.boolean  "coberta_taulell_fusta"
    t.boolean  "coberta_sandwich"
    t.boolean  "escala_fusta"
    t.boolean  "escala_metall"
    t.boolean  "escala_ceramica"
    t.boolean  "escala_llosa_armada"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "execucio_directors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_director_execucio"
    t.string   "titulacio_director_execucio"
    t.string   "rao_social_director_execucio"
    t.string   "nif_director_execucio"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "fonamentacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "mur_pedra"
    t.boolean  "mur_fabrica_mao"
    t.boolean  "mur_fabrica_bloc"
    t.boolean  "mur_formigo_armat"
    t.boolean  "mur_pantalla"
    t.boolean  "sabates_paredat"
    t.boolean  "sabates_formigo"
    t.boolean  "llosa"
    t.boolean  "pilons"
    t.boolean  "pantalles"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "garantia_instalacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "venciment"
    t.string   "tipus"
    t.string   "instalacio"
    t.string   "empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "garantia_promotors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "venciment"
    t.string   "tipus"
    t.string   "referencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gas", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "instalacio_gas"
    t.boolean  "diposit_aire_lliure"
    t.boolean  "diposit_enterrat"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "identificacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_via_edifici"
    t.string   "via_edifici"
    t.string   "numero_edifici"
    t.string   "bloc_edifici"
    t.string   "escala_edifici"
    t.string   "cp_edifici"
    t.string   "poblacio_edifici"
    t.string   "provincia_edifici"
    t.string   "ref_cadastral"
    t.integer  "any_inici_construccio"
    t.integer  "any_fi_construccio"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "planol_emplacament_file_name"
    t.string   "planol_emplacament_content_type"
    t.integer  "planol_emplacament_file_size"
    t.datetime "planol_emplacament_updated_at"
    t.string   "foto_facana_file_name"
    t.string   "foto_facana_content_type"
    t.integer  "foto_facana_file_size"
    t.datetime "foto_facana_updated_at"
  end

  create_table "incendis", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "alarma_automatica"
    t.boolean  "alarma_manual"
    t.boolean  "extintors"
    t.boolean  "abastiment_aigua"
    t.boolean  "bie"
    t.boolean  "hidrants"
    t.boolean  "ruixadors"
    t.boolean  "columnes_seques"
    t.boolean  "parallamps"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "industrials", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_industrial"
    t.string   "nif_industrial"
    t.string   "adreca_industrial"
    t.string   "cp_industrial"
    t.string   "poblacio_industrial"
    t.string   "provincia_industrial"
    t.string   "pais_industrial"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "laboratoris", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_laboratori"
    t.string   "nif_laboratori"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "llicencies", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "classe"
    t.string   "data_llicencia"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "operacions", force: :cascade do |t|
    t.text     "descripcio_ca"
    t.text     "descripcio_es"
    t.decimal  "periodicitat"
    t.string   "periodicitat_text_ca"
    t.string   "periodicitat_text_es"
    t.string   "document_referencia"
    t.string   "responsable_ca"
    t.string   "responsable_es"
    t.boolean  "obligatorietat"
    t.boolean  "manual_habitatge"
    t.boolean  "creat_usuari"
    t.string   "sistema"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "projectistes", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_projectista"
    t.string   "titulacio_projectista"
    t.string   "rao_social_projectista"
    t.string   "nif_projectista"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "promotors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_promotor"
    t.string   "nif_promotor"
    t.string   "adreca_promotor"
    t.string   "cp_promotor"
    t.string   "poblacio_promotor"
    t.string   "provincia_promotor"
    t.string   "pais_promotor"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "referencies", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "operacio_id"
    t.string   "sistema"
    t.boolean  "manual_habitatge"
    t.boolean  "creat_usuari"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "regim_especials", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_regim_especial"
    t.string   "referencia_document"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "regim_propietats", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_regim_propietat"
    t.string   "document_escriptura"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sanejaments", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "no_sistema_evacuacio"
    t.boolean  "si_sistema_evacuacio"
    t.boolean  "fosa_septica"
    t.boolean  "bomba_elevacio"
    t.boolean  "separador_greixos"
    t.boolean  "baixants_vistos"
    t.boolean  "baixants_encastats"
    t.boolean  "baixants_ceramics"
    t.boolean  "baixants_pvc"
    t.boolean  "baixants_fibrociment"
    t.boolean  "baixants_coure"
    t.boolean  "baixants_alumini"
    t.boolean  "baixants_polipropile"
    t.boolean  "baixants_zinc"
    t.boolean  "colectors_vistos"
    t.boolean  "colectors_soterrats"
    t.boolean  "colectors_formigo"
    t.boolean  "colectors_ceramic"
    t.boolean  "colectors_fibrociment"
    t.boolean  "colectors_pvc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sistemes", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_sistema"
    t.string   "pare_sistema"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "subministradors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_subministrador"
    t.string   "nif_subministrador"
    t.string   "adreca_subministrador"
    t.string   "cp_subministrador"
    t.string   "poblacio_subministrador"
    t.string   "provincia_subministrador"
    t.string   "pais_subministrador"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tancaments_verticals", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "acabat_vist_paredat"
    t.boolean  "acabat_vist_carreus"
    t.boolean  "acabat_vist_fabrica_mao"
    t.boolean  "acabat_vist_fabrica_bloc_ceramic"
    t.boolean  "acabat_vist_bloc_formigo"
    t.boolean  "acabat_vist_panell_formigo"
    t.boolean  "acabat_vist_panell_metalic_sandwich"
    t.boolean  "acabat_revestit_arrebossat_pintat"
    t.boolean  "acabat_revestit_estucat"
    t.boolean  "acabat_revestit_morter_monocapa"
    t.boolean  "acabat_revestit_aplacat_ceramic"
    t.boolean  "acabat_revestit_aplacat_pedra"
    t.boolean  "acabat_revestit_xapa_metalica"
    t.boolean  "cambra_aire_facana"
    t.boolean  "fusteria_fusta"
    t.boolean  "fusteria_acer"
    t.boolean  "fusteria_alumini"
    t.boolean  "fusteria_pvc"
    t.boolean  "vidre_simple"
    t.boolean  "vidre_doble"
    t.boolean  "vidre_triple"
    t.boolean  "vidre_baix_emissiu"
    t.boolean  "vidre_control_solar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "telecomunicacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "porter_audio"
    t.boolean  "porter_video"
    t.boolean  "antena_individual"
    t.boolean  "antena_colectiva"
    t.boolean  "parabolica_individual"
    t.boolean  "parabolica_colectiva"
    t.boolean  "telefonia"
    t.boolean  "riti"
    t.boolean  "rits"
    t.boolean  "ritu"
    t.boolean  "ritm"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "ventilacions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "habitatge_natural_conductes"
    t.boolean  "habitatge_natural_obertures"
    t.boolean  "habitatge_mecanica_conductes"
    t.boolean  "habitatge_mecanica_obertures"
    t.boolean  "habitatge_mecanica_control"
    t.boolean  "traster_natural_conductes"
    t.boolean  "traster_natural_obertures"
    t.boolean  "traster_mecanica_conductes"
    t.boolean  "traster_mecanica_obertures"
    t.boolean  "traster_mecanica_control"
    t.boolean  "magatzem_natural_conductes"
    t.boolean  "magatzem_natural_obertures"
    t.boolean  "magatzem_mecanica_conductes"
    t.boolean  "magatzem_mecanica_obertures"
    t.boolean  "magatzem_mecanica_control"
    t.boolean  "garatge_natural_conductes"
    t.boolean  "garatge_natural_obertures"
    t.boolean  "garatge_mecanica_conductes"
    t.boolean  "garatge_mecanica_obertures"
    t.boolean  "garatge_mecanica_control"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
