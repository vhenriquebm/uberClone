//
//  PassageiroViewController.swift
//  Uber
//
//  Created by Vitor Henrique Barreiro Marinho on 17/05/22.
//

import UIKit
import FirebaseAuth
import MapKit
import CoreLocation
import FirebaseDatabase

class PassageiroViewController: UIViewController, CLLocationManagerDelegate {
    
    var userLocation = CLLocationCoordinate2D()
    
    
    @IBOutlet weak var map: MKMapView!
    
    
    @IBAction func callUber(_ sender: Any) {
        
        guard let email = authentication.currentUser?.email else {return}
        
        let database = Database.database().reference()
        
        let requisicao = database.child("requisicoes")
        
        let dadosUsuario:[String: Any] = [
            "email":email,
            "nome":"Vitor",
            "latitude":userLocation.latitude,
            "longitude":userLocation.longitude
        ]
        
        requisicao.childByAutoId().setValue(dadosUsuario)
    }
    
    
    
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        
        if let location = locations.first {
            
            manager.stopUpdatingLocation()
            
            render(location: location)
            
            
            
        }
    }
    
    func render (location: CLLocation) {
        //location.coordinate.latitude
        
        //Passa as Coordenadas
        let coordinate = CLLocationCoordinate2D(latitude:location.coordinate.latitude , longitude:location.coordinate.longitude )
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        map.setRegion(region, animated: true)
        
        userLocation = coordinate
        
        //Cria uma anotação e adiciona ao mapa
        let anotacaoUsuario = MKPointAnnotation()
        anotacaoUsuario.coordinate = coordinate
        anotacaoUsuario.title = "Seu Local"
        map.addAnnotation(anotacaoUsuario)
        
        
        
    }
    
    
    
    
    
    
    let authentication = Auth.auth()
    
    @IBAction func logOutButton (sender: Any) {
        
        do {
            try         authentication.signOut()
            dismiss(animated: true)
            
            
        } catch  {
            print ("It was not possible to log out" )
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        // Here we can increase the localization accuracy
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
}



