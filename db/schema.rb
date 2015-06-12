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

ActiveRecord::Schema.define(version: 20150530141909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklist_edifici_nou_plurifamiliars", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "dades",                                 default: false
    t.boolean  "planol_emplacament",                    default: false
    t.boolean  "foto_facana",                           default: false
    t.boolean  "promotor",                              default: false
    t.boolean  "projectista",                           default: false
    t.boolean  "constructor",                           default: false
    t.boolean  "director",                              default: false
    t.boolean  "director_execucio",                     default: false
    t.boolean  "laboratori",                            default: false
    t.boolean  "entitat_control",                       default: false
    t.boolean  "subministrador",                        default: false
    t.boolean  "industrial",                            default: false
    t.boolean  "llicencia",                             default: false
    t.boolean  "declaracio_obra_nova",                  default: false
    t.boolean  "regim_propietat",                       default: false
    t.boolean  "carregues",                             default: false
    t.boolean  "entitats_juridiques",                   default: false
    t.boolean  "acta_lliurament",                       default: false
    t.boolean  "canvis_titularitat",                    default: false
    t.boolean  "reformes",                              default: false
    t.boolean  "canvis_dades_inicials",                 default: false
    t.boolean  "ajuts",                                 default: false
    t.boolean  "assegurances",                          default: false
    t.boolean  "enunciats_incidencies",                 default: false
    t.boolean  "registre_operacions_manteniment",       default: false
    t.boolean  "registre_operacions_reparacio",         default: false
    t.boolean  "registre_operacions_millora",           default: false
    t.boolean  "registre_actuacions_arquitectoniques",  default: false
    t.boolean  "planols",                               default: false
    t.boolean  "esquemes_instalacions",                 default: false
    t.boolean  "descripcio_pes",                        default: false
    t.boolean  "instruccions_us_manteniment",           default: false
    t.boolean  "documents_substitucio",                 default: false
    t.boolean  "recomanacions_emergencies",             default: false
    t.boolean  "planols_habitatge",                     default: false
    t.boolean  "planols_elements_privatius",            default: false
    t.boolean  "instruccions_us_manteniment_habitatge", default: false
    t.boolean  "garanties_manuals_equips",              default: false
    t.boolean  "llicencies_preceptives",                default: false
    t.boolean  "certificat_final_obra",                 default: false
    t.boolean  "acta_recepcio_obra",                    default: false
    t.boolean  "escriptura_publica",                    default: false
    t.boolean  "documents_garantia",                    default: false
    t.boolean  "documents_garantia_parts_comunes",      default: false
    t.boolean  "certificacio_energetica",               default: false
    t.boolean  "polissa_assegurances",                  default: false
    t.boolean  "escriptura_propietat_horitzontal",      default: false
    t.boolean  "estatus_comunitat",                     default: false
    t.boolean  "cedules_regims_juridics",               default: false
    t.boolean  "carregues_reals",                       default: false
    t.boolean  "documents_complementaris",              default: false
    t.boolean  "documents_acreditatius_ajuts",          default: false
    t.boolean  "documents_justificacio_operacions",     default: false
    t.boolean  "certificat_final_obra_instalacions",    default: false
    t.boolean  "declaracions_ce_ascensors",             default: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "checklist_edifici_nou_plurifamiliars", ["edifici_id"], name: "index_checklist_edifici_nou_plurifamiliars_on_edifici_id", using: :btree

  create_table "constructors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_constructor"
    t.string   "nif_constructor"
    t.string   "tipus_via_constructor"
    t.string   "via_constructor"
    t.string   "numero_constructor"
    t.string   "bloc_constructor"
    t.string   "escala_constructor"
    t.string   "pis_constructor"
    t.integer  "cp_constructor"
    t.string   "poblacio_constructor"
    t.string   "provincia_constructor"
    t.string   "pais_constructor"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "control_entitats", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_entitat_control"
    t.string   "nif_entitat_control"
    t.string   "tipus_via_entitat_control"
    t.string   "via_entitat_control"
    t.string   "numero_entitat_control"
    t.string   "bloc_entitat_control"
    t.string   "escala_entitat_control"
    t.string   "pis_entitat_control"
    t.integer  "cp_entitat_control"
    t.string   "poblacio_entitat_control"
    t.string   "provincia_entitat_control"
    t.string   "pais_entitat_control"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "dades_edifici_nous", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "tipus_via_edifici"
    t.string   "via_edifici"
    t.string   "numero_edifici"
    t.string   "bloc_edifici"
    t.string   "escala_edifici"
    t.integer  "cp_edifici"
    t.string   "poblacio_edifici"
    t.string   "provincia_edifici"
    t.string   "ref_cadastral"
    t.string   "us_edifici"
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

  create_table "directors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_director"
    t.string   "titulacio_director"
    t.string   "rao_social_director"
    t.string   "nif_director"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "directors_execucio", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_director_execucio"
    t.string   "titulacio_director_execucio"
    t.string   "rao_social_director_execucio"
    t.string   "nif_director_execucio"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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
    t.string   "tipus_via_entitat_control"
    t.string   "via_entitat_control"
    t.string   "numero_entitat_control"
    t.string   "bloc_entitat_control"
    t.string   "escala_entitat_control"
    t.string   "pis_entitat_control"
    t.integer  "cp_entitat_control"
    t.string   "poblacio_entitat_control"
    t.string   "provincia_entitat_control"
    t.string   "pais_entitat_control"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  create_table "industrials", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_industrial"
    t.string   "nif_industrial"
    t.string   "tipus_via_industrial"
    t.string   "via_industrial"
    t.string   "numero_industrial"
    t.string   "bloc_industrial"
    t.string   "escala_industrial"
    t.string   "pis_industrial"
    t.integer  "cp_industrial"
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
    t.string   "tipus_via_promotor"
    t.string   "via_promotor"
    t.string   "numero_promotor"
    t.string   "bloc_promotor"
    t.string   "escala_promotor"
    t.string   "pis_promotor"
    t.integer  "cp_promotor"
    t.string   "poblacio_promotor"
    t.string   "provincia_promotor"
    t.string   "pais_promotor"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "subministradors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_subministrador"
    t.string   "nif_subministrador"
    t.string   "tipus_via_subministrador"
    t.string   "via_subministrador"
    t.string   "numero_subministrador"
    t.string   "bloc_subministrador"
    t.string   "escala_subministrador"
    t.string   "pis_subministrador"
    t.integer  "cp_subministrador"
    t.string   "poblacio_subministrador"
    t.string   "provincia_subministrador"
    t.string   "pais_subministrador"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
