//
//  ViewController.swift
//  UIKitMaraphone1
//
//  Created by Анас Бен Мустафа on 03.02.2024.
//

import UIKit

final class Square: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = bounds
    }
    
    private func setup() {
        layer.cornerRadius = 16
        backgroundColor = .gray
        setupGradient()
        setupShadow()
        setupLayout()
    }
    
    private func setupGradient() {
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(gradientLayer)
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 5)
        layer.shadowRadius = 5
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 100),
            widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

class ViewController: UIViewController {
    
    let square = Square()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(square)
        NSLayoutConstraint.activate([
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
    }

}

