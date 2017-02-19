# Actualizar el keyring
execute 'sudo apt-key update' do
  ignore_failure true
  timeout 60
end

# Actualizar información de paquetes
execute 'sudo apt-get update' do
  ignore_failure true
  timeout 60
end

# Instalar actualizaciones para todos los paquetes instalados
execute 'sudo apt-get -y dist-upgrade' do
  ignore_failure true
end
