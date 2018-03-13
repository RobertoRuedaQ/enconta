
# Encontra prueba

**Respuesta**
Entre enero de 2017 y Diciembre 31 de 2017 el usuario identificado con el id `8672e846-9c89-4dbf-a1cc-b85a2da5abe1` tiene 1604 facturas.

**Cómo lo sabemos?**
Creamos el método `bills_counter`:
```def bills_counter
		id = "8672e846-9c89-4dbf-a1cc-b85a2da5abe1"
		start_date = Date.parse "2017-01-01"
		end_date = Date.parse "2017-12-31"
		days = 15
		sum = 0 

		until start_date >= end_date do
		  offset = (start_date + days) < end_date ? start_date + days : end_date
		  bills_quantity = HTTParty.get("http://34.209.24.195/facturas?id=#{id}&start=#{start_date}&finish=#{offset}").parsed_response.to_i
		  sum += bills_quantity
		  start_date = offset + 1
		end
		sum  	
	end```

Explico sus partes:

las primeras 5 líneas son las variables y constantes que vamos a utilizar. Luego se hace un `until` comenzando el primero día del año y terminando cuando coincida con el 31 de diciembre.

`offset` es un operador ternario, si la fecha de inicio más 15 días es menor al fin de año, sume los dias a la fecha actual, de lo contrario ponga el 31 de diciembre.

Luego se hace un llamado a servicio usando HTTParty, cambiando el llamado con las fechas indicadas. De la respuesta se toma solo el valor de la llave `parsed_response` y se cambia para que sea un entero. Ese número se suma a la variable `sum`. Para concluir se toma cambia la fecha de inicio por el resultado de offset (la nueva fecha, mas 1 día).

El método devuelve la suma.

**Cómo correr la aplicación**

 1. Verifica que en tu equipo se encuentre instalado Ruby y Ruby on Rails
 2. Crea un clon de este repositorio
 3. Desde la terminal accede a la carpeta y corre `bundle install`
 4. correr el servidor usando el comando: `rails s`
 5. En el navegador accede a  `localhost:3000`

 **Para Tener en cuenta**
 	+La aplicación fue escrita en ruby 2.4 y rails 5.1

 	