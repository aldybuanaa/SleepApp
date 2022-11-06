//
//  HomeViewController.swift
//  SleepApp
//
//  Created by aldybuana on 04/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Outlet collection view paling awal
    @IBOutlet weak var collectionView: UICollectionView!
    weak var recomendedListCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    // dipanggil saat viewDidLoad
    func setup(){
        // harus implemen protocol seperti table view
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// implementasi code banyak di extension
// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    //
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return 2
        }
        else {
            return 1
        }
    }
    
    // jumlah item di section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView { // jika collectionView = colelectionView pertama (secara vertical)
            if section == 0 { // jika section = section pertama return 4 item
                return 3 // jumlah item section 1
            }
            else { // jika bukan section pertama return 1 baris ke kanan
                return 1 // jumlah item section 2
            }
        }
        else { // jika bukan collectionView pertama return 6 item di section 2 (Horizontal)
            return 6
        }
    }
    
    // configure cell pada item tertentu
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 
        if collectionView == self.recomendedListCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recomended", for: indexPath) as! RecomendedViewCell
            
            let isOdd = indexPath.row % 2 == 1
            cell.imageView.image = isOdd ? UIImage(named: "img_focus") : UIImage(named: "img_happiness")
            cell.titleLabel.text = isOdd ? "Focus" : "Happiness"
            cell.subtitleLabel.text = isOdd ? "MEDITATION 5-10 MIN" : "MEDITATION 3-7 MIN"
            
            return cell
        }
        //
        else {
            if indexPath.section != 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recomendedList", for: indexPath) as! RecomendedListViewCell
                
                cell.collectionView.backgroundColor = .clear
                
                self.recomendedListCollectionView = cell.collectionView
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                
                return cell
            }
            else {
                if indexPath.item == 2 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item2", for: indexPath) as! HomeItem1ViewCell
                    
                    cell.backgroundImageView.backgroundColor = UIColor.lightGray
                    cell.titleLabel.text = "Daily Thought"
                    cell.subtitleLabel.text = "MEDITATION"
                    cell.durationLabel.text = "5-10 MIN"
                    
                    cell.delegate = self
                    
                    return cell
                }
                else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item1", for: indexPath) as! HomeItem1ViewCell
                    
                    let item = indexPath.item
                    cell.backgroundImageView.backgroundColor = item == 0 ? UIColor(rgb: 0x8E97FD) : UIColor(rgb: 0xFFC97E)
                    cell.titleLabel.text = item == 0 ? "Basics" : "Relaxation"
                    cell.subtitleLabel.text = item == 0 ? "COURSE" : "MUSIC"
                    cell.durationLabel.text = item == 0 ? "3-10 MIN" : "5-10 MIN"
                    
                    return cell
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        let titleLabel = view.viewWithTag(100) as! UILabel
        let subtitleLabel = view.viewWithTag(101) as! UILabel
        
        if indexPath.section == 0 {
            titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            titleLabel.text = "Good Morning"
            subtitleLabel.isHidden = false
            subtitleLabel.text = "We wish you have a good day"
        }
        else {
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
            titleLabel.text = "Recomended For You"
            subtitleLabel.isHidden = true
        }
        
        return view
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.collectionView {
            if section == 0 {
                return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            }
            else {
                return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
            }
        }
        else {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.recomendedListCollectionView{
            return CGSize(width: 163, height: 161)
        }
        else {
            if indexPath.section != 0 {
                let screenWidth = UIScreen.main.bounds.width
                
                return CGSize(width: screenWidth, height: 161)
            }
            else {
                if indexPath.item == 2 {
                    let leftInset: CGFloat = 20.0
                    let rightInset: CGFloat = 20.0
                    
                    let screenWidth = UIScreen.main.bounds.width
                    let width = screenWidth - (leftInset + rightInset)
                    let height = 88.0
                    return CGSize(width: width, height: height)
                }
                else {
                    let leftInset: CGFloat = 20.0
                    let rightInset: CGFloat = 20.0
                    let itemSpacing: CGFloat = 20.0
                    let colomn: CGFloat = 2
                    
                    let screenWidth = UIScreen.main.bounds.width
                    let width = floor((screenWidth - (leftInset + rightInset + (itemSpacing * (colomn - 1)))) / colomn)
                    let height = 210 / 177 * width
                    
                    return CGSize(width: width, height: height)
                }
            }
        }
    }
}

// MARK: - HomeItem1ViewCellDelegate
extension HomeViewController: HomeItem1ViewCellDelegate {
    func homeItem1ViewCellStartButtonTapped(_ cell: HomeItem1ViewCell) {
        
        presentPlayerViewController()
//        showPlayerViewController()
    }
}
