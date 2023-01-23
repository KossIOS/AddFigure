//
//  ViewController.swift
//  SonyaCat
//
//  Created by Konstantyn Koroban on 05/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print(Self.self, #function)
        
        addNewRectangle()
        
        let someView = UIView()
        someView.backgroundColor = .blue
        someView.frame.size = CGSize(width: 100, height: 100)
        someView.layer.cornerRadius = 50
        someView.center = view.center
        view.addSubview(someView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Self.self, #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(Self.self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(Self.self, #function)
    }
    var count = 0 
    @IBAction func didNewRectangleTapped(_ sender: Any) {
        addNewRectangle()
        count += 1
    }
    
    private func addNewRectangle() {
        let rectangleView = UIView()
        let randomSize = makeRandomSize()
        let randomFrame = CGRect(
            origin: makeRandomPosition(for: randomSize),
            size: randomSize
        )
        
        rectangleView.frame = randomFrame
        
        rectangleView.backgroundColor = makeRandomColor()
        
        rectangleView.layer.cornerRadius = 15
        
        
        view.addSubview(rectangleView)
        
        let tapGesture = UITapGestureRecognizer (target: self, action: #selector(didTap))
        rectangleView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func didTap(_ sender: UIGestureRecognizer) {
        guard let view = sender.view else { return }
        moveView(view)
        
    }
    
    private func moveView (_ view : UIView) {
        view.frame.origin = makeRandomPosition(for: view.frame.size)
    }
    
    private func makeRandomPosition(for size: CGSize) -> CGPoint {
        CGPoint(
            x: .random(in: 0...(view.frame.width - size.width)),
            y: .random(in: 0...(view.frame.height - size.height))
        )
    }
    
    
    private func makeRandomSize() -> CGSize {
        CGSize(width: .random(in: 30...60), height: .random(in:30...60))
    }
    private func makeRandomColor() -> UIColor {
        UIColor(red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1)
    }
    
}
