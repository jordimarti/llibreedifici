json.array!(@inscripcio_registrals) do |inscripcio_registral|
  json.extract! inscripcio_registral, :id, :edifici_id, :data, :tom, :foli, :llibre, :numero_finca, :registre
  json.url inscripcio_registral_url(inscripcio_registral, format: :json)
end
