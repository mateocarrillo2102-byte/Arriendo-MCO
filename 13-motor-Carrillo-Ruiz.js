/* ============================================================================
   EJERCICIO EN CLASE - "EL MOTOR DE MI PROYECTO"
   Clase 12 · Viernes 23-10-2026 · 35 minutos
   ----------------------------------------------------------------------------
   ESTE EJERCICIO ES EL ARRANQUE DEL TALLER 3. Lo que alcances a dejar hecho
   hoy en clase es trabajo adelantado: el Taller 3 pide exactamente esto, más
   dos consultas y la documentación. Se entrega el LUNES 26 DE OCTUBRE.

   Tu entidad deja de ser un objeto suelto y pasa a ser una CLASE: un molde
   que dice qué datos tiene y qué sabe hacer.

   CÓMO EJECUTARLO: clic derecho sobre 12-el-motor-de-mi-proyecto.html ->
   "Open with Live Server", y en el navegador F12 -> pestaña Console.

   NO SE ENTREGA HOY. Este mismo archivo, terminado y documentado, es el
   TALLER 3, que se entrega el lunes 26 de octubre renombrado como
   13-motor-APELLIDOS.js  (con su .html del mismo nombre).
   El enunciado completo y la rúbrica están en el documento del Taller 3.

   GRUPO: Plataforma Web para el arrendamiento de inmuebles en Maicao La guajira
   INTEGRANTES: Mateo Carrillo Soto y Leonardo Ruiz Navarro
   ENTIDAD PRINCIPAL: Inmueble

   
   ========================================================================== */
/*REGLA DE NEGOCIO 
la regla de negocio es disponible_presupuesto(presupuesto): un inmueble cumple si esta disponible para arrendar y su precio es menor que el presupuesto del cliente.
devuelve true cuando se cumplen ambas condiciones y false si el inmueble está ocupado o cuesta más que el presupuesto. */

/* ----------------------------------------------------------------------------
   PIEZA 1 (15 min) - LA CLASE
   El nombre de la clase es el de tu entidad, en singular y con mayúscula
   inicial: Pedido, Producto, Plato, Ruta, Consulta, Mod, Inmueble.

   El constructor recibe los MISMOS campos de tu Taller 1 y los guarda con
   this. Si se te olvida un this., ese dato se pierde y la ficha te va a
   imprimir undefined sin dar ningún error.
   ---------------------------------------------------------------------------- */

 class Inmueble {

   constructor(tipoInmueble, direccion, tipo, precio, disponible) {
     this.tipoInmueble = tipoInmueble;
     this.direccion = direccion;
     this.tipo = tipo;
     this.precio = precio;
     this.disponible = disponible;
   }

   // MÉTODO 1 - ficha(): devuelve la línea de texto de tu Taller 1,
   // pero con this. en vez del nombre de la variable.
   ficha() {
     return `#${this.tipoInmueble} - ${this.direccion} - ${this.tipo} - ${this.precio} - ${this.disponible}`;
   }

   // MÉTODO 2 - el que CALCULA. Es la función del paso 1 de la clase 11,
   // ahora adentro de la clase: ya no recibe parámetros, lee this.
   preciIva() {
     return Math.round(this.precio * 1.19);
   }
   // MÉTODO 3 - el que CAMBIA el objeto. Vender, despachar, bloquear,
   // marcar pagado, registrar descarga, arrendar, servir...
   cambiarDisponibilidad(estado) {
     this.disponible = estado;
   }

   // MÉTODO 4 - TU REGLA DE NEGOCIO del Taller 2, como método.
   // Devuelve true o false. Si la regla necesita un dato de afuera
   // (un umbral, un presupuesto), ese sí entra como parámetro.
   disponible_presupuesto(presupuesto) {
     return this.disponible && this.precio <= presupuesto;
   }
}



/* ----------------------------------------------------------------------------
   PIEZA 2 (5 min) - LA COLECCIÓN
   El mismo catálogo de la Clase 8, pero ahora cada fila se crea con new.
   Mínimo CINCO. Y que los valores NO sean todos iguales: tiene que haber
   filas que cumplan tu regla y filas que no.
   ---------------------------------------------------------------------------- */

const inmuebles = [
  new Inmueble("Casa", "Calle 1 # 2-3", "mes", 1000000, true),
  new Inmueble("Apartamento", "Calle 5 # 10-20", "mes", 1500000, true),
  new Inmueble("Patio", "Carrera 10 # 8-15", "día", 100000, false),
  new Inmueble("Salon de Eventos", "Calle 12 # 4-6", "hora", 200000, true),
  new Inmueble("Casa", "Carrera 5 # 15-30", "semana", 800000, false)
];




/* ----------------------------------------------------------------------------
   PIEZA 3 (15 min) - LAS CONSULTAS
   Cada una de estas, en noviembre, va a ser una ruta de tu API.
   ---------------------------------------------------------------------------- */

console.log("=== Inmuebles ===");
inmuebles.forEach(function (inmueble) {
  console.log(inmueble.ficha());
});


// CONSULTA 2 - Buscar UNO por su id, PROTEGIDO con if
//   find devuelve undefined cuando no encuentra. Sin el if, la línea
//   siguiente revienta con "Cannot read properties of undefined".
const direccionBuscada = "Calle 5 # 10-20";
const encontrado = inmuebles.find(function (inmueble) {
  return inmueble.direccion === direccionBuscada;
});
if (encontrado) {
  console.log(`Encontrado: ${encontrado.ficha()}`);
} else {
  console.log("No existe ningún registro con ese dato.");
} 

// CONSULTA 3 - Filtrar con TU REGLA, llamándola sobre el objeto
const presupuesto = 1200000;
const dentroDePresupuesto = inmuebles.filter(function (inmueble) {
  return inmueble.disponible_presupuesto(presupuesto);
});
console.log(`Disponibles dentro del presupuesto: ${dentroDePresupuesto.length} de ${inmuebles.length}`);

// CONSULTA 4 - Un total, usando el método que calcula
let total = 0;
inmuebles.forEach(function (inmueble) {
  total = total + inmueble.preciIva();
});
console.log(`Total: ${total}`);
console.log(`Antes:   ${inmuebles[0].disponible}`);
inmuebles[0].cambiarDisponibilidad(false);
console.log(`Después: ${inmuebles[0].disponible}`);
console.log(`Y el segundo sigue igual: ${inmuebles[1].disponible}`);
/* ----------------------------------------------------------------------------
   ANTES DE ENTREGAR
     [ ] Abrí el .html con Live Server y la consola imprimió algo.
     [ ] Todos los campos del constructor llevan this.
     [ ] Creé los objetos con new.
     [ ] Llamé los métodos CON paréntesis y los datos SIN paréntesis.
     [ ] La consulta 3 no devolvió ni 0 ni todas las filas.
     [ ] El método que cambia imprimió un antes y un después DISTINTOS.
     [ ] Los nombres de todos los integrantes están DENTRO de este archivo.
   ---------------------------------------------------------------------------- */
