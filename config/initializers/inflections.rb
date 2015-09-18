# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'projectista','projectistes'
  inflect.irregular 'sistema','sistemes'
  inflect.irregular 'identificacio', 'identificacions'
  inflect.irregular 'fonamentacio', 'fonamentacions'
  inflect.irregular 'estructura', 'estructures'
  inflect.irregular 'coberta', 'cobertes'
  inflect.irregular 'aigua', 'aigues'
  inflect.irregular 'climatitzacio', 'climatitzacions'
  inflect.irregular 'ventilacio', 'ventilacions'
  inflect.irregular 'referencia', 'referencies'
  inflect.irregular 'operacio', 'operacions'
  inflect.irregular 'telecomunicacio', 'telecomunicacions'
  inflect.irregular 'llicencia', 'llicencies'
  inflect.irregular 'declaracio', 'declaracions'
  inflect.irregular 'carrega', 'carregues'
  inflect.irregular 'instalacio', 'instalacions'
  inflect.irregular 'observacio', 'observacions'
end