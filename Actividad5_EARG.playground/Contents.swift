import UIKit
/*:
# Playground - Actividad 5
* Class y Struct
* Extension
* Optional
*/

/*: 
### Actividad Class y Struct
A) Diseñar la clase Persona que contenga dos metodos, el primero "Saludar" que reciba el parámetro nombre y regrese el mensaje el nombre mas el texto "mucho gusto", el segundo metodo "Caminar" que reciba como parámetro un tipo de dato Int y regrese un tipo de dato String indicando el numero de pasos caminados.
*/
class Persona {
    var nombre = ""
    var saludo = ""
    var caminar = 0

    init(nombre: String, saludo: String, caminar: Int) {
        self.nombre = nombre
        self.saludo = saludo
        self.caminar = caminar
    }
    
    func nombre(mensaje:String) {
        self.nombre = mensaje
    }
    
    func saludo(mensaje:String) {
        self.saludo = mensaje
    }
    
    func Caminar(pasos:Int) {
        self.caminar = pasos
    }
}

var azael = Persona(nombre: "",saludo: "",caminar: 20)
azael.nombre(mensaje: "Azael")
azael.saludo(mensaje: "mucho gusto")
azael.Caminar(pasos: 20)

print("Hola mi nombre es \(azael.nombre), \(azael.saludo) he camindado \(azael.caminar) pasos" )

//: B) Diseñar el struct "Pantalla" la cual recibirá como como parametros el ancho y alto de una pantalla como tipo de datos Int con un constructor, para inicializar la estructura.
struct Video{
    var alto:Int
    var ancho:Int
    
    init(alto:Int, ancho:Int) {
        self.alto = alto
        self.ancho = ancho
    }
    
    func resolucion() -> (Int, Int) {
        return (self.alto, self.ancho)
    }
}

var HD = Video(alto: 720, ancho: 1280)
var FullHD = Video(alto: 1080, ancho: 1920)

HD.resolucion()
FullHD.resolucion()
/*:
### Extensions
A) Diseñar un extensión del tipo de dato Int que represente las horas y que pueda regresar los segundos correspondientes (puedes utilizar una función o una variable computada)
*/
extension Int {
    var dias:Int{
        return self*12*30
    }
    func horas() -> Int {
        return self*24*60
    }
}

4.dias
4.horas()

//: B) Diseñar una extensión del tipo de dato String que represente un día de la semana y regrese el numero correspondiente iniciando con Domingo = 1 y finalizando Sábado = 7
extension Calendar {
    enum semana: String, CaseIterable, CustomStringConvertible {
        case domingo, lunes, martes, miercoles, jueves, viernes, sabado
        var description: String { rawValue.capitalized }
        var value: Int { Self.allCases.firstIndex(where: {$0.rawValue == rawValue})! + 1 }
    }
}
let domingo = Calendar.semana.domingo
print(domingo)        // domingo
print(domingo.value)  // 1

let sabado = Calendar.semana.sabado
print(sabado)        // sabado
print(sabado.value)  // 7
/*:
### Optionals
A) Diseñar una variable optional para recibir el tipo de dato Int en caso de que exista.
*/
extension String {
    var semana: Int? { Calendar.semana(rawValue: lowercased())?.value }
}
//: B) Para la colección let dias = ["GDL":120, "PUE":300, "MTY":100, "CDMX":200] diseñar una variable opcional para recibir el valor de dias["DF"]
