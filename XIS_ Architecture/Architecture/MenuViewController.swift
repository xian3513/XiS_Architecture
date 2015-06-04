//
//  MenuViewController.swift
//  MBO_Swift
//
//  Created by kt on 15/5/4.
//  Copyright (c) 2015年 kt. All rights reserved.
//

import UIKit

class MenuViewController:XISMiddleViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //测试oc的block在swift下闭包运行
        backgroundDataProcessingWithIdentifer("dd", process: { () -> Void in
            println("process")
        }) { (finish, identifer) -> Void in
            if finish {
                println("finish   **  \(identifer)")
            }
        }
        openReachability()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         addColectionView()
        self.XISHTTPRequest(nil, identifer:"")
    }
    
    //实现父类HTTP回调方法
    override func XISHTTPSuccessWithData(data: NSData!, identifer: String!) {
        super.XISHTTPSuccessWithData(data, identifer: identifer)
    }
    
    override func XISHTTPFailWithStatusCode(statusCode: Int, identifer: String!) {
        super.XISHTTPFailWithStatusCode(statusCode, identifer: identifer)
    }
    
    func addColectionView() {
    let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 10
        collectionViewLayout.minimumLineSpacing = 10;
        collectionViewLayout.itemSize = CGSizeMake(60, 50)
        collectionViewLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        menuCollectionView.collectionViewLayout = collectionViewLayout
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    // 获取单元格
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath)
        -> UICollectionViewCell {
            let identify:String = "menuCollectionCell"
            
            // 获取设计的单元格，不需要再动态添加界面元素
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
                identify, forIndexPath: indexPath) as! UICollectionViewCell
            cell.backgroundColor = UIColor.redColor();
            return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

    }
}
