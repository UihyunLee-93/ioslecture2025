//
//  ViewController.swift
//  UIkit0228_1
//
//  Created by Uihyun.Lee on 2/28/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    
    let items = Array(1...20).map {"card\($0)"}
    let images = Array(1...6).map {UIImage(named: "card\($0)")!}
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
                collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }

    //셀 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    //셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView?.image = images[indexPath.row]
        return cell
    }

}
// UICollectionViewDelegateFlowLayout 프로토콜을 채택하여 UICollectionView의 레이아웃을 조정
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - 셀 크기 설정
    // UICollectionView의 각 셀 크기를 반환하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 3  // 전체 너비에서 여백을 제외하고 3개의 열로 나눔
        return CGSize(width: width, height: width * 1.5)  // 정사각형 형태의 셀 크기 반환
    }

    // MARK: - 셀 간 간격 설정
    // 행(줄) 간 간격을 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10  // 각 행 간의 간격을 10pt로 설정
    }

    // 같은 행 내에서 항목들 간의 간격을 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10  // 같은 행 내의 셀들 사이 간격을 10pt로 설정
    }
}

