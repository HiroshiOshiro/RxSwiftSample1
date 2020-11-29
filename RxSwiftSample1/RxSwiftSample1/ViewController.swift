//
//  ViewController.swift
//  RxSwiftSample1
//
//  Created by hiroshi on 2020/11/29.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // Observableの登録解除用
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UISearchBarの入力を検知してWikiのAPIをコール
        self.searchBar.rx.text.orEmpty
            .flatMapLatest { WikiRequest(query: $0).rx_send() }
            .map { $0.query?.search ?? [] }
            // APIのレスポンスとUITableViewをバインド
            // Identifierで設定した"Cell"でUITableViewCellを使いまわし
            .bind(to: self.tableView.rx.items(cellIdentifier: "Cell")) {
                // 検索結果のタイトルとURLを表示に反映
                $2.textLabel?.text = $1.title
                $2.detailTextLabel?.text = "https://ja.wikipedia.org/w/index.php?curid=\($1.pageid)"
            }
            .disposed(by: self.disposeBag)
    }
    
    
}

