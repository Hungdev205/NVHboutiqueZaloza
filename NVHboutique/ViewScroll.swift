//
//  ViewScroll.swift
//  NVHboutique
//
//  Created by Hùng Nguyễn  on 7/21/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var pageImages: [String] = []
    var first = false
    
    var photo = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["shop1","shop2","shop3","shop4","shop5","shop6","shop7","shop8"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImages.count
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
    }
    
    override func viewDidLayoutSubviews() {
        if (!first) {
             first = true
            let pageScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSizeMake( pageScrollViewSize.width * CGFloat(pageImages.count), 0)
            for (var i = 0; i < pageImages.count;i++)
            {
                let imgView = UIImageView(image: UIImage(named: pageImages[i]+".jpg"))
                imgView.frame = CGRectMake( CGFloat(i) * scrollView.frame.size.width , 0, scrollView.frame.size.width, scrollView.frame.size.height)
                
                imgView.contentMode = .ScaleAspectFit
                
                self.scrollView.addSubview(imgView)
                
            }

        }
    }
    
    //  tap vao pageController thi chuyen content
    @IBAction func changePage(sender: AnyObject) {
        scrollView.contentOffset = CGPointMake((CGFloat(pageController.currentPage) * scrollView.frame.size.width), 0)
        
        
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return photo
    }

    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        switch scrollView.contentOffset {
        case CGPointMake(0, 0):
            pageController.currentPage = 0
        case CGPointMake(scrollView.frame.size.width, 0):
            pageController.currentPage = 1
        case CGPointMake(2 * scrollView.frame.size.width, 0):
            pageController.currentPage = 2
        case CGPointMake(3 * scrollView.frame.size.width, 0):
            pageController.currentPage = 3
        case CGPointMake(4 * scrollView.frame.size.width, 0):
            pageController.currentPage = 4
        case CGPointMake(5 * scrollView.frame.size.width, 0):
            pageController.currentPage = 5
        case CGPointMake(6 * scrollView.frame.size.width, 0):
            pageController.currentPage = 6
        case CGPointMake(7 * scrollView.frame.size.width, 0):
            pageController.currentPage = 7
        default:
            break
        }
   }
    
}
