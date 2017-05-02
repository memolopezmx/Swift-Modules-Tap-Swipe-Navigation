Swift Module: Tap Swipe Navigation
===========

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Tap-Swipe-Navigation/blob/master/video.gif" width="320" height="568" />
</p>

## Descripción
Es muy utilizado emular los Tabs con el gesto Swipe entre Views como se hace en Android, sólo que para iOS ésto NO viene por defecto sino hay que crear lo. 
La manera más eficiente de hacerlo es usando el siguiente pod:

* CarbonKit

Como lo descripbe en su repositorio original: [CarbonKit](https://github.com/ermalkaleci/CarbonKit) es una librería para iOS "open source" que incluye potentes y atractivos componentes de interfaz de usuario.

A continuación veremos un ejemplo de como implementarlo, anexamos la liga de esta librería al final del tutorial.

## Implementación

#### Paso 1

Lo primero que hay que hacer es instalar el pod. Para eso basta hacer lo siguiente:

* Abrimos una terminal
* Nos movemos a la carpeta del proyecto
* Ejecutamos el comando "pod init" el cual nos genera un archivo llamado "Podfile"
* Lo abrimos y debajo de "# Pods for NombreDeMiProyecto" pegamos lo siguiente: pod 'CarbonKit'
* Guardamos y en la terminal ejecutamos "pod install"
* Esperamos, cerramos el Xcode y abrimos "NombreDeMiProyecto.xcworkspace" 

### Paso 2

* En nuestro ViewController hasta arriba agregamos: 
```import CarbonKit```

* Agregamos el siguiente protocolo: CarbonTabSwipeNavigationDelegate
se vería algo así: 
```class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
	...
	}```

* Dentro del viewDidLoad agregamos lo siguiente:
```let items = ["UnoViewController", "DosViewController", "TresViewController"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)```

* Posteriormente completamos el protocolo:

```
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        var vc = UIViewController()
        
        switch index {
        case 0:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
        return vc
    }
```
* Por último nos vamos a nuestro StoryBoards y arrastramos 3 ViewControllers. Seleccionamos el primero y del lado derecho en el Inspector buscamos donde dice: Identity -> StoryboardsID y colocamos: UnoViewController. Posteriormente creamos un nuevo archivo controlador lo nombramos como: UnoViewController y se lo asociamos a nuestra vista en el inspector: Custom Class -> Class.

Haremos esto con los otros dos Controlers.

##### Nota:

Puede que nos marque un circulo rojo, no hay ningun problema al correr el proyecto se quita.

* Al final nuestro código se vería algo así:

```
import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let items = ["UnoViewController", "DosViewController", "TresViewController"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        var vc = UIViewController()
        
        switch index {
        case 0:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
```

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Tap-Swipe-Navigation/blob/master/video.gif" width="320" height="568" />
</p>


#### Paso 3

Si quisieramos personalizar lo podriamos modificar nuestro código algo así:

```
import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let items = ["CERCA DE TI", "EVENTOS", "PROMOCIONES"]
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)

        self.style()
    
    }
    
    func style() {
        let color: UIColor = UIColor(red: 121.0 / 255, green: 148.0 / 255, blue: 180.0 / 255, alpha: 1)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setTabExtraWidth(8)
        
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3, forSegmentAt: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3, forSegmentAt: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3 + 5, forSegmentAt: 2)
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.black.withAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFont(ofSize: 14))

    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        
        switch index {
        case 0:
            return self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            return self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            return self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
        // return viewController at index
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
```

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Tap-Swipe-Navigation/blob/master/video.gif" width="320" height="568" />
</p>

#### Fuente

[CarbonKit](https://github.com/ermalkaleci/CarbonKit/)
















