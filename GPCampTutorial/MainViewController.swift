//
//  MainViewController.swift
//  PaperOnBoardTest
//
//  Created by work on 2019/11/19.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    //Outlet
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var ReserveButton: UIButton!
    
    //変数宣言
    private var ChangeCount = 0
    
    //CLLocationManagerの入れ物
    var myLocationManager: CLLocationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D!
    
    var latitude: CLLocationDegrees = 0.0
    var longitude: CLLocationDegrees = 0.0
    
    override func viewWillAppear(_ animated: Bool) {
    //初回起動時チュートリアルに飛ぶ（本番用）
    if UserDefaults.standard.object(forKey: "isFirstTime") == nil {
        toTutorialView()
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //予約ボタンのプロパティ
        ReserveButton.layer.masksToBounds = false
        ReserveButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        ReserveButton.layer.shadowColor = UIColor.gray.cgColor
        ReserveButton.layer.shadowOpacity = 0.9
        ReserveButton.layer.shadowRadius = 5
        
        //ダークモード回避
        self.overrideUserInterfaceStyle = .light
        
        //MapKit設定  start ***************************
        //CLLocationManagerをインスタンス化
        myLocationManager = CLLocationManager()
        //位置情報使用許可のリクエストを表示するメソッド
        myLocationManager.requestWhenInUseAuthorization()
        
        self.MapView.showsUserLocation = true
        self.MapView.setUserTrackingMode(.follow, animated: true)
        self.MapView.userTrackingMode = MKUserTrackingMode.followWithHeading
        
        //addPoint関数でピンを立てる
        //引数(緯度、軽度、タイトル名、サブタイトル名)
        addPoint(35.372948,136.360830,"【受付】鴨池荘","入浴施設があります")
        addPoint(35.375170,136.361790,"【受付】キャンプ場受付","販売・レンタルあります")
        addPoint(35.372415,136.362100,"【受付】GLAMP ELEMENT","高級キャンプ：グランピング施設")
        addPoint(35.371542,136.361665,"【遊】ドラゴンスライダー","１００メートルの滑り台！")
        addPoint(35.374195,136.362393,"【遊】天狗の丘","幼稚園〜小学生低学年向け")
        addPoint(35.372914,136.360160,"【遊】アスレサーキット","小学生以上向け")
        addPoint(35.374893,136.360226,"【遊】小さな遊具","２歳〜幼稚園向け、トイレ炊事場有り")
        addPoint(35.386252,136.363822,"【買】フレンドマート","最寄りのスーパー")
        addPoint(35.387599,136.363255,"【買】ドラッグゆたか","最寄りのドラッグストア")
        addPoint(35.384246,136.369364,"【買】セブン & i","最寄りのコンビニ")
        
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse{
            MapView.delegate = self
            myLocationManager.delegate = self
            myLocationManager.distanceFilter = 10
            myLocationManager.startUpdatingLocation()
        }
        
        //MapKit設定  end ***************************
    }
        
    //ピン作成関数
    func addPoint(_ latitude:CLLocationDegrees,_ longitude:CLLocationDegrees,_ title:String,_ subtitle:String){
        
        //ピン作成
        let annotation = MKPointAnnotation()
        //緯度軽度の指定
        annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        //タイトルとサブタイトルの設定
        annotation.title = title
        annotation.subtitle = subtitle
        //表示
        MapView.addAnnotation(annotation)
    }
        
    //位置情報取得に失敗した時のメソッド
    func locationManager(_ manager:CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }
    
    //ユーザーの位置取得
    func locationManager(manager:CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        userLocation = CLLocationCoordinate2DMake((manager.location?.coordinate.latitude)!, (manager.location?.coordinate.longitude)!)
    }
    
    //表示経路のプロパティ
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 1.0
        return renderer
    }
    
    //経路表示
    func routingOutside(){
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D( latitude:35.375170, longitude:136.361790 ), addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D( latitude:35.372578, longitude:136.368263 ), addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        
        var directions = MKDirections(request: request)
        
        directions.calculate{response, error in
            guard let unwrappedResponse = response else { return }
            //迂回ルート
            let route0:MKRoute = unwrappedResponse.routes[0] as MKRoute
            self.MapView.addOverlay(route0.polyline)
            self.MapView.setVisibleMapRect(route0.polyline.boundingMapRect, animated: true)
        }
        
        //上記ルートを必ず通ってから目的地に行く
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D( latitude:35.372578, longitude:136.368263 ), addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D( latitude:latitude, longitude:longitude ), addressDictionary: nil))
        directions = MKDirections(request: request)
        directions.calculate{response, error in
            guard let unwrappedResponse = response else { return }
            //迂回ルート
            let route:MKRoute = unwrappedResponse.routes[0] as MKRoute
            self.MapView.addOverlay(route.polyline)
            self.MapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
    }
    //初回チュートリアルに飛ばすための関数
    func toTutorialView(){
        let TutorialSB : UIStoryboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let viewController = TutorialSB.instantiateViewController(withIdentifier: "Tutorial")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    //予約ボタン動作
    @IBAction func ReserveButtonPush(_ sender: Any) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Reserve", bundle: nil)
        let viewController:UIViewController = storyBoard.instantiateViewController(withIdentifier: "Reserve")
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //表示切り替え
    @IBAction func ChangeViewButton(_ sender: Any) {
        ChangeCount += 1
        
        if ChangeCount > 6{
            ChangeCount = 1
        }
        
        switch ChangeCount {
        case 1:
            MapView.mapType = .hybrid
        case 2:
            MapView.mapType = .hybridFlyover
        case 3:
            MapView.mapType = .mutedStandard
        case 4:
            MapView.mapType = .satellite
        case 5:
            MapView.mapType = .satelliteFlyover
        case 6:
            MapView.mapType = .standard
        default:
            MapView.mapType = .standard
        }
        
    }
    
}
