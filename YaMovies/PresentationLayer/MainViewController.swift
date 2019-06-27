//
//  MainViewController.swift
//  YaMovies
//
//  Created by Beslan Tularov on 23/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    enum Types {
        case dir
    }
    
    var router: Router!
    var realmManager: RealmManager!
    var tableView: UITableView!
    var collectionView: UICollectionView!
    var service: YandexOauthService!
    private var videos: Results<VideoObject>!
    private var folders: Results<FolderObject>!
    private var token: NotificationToken? = nil

    var selectedKey: String = "" {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
  
        title = "YaMovies"
        realmManager = RealmManager()
        folders = realmManager.realm.objects(FolderObject.self)
        videos = realmManager.realm.objects(VideoObject.self)

        setupObserver()
        tableViewConfigure()
        collectionViewConfigure()
        let network = NetworkImp()
        service = YandexOauthServiceImp(network: network)
        getContentBy("/")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func setupObserver() {

        token = folders.observe { (changes: RealmCollectionChange)  in
            switch changes {
            case .initial:
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let updates):
                let fromRow = { (row: Int) in return IndexPath(row: row, section: 0) }
                
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: insertions.map(fromRow), with: .automatic)
                self.tableView.reloadRows(at: updates.map(fromRow), with: .automatic)
                self.tableView.deleteRows(at: deletions.map(fromRow), with: .automatic)
                self.tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }

    private func tableViewConfigure() {
        
        let tableViewFrame = CGRect(x: 0, y: 140, width: (view.frame.width / 3) - 50, height: view.frame.height - 450)
        tableView = UITableView(frame: tableViewFrame)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GroupCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        view.addSubview(tableView)
    }
    
    private func collectionViewConfigure() {
        
        let layout = UICollectionViewFlowLayout()
        let collectionViewFrame = CGRect(x: (view.frame.width / 3), y: 140, width: (view.frame.width - tableView.frame.width) - 110, height: view.frame.height - 120)
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 48, left: 48, bottom: 48, right: 48)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "FilmsCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = folders[indexPath.row].name
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        // Run when press
        
        print("didHighlightRowAt \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        // Run when focus
        
        guard let indexPath = context.nextFocusedIndexPath else {
            return
        }
        
        
//        selectedKey = groups[indexPath.row]
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmsCell", for: indexPath) as! MovieCollectionViewCell
//        guard let models = films[selectedKey] else { return UICollectionViewCell() }
//        item.setup(models[indexPath.row])
        return item
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((collectionView.frame.width - (48 * 4) - 96)) / 4
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 48
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("didHighlightItemAt - \(indexPath.row)")
        performSegue(withIdentifier: "push", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        guard let nextFocusedIndexPath = context.nextFocusedIndexPath else { return }
        guard let nextItem = collectionView.cellForItem(at: nextFocusedIndexPath) else { return }
        
        UIView.animate(withDuration: 0.25) {
            
            nextItem.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            nextItem.layer.shadowColor = UIColor.black.cgColor
            nextItem.layer.shadowOffset = CGSize(width: 0, height: 15)
            nextItem.layer.shadowOpacity = 0.4
            nextItem.layer.shadowRadius = 10
        }
        
        guard let previouslyFocusedIndexPath = context.previouslyFocusedIndexPath else { return }
        guard let previousItem = collectionView.cellForItem(at: previouslyFocusedIndexPath) else { return }

        UIView.animate(withDuration: 0.5) {
            
            previousItem.transform = .identity
            previousItem.layer.shadowOpacity = 0
            previousItem.layer.shadowOffset = CGSize.zero
        }
        print("didUpdateFocusIn \(nextFocusedIndexPath.row)")
    }
    
}


extension MainViewController {
    
    func getContentBy(_ path: String) {
        
        service.getResourceBy(path, limit: 20, offset: 0) { (responce, error) in
            var folders: [FolderObject] = []
            guard let items = responce?._embedded?.items else { return }
            items.forEach({ (item) in
                if item.type == "dir" {
                    let folder = FolderObject()
                    folder.name = item.name
                    folder.created = item.created
                    folder.resourceId = item.resource_id ?? ""
                    folder.path = item.path
                    folder.type = item.type
                    folders.append(folder)
                }
            })
            self.realmManager.create(folders)
        }
    }
}
