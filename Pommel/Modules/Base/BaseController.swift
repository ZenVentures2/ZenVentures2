//
//  BaseController.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit
import Foundation

typealias AlertHandler = ((UIAlertAction) -> Swift.Void)?

/// The parent of all controller inside app
class BaseController: UIViewController {
    
    /// The baseView of controller
    let baseView: BaseView
    
    /// The baseViewModel of controller
    let baseViewModel: BaseViewModel
    
    /// Check for when blur is applied
    var blurApplied = false
    
    var rightNavImage: UIImage! {
        didSet {
            searchButton.setImage(rightNavImage, for: .normal)
        }
    }
    
    ///back button
    lazy var backButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(back))
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .leftViewBackground
        button.layer.cornerRadius = 19.0
        button.imageView?.contentMode = .scaleAspectFit
        button.heightAnchor.constraint(equalToConstant: 38.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 38.0).isActive = true
        button.addTarget(self, action: #selector(rightNavBarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    ///search button
    lazy var rightNavigationButton: UIBarButtonItem = {
        let rightBarButton = UIBarButtonItem.init(customView: searchButton)
        return rightBarButton
    }()
    
    /// when view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// setup UI
        setupUI()
        
        ///setup navigation bar
        setupNavigationBar()
        
        /// observe events
        observeEvents()

    }
    
    /// Initializer for a controller
    /// - Parameters:
    ///   - baseView: the view associated with the controller
    ///   - baseViewModel: viewModel associated with the controller
    init(baseView: BaseView, baseViewModel: BaseViewModel) {
        self.baseView = baseView
        self.baseViewModel = baseViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Not available
    required init?(coder: NSCoder) {
        fatalError("Controller should never be instantiated from coder")
    }
    
    /// Load the base view as the view of controller
    override func loadView() {
        view = baseView
    }
    
    /// makes navigation bar translucen. After making the nav bar translucent, make sure to recal this function in "viewWillDisappear" with false so that navbar of other controller are not affected
    /// - Parameter status: true to make translucent, false to revert back to app default
    func makeNavBarTranslucent(status: Bool) {
        if status {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.isTranslucent = true
        } else {
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        }
        
    }
    
    /// setup trigger
    func setupUI() {}
    
    /// Observer for events
    func observeEvents() {}
    
    ///setup navigation bar
    func setupNavigationBar() {}
    
    func addNavigationBarTitleImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "carooLogoRed")
        navigationItem.titleView = imageView
    }
    
    ///adds back button in navigation bar
    func addBackButton() {
        navigationItem.leftBarButtonItem = backButton
    }
    
    func addRightNavBarButton(with image: UIImage = #imageLiteral(resourceName: "search")) {
        rightNavImage = image
        navigationItem.rightBarButtonItem = rightNavigationButton
    }
    
    func removeRightNavigationBarButton() {
        navigationItem.rightBarButtonItem = nil
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func rightNavBarButtonTapped() {
        debugPrint("override this method to implement action on search button")
    }
    
    /// Deint call check
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}

extension BaseController {
    
    /// Method to display simple alert with ok action
    /// - Parameter title: the title
    /// - Parameter msg: the message
    func showAlert(title: String = LocalizedKey.appName.value, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {[weak self] _ in
            self?.alertHandler()
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithOkHandler(title: String = LocalizedKey.appName.value, msg: String, alertAction: AlertHandler) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: alertAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    /// handling alerts
    @objc func alertHandler() {}
    
    /// Method to present alert with actions provided
    /// - Parameters:
    ///   - title: the title of alert
    ///   - msg: the message of alert
    ///   - actions: the actions to display
    ///   - completion: action completion handler
    func alert(title: String = LocalizedKey.appName.value, msg: String, actions: [Constant.AlertAction], completion: ((_ action: Constant.AlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        actions.forEach { action in
            let alertAction = UIAlertAction(title: action.rawValue, style: .default) { _ in
                completion?(action)
            }
            alert.addAction(alertAction)
        }
        present(alert, animated: true, completion: nil)
    }
}
