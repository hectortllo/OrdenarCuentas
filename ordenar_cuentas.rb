require 'byebug'

class OrdenarCuentas
  tipo_cuenta = ""
  def DevolverCuentas(cuentas, tipo_cuenta, ruta_tipo_cuenta)
    cuentas.each do |cuenta|
      tipo_cuenta.each do |tipo|
        #byebug
        if cuenta == tipo
          puts "Entré al if"
          open(ruta_tipo_cuenta, "a") do |file|
            file.write(cuenta)
            puts "Escribí en el archivo"
          end
        end
      end
    end
    archivo = File.readlines(ruta_tipo_cuenta)
    puts "Archivo: #{ruta_tipo_cuenta} " + "#{archivo.length}"
  end

  def buscarArchivos(ruta, 
                    ruta_tipo_cuenta_lectura, 
                    ruta_tipo_cuenta_escritura
                  )
    if File.exist?(ruta)
      #Leyendo archivos
      tipo_cuenta = File.readlines(ruta_tipo_cuenta_lectura)
      cuentas = File.readlines(ruta)

      #Abriendo el archivo y limpiándolo
      archivo_escritura = open(ruta_tipo_cuenta_escritura, "w")
      archivo_escritura.write("")

      #byebug
      DevolverCuentas(cuentas, tipo_cuenta, ruta_tipo_cuenta_escritura)
    else
      puts("Archivo inexistente")
    end
  end
end


orden = OrdenarCuentas.new

#Rutas para los archivos
ruta = "archivos/cuentas.txt"
ruta_act_corr_lectura = "archivos/act_corr_lectura.txt"
ruta_act_corr_escritura = "archivos/act_corr_escritura.txt"
ruta_act_no_corr_lectura = "archivos/act_no_corr_lectura.txt"
ruta_act_no_corr_escritura = "archivos/act_no_corr_escritura.txt"

#orden.buscarArchivos(ruta, ruta_act_corr_lectura, ruta_act_corr_escritura)
orden.buscarArchivos(ruta, ruta_act_no_corr_lectura, ruta_act_no_corr_escritura)
