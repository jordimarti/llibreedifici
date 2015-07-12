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

ActiveRecord::Schema.define(version: 20150712081354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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

end
