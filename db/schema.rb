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

ActiveRecord::Schema.define(version: 20151122110146) do

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

  create_table "aptitud_certificats", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "numero_expedient"
    t.string   "codi_informe"
    t.string   "data_ite"
    t.string   "certificat_aptitud"
    t.string   "data_programa"
    t.string   "necessitat_verificacions_tecniques"
    t.string   "periodicitat_verificacions_tecniques"
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

  create_table "checklist_existent_plurifamiliars", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "iite",                               default: true
    t.boolean  "document_lliurament_iite",           default: true
    t.boolean  "comunicat_ens_local",                default: true
    t.boolean  "programa_rehabilitacio",             default: true
    t.boolean  "certificat_final_obra",              default: true
    t.boolean  "certificat_aptitud",                 default: true
    t.boolean  "certificacio_energetica",            default: true
    t.boolean  "instruccions_us",                    default: true
    t.boolean  "documents_justificatius_operacions", default: true
    t.boolean  "pressupostos_obres",                 default: true
    t.boolean  "certificats_instalacions_comunes",   default: true
    t.boolean  "certificats_inspeccions_tecniques",  default: true
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
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

  create_table "checklist_nou_unifamiliars", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "llicencies_preceptives",            default: true
    t.boolean  "certificat_final_obra",             default: true
    t.boolean  "acta_recepcio_obra",                default: true
    t.boolean  "escriptura_publica",                default: true
    t.boolean  "documents_garantia",                default: true
    t.boolean  "certificacio_energetica",           default: true
    t.boolean  "polissa_assegurances",              default: true
    t.boolean  "cedules_regims_juridics",           default: true
    t.boolean  "carregues_reals",                   default: true
    t.boolean  "documents_complementaris",          default: true
    t.boolean  "documents_acreditatius_ajuts",      default: true
    t.boolean  "documents_justificacio_operacions", default: true
    t.boolean  "declaracions_ce_ascensors",         default: false
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
    t.boolean  "terrat_tradicional"
    t.boolean  "terrat_invertida"
    t.boolean  "terrat_lamina_bituminosa_oxiasfalt"
    t.boolean  "terrat_lamina_bituminosa_betum"
    t.boolean  "terrat_lamina_pvc_resistent"
    t.boolean  "terrat_lamina_pvc_no_resistent"
    t.boolean  "terrat_lamina_epdm"
    t.boolean  "terrat_lamina_cautxu"
    t.boolean  "terrat_lamina_polietile"
    t.boolean  "terrat_lamina_plaques_bituminoses"
    t.boolean  "terrat_lamina_cautxu_sintetic"
    t.boolean  "terrat_lamina_pastes_bituminoses"
    t.boolean  "terrat_junta_dilatacio_cautxu_butil"
    t.boolean  "terrat_junta_dilatacio_cautxu_sintetic"
    t.boolean  "terrat_junta_dilatacio_emulsions_bituminoses"
    t.boolean  "terrat_junta_dilatacio_silicona"
    t.boolean  "terrat_acabat_enrajolat"
    t.boolean  "terrat_acabat_lloses_flotants"
    t.boolean  "terrat_acabat_graveta"
    t.boolean  "terrat_acabat_lamina_autoprotegida"
    t.boolean  "coberta_teula_arab"
    t.boolean  "coberta_teula_plana"
    t.boolean  "coberta_teula_ciment"
    t.boolean  "coberta_pissarra"
    t.boolean  "coberta_fibrociment"
    t.boolean  "coberta_asfaltica"
    t.boolean  "coberta_xapa_acer"
    t.boolean  "coberta_xapa_coure"
    t.boolean  "coberta_aillament_termic"
    t.boolean  "lluernes_fixes"
    t.boolean  "lluernes_practicables"
    t.boolean  "lluernes_entramat_formigo"
    t.boolean  "lluernes_perfils_alumini"
    t.boolean  "lluernes_entramat_acer"
    t.boolean  "lluernes_emmotllats_vidre"
    t.boolean  "lluernes_vidre_armat"
    t.boolean  "lluernes_vidre_laminat"
    t.boolean  "lluernes_poliester"
    t.boolean  "lluernes_policarbonat"
    t.boolean  "aillament_cambra_ventilada"
    t.boolean  "aillament_material_adossat"
    t.boolean  "aillament_formigo_alleugerit_aire"
    t.boolean  "aillament_formigo_alleugerit_arids"
    t.boolean  "aillament_lamines"
    t.boolean  "aillament_amorf"
    t.boolean  "aillament_mantes"
    t.boolean  "aillament_plaques"
    t.boolean  "aillament_poliestire_expandit"
    t.boolean  "aillament_poliestire_estrudit"
    t.boolean  "aillament_polietile_expandit"
    t.boolean  "aillament_polietile_reticulat"
    t.boolean  "aillament_fibra_vidre"
    t.boolean  "aillament_llana_roca"
    t.boolean  "aillament_fibres_textils"
    t.boolean  "aillament_fibres_celulosa"
    t.boolean  "aillament_escuma_poliureta"
    t.boolean  "aillament_escuma_fenolica"
    t.boolean  "aillament_escuma_resina_melamina"
    t.boolean  "aillament_argila_expandida"
    t.boolean  "aillament_perlita_expandida"
    t.decimal  "aillament_gruix"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "colaboradors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_colaborador"
    t.string   "titulacio_colaborador"
    t.string   "rao_social_colaborador"
    t.string   "nif_colaborador"
    t.string   "ambit_colaboracio"
    t.string   "projecte_parcial"
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "coordinadors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_coordinador"
    t.string   "titulacio_coordinador"
    t.string   "rao_social_coordinador"
    t.string   "nif_coordinador"
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
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

  create_table "element_predefinits", force: :cascade do |t|
    t.string   "nom_element"
    t.string   "sistema_element"
    t.text     "descripcio_ca"
    t.text     "descripcio_es"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "elements", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_element"
    t.string   "sistema_element"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "energia_certificats", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "numero_registre"
    t.string   "vigencia"
    t.string   "qualificacio_energetica"
    t.decimal  "consum_energia_primaria"
    t.decimal  "emissions_co2"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
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
    t.boolean  "parets_fabrica_mao_armada"
    t.boolean  "parets_bloc_ceramic"
    t.boolean  "parets_bloc_formigo"
    t.boolean  "parets_entramat_fusta"
    t.boolean  "pilars_mao"
    t.boolean  "pilars_ferro_colat"
    t.boolean  "pilars_acer"
    t.boolean  "pilars_formigo_armat"
    t.boolean  "jasseres_fusta"
    t.boolean  "jasseres_acer"
    t.boolean  "jasseres_formigo_armat"
    t.boolean  "jasseres_fusta_laminada"
    t.boolean  "jasseres_acer_formigo"
    t.boolean  "forjat_fusta"
    t.boolean  "forjat_metalic"
    t.boolean  "forjat_formigo_armat"
    t.boolean  "forjat_ceramica_armada"
    t.boolean  "entrebigat_taulell"
    t.boolean  "entrebigat_revolto_ceramic"
    t.boolean  "entrebigat_revolto_formigo"
    t.boolean  "volta_mao"
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
    t.boolean  "escala_acer"
    t.boolean  "escala_ceramica"
    t.boolean  "escala_llosa_armada"
    t.boolean  "escala_biguetes_formigo_armat"
    t.integer  "sobrecarregues_habitatges"
    t.integer  "sobrecarregues_zones_comuns"
    t.integer  "sobrecarregues_coberta_inclinada"
    t.integer  "sobrecarregues_coberta_plana"
    t.integer  "sobrecarregues_locals"
    t.integer  "sobrecarregues_garatges"
    t.integer  "sobrecarregues_trasters"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "execucio_directors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_director_execucio"
    t.string   "titulacio_director_execucio"
    t.string   "rao_social_director_execucio"
    t.string   "nif_director_execucio"
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
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
    t.boolean  "drenatge_perimetral"
    t.boolean  "camera_aire"
    t.boolean  "impermeabilitzacio_exterior"
    t.boolean  "impermeabilitzacio_interior"
    t.boolean  "sabates_paredat"
    t.boolean  "sabates_aillades"
    t.boolean  "sabates_continues"
    t.boolean  "llosa"
    t.boolean  "formigo"
    t.boolean  "formigo_armat"
    t.boolean  "pilons"
    t.boolean  "pantalles"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "garantia_constructors", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "venciment"
    t.string   "tipus"
    t.string   "referencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "origen_any_construccio"
    t.text     "observacions"
    t.string   "nom_empresa"
    t.string   "adreca_empresa"
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
    t.string   "logo_empresa_file_name"
    t.string   "logo_empresa_content_type"
    t.integer  "logo_empresa_file_size"
    t.datetime "logo_empresa_updated_at"
  end

  create_table "iites", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "referencia"
    t.string   "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importats", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.string   "servei_obra"
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "laboratoris", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_laboratori"
    t.string   "nif_laboratori"
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
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

  create_table "particions", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "envans_ceramica"
    t.boolean  "envans_cartro_guix"
    t.boolean  "envans_bloc_formigo"
    t.boolean  "envans_paves"
    t.boolean  "envans_fusta"
    t.boolean  "envans_plaques_alveolades"
    t.boolean  "celras_fibres_vegetals"
    t.boolean  "celras_fibres_minerals"
    t.boolean  "celras_plaques_guix"
    t.boolean  "celras_metalic"
    t.boolean  "celras_fusta"
    t.boolean  "aillament_sota_sostre"
    t.boolean  "aillament_sobre_sostre"
    t.boolean  "aillament_plaques"
    t.boolean  "aillament_mantes"
    t.boolean  "aillament_amorf"
    t.boolean  "aillament_fibra_vidre"
    t.boolean  "aillament_polietile_reticulat"
    t.boolean  "aillament_llana_roca"
    t.boolean  "aillament_escuma_fenolica"
    t.boolean  "aillament_escuma_poliureta"
    t.boolean  "aillament_polietile_expandit"
    t.boolean  "aillament_fibres_textils"
    t.boolean  "aillament_argila_expandida"
    t.boolean  "aillament_escuma_melamina"
    t.boolean  "aillament_poliestire_extrudit"
    t.boolean  "aillament_celulosa"
    t.boolean  "aillament_perlita_expandida"
    t.boolean  "aillament_suro_aglomerat"
    t.boolean  "revestiment_vertical_enguixat"
    t.boolean  "revestiment_vertical_arrebossat"
    t.boolean  "revestiment_horitzontal_enguixat"
    t.boolean  "revestiment_horitzontal_arrebossat"
    t.boolean  "acabat_pintat"
    t.boolean  "acabat_aplacat_ceramica"
    t.boolean  "acabat_empaperat"
    t.boolean  "acabat_taulell_fusta"
    t.boolean  "acabat_sintetic"
    t.boolean  "acabat_textil"
    t.boolean  "acabat_estuc"
    t.boolean  "acabat_aplacat_pedra"
    t.boolean  "acabat_fusta"
    t.boolean  "acabat_suro"
    t.boolean  "paviment_formigo"
    t.boolean  "paviment_pedra_natural"
    t.boolean  "paviment_terratzo"
    t.boolean  "paviment_mosaic_hidraulic"
    t.boolean  "paviment_suro"
    t.boolean  "paviment_ceramica_natural"
    t.boolean  "paviment_ceramica_esmaltada"
    t.boolean  "paviment_gres_natural"
    t.boolean  "paviment_goma"
    t.boolean  "paviment_parquet_encolat"
    t.boolean  "paviment_parquet_flotant"
    t.boolean  "paviment_parquet_llates"
    t.boolean  "paviment_pvc"
    t.boolean  "paviment_moqueta"
    t.boolean  "paviment_linoleum"
    t.boolean  "porta_bastiment_fusta"
    t.boolean  "porta_bastiment_metalic"
    t.boolean  "porta_fulla_massissa_fusta"
    t.boolean  "porta_fulla_aplacat_fusta"
    t.boolean  "porta_fulla_vidre"
    t.boolean  "porta_fulla_alumini"
    t.boolean  "porta_fulla_ferro"
    t.boolean  "porta_acabat_pintat"
    t.boolean  "porta_acabat_lacat"
    t.boolean  "porta_acabat_envernissat"
    t.boolean  "porta_ferratge_llauto"
    t.boolean  "porta_ferratge_acer_llautonat"
    t.boolean  "porta_ferratge_acer_niquelat"
    t.boolean  "porta_ferratge_acer_inoxidable"
    t.boolean  "porta_ferratge_alumini"
    t.boolean  "barana_ferro_forjat"
    t.boolean  "barana_perfils_acer"
    t.boolean  "barana_perfils_alumini"
    t.boolean  "barana_fusta"
    t.boolean  "barana_pvc"
    t.boolean  "barana_vidre_laminat"
    t.boolean  "barana_metacrilat"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "projectistes", force: :cascade do |t|
    t.integer  "edifici_id"
    t.string   "nom_projectista"
    t.string   "titulacio_projectista"
    t.string   "rao_social_projectista"
    t.string   "nif_projectista"
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
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
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "referencia_calendaris", force: :cascade do |t|
    t.integer  "edifici_id"
    t.integer  "operacio_id"
    t.integer  "any"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "telefon"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tancaments_verticals", force: :cascade do |t|
    t.integer  "edifici_id"
    t.boolean  "paret_pedra"
    t.boolean  "paret_mao_massis"
    t.boolean  "paret_mao_perforat"
    t.boolean  "paret_bloc_morter"
    t.boolean  "paret_bloc_formigo_lleuger"
    t.boolean  "plafons_formigo_massis"
    t.boolean  "plafons_formigo_alveolat"
    t.boolean  "plafons_formigo_aillant"
    t.boolean  "mur_cortina"
    t.boolean  "acabat_obra_vista"
    t.boolean  "acabat_revestiment_arrebossat"
    t.boolean  "acabat_pintura_plastica"
    t.boolean  "acabat_pintura_silicat"
    t.boolean  "acabat_revestiment_resines"
    t.boolean  "acabat_pintura_cals"
    t.boolean  "acabat_esgrafiat"
    t.boolean  "acabat_estuc_cals"
    t.boolean  "acabat_morter_monocapa"
    t.boolean  "acabat_aplacat_pedra"
    t.boolean  "acabat_aplacat_enrajolat"
    t.boolean  "acabat_aplacat_plafons"
    t.boolean  "acabat_aplacat_fixacio_morter"
    t.boolean  "acabat_aplacat_fixacio_acer_galvanitzat"
    t.boolean  "acabat_aplacat_fixacio_acer_inoxidable"
    t.boolean  "acabat_aplacat_fixacio_alumini"
    t.boolean  "cambra_aire_facana"
    t.boolean  "aillament_termic"
    t.boolean  "parets_mitgeres_enva_ceramica"
    t.boolean  "parets_mitgeres_xapa_acer"
    t.boolean  "parets_mitgeres_arrebossat"
    t.boolean  "parets_mitgeres_pintura_silicat"
    t.boolean  "parets_mitgeres_plaques_fibrociment"
    t.boolean  "parets_mitgeres_pintura_plastica"
    t.boolean  "parets_mitgeres_pintura_cals"
    t.boolean  "balcons_llosana_pedra"
    t.boolean  "balcons_solera_ancorada"
    t.boolean  "balcons_formigo_armat"
    t.boolean  "balcons_acer"
    t.boolean  "ampits_xapa_metalica"
    t.boolean  "ampits_ceramica"
    t.boolean  "ampits_prefabricat_formigo"
    t.boolean  "llindes_formigo_armat"
    t.boolean  "llindes_ceramics"
    t.boolean  "llindes_acer"
    t.boolean  "baranes_pedra_natural"
    t.boolean  "baranes_pedra_artificial"
    t.boolean  "baranes_obra"
    t.boolean  "baranes_ferro_forjat"
    t.boolean  "baranes_perfils_acer"
    t.boolean  "baranes_fusta"
    t.boolean  "baranes_malla_metalica"
    t.boolean  "baranes_vidre_laminat"
    t.boolean  "baranes_perfils_alumini"
    t.boolean  "reixes_ferro_forjat"
    t.boolean  "reixes_alumini"
    t.boolean  "persianes_enrotllables_pvc"
    t.boolean  "persianes_enrotllables_alumini"
    t.boolean  "persianes_enrotllables_fusta"
    t.boolean  "persianes_llibret_pvc"
    t.boolean  "persianes_llibret_alumini"
    t.boolean  "persianes_llibret_acer"
    t.boolean  "persianes_llibret_fusta"
    t.boolean  "gelosies_prefabricat_formigo"
    t.boolean  "gelosies_lameles_metaliques"
    t.boolean  "gelosies_lameles_plastic"
    t.boolean  "gelosies_ceramica"
    t.boolean  "fusteria_fusta"
    t.boolean  "fusteria_acer"
    t.boolean  "fusteria_alumini"
    t.boolean  "fusteria_pvc"
    t.boolean  "vidre_simple"
    t.boolean  "vidre_doble"
    t.boolean  "vidre_triple"
    t.boolean  "vidre_baix_emissiu"
    t.boolean  "vidre_control_solar"
    t.integer  "sobrecarrega_repartida_balco"
    t.integer  "sobrecarrega_linial_vora_balco"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
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
