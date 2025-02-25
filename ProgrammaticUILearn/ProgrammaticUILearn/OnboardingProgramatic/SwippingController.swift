//
//  SwippingController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 24.02.2025.
//

import UIKit

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } completion: { (_) in
            
        }
        
    }
    
    let pages = [
        Page(imageName: "1", headerText: "Join us today in our fun and games!", bodyText: "Body message"),
        Page(imageName: "2", headerText: "bla bla text", bodyText: "Body message two"),
        Page(imageName: "3", headerText: "hehe hoho huhuhu", bodyText: "Body message three"),
        Page(imageName: "4", headerText: "şasşefbjsşjkfb askjşbdfsşjkbd", bodyText: "Body message four")
    ]
    
    private lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: PageCollectionViewCell.identifier)
        collectionView.isPagingEnabled = true
        setupBottomControls()
    }
    
    
    //MARK: - Helpers
    private func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .equalCentering
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func handleNext() {
        print("İleriye tıkladım")
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let item = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: item, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrevious() {
        print("İleriye tıkladım")
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let item = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: item, at: .centeredHorizontally, animated: true)
    }
    
    
    //MARK: - Collectin View
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        print(x, view.frame.width, x / view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.identifier, for: indexPath) as! PageCollectionViewCell
        let page = pages[indexPath.row]
        cell.page = page
        //cell.bearImageView.image = UIImage(named: page.imageName)
        //cell.descriptionTextView.text = page.headerText
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
