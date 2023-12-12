//
//  GifViewController.swift
//  GiphSearch
//
//

import UIKit
import SDWebImage

class GifsViewController: UIViewController {
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    
    private var viewModel = GifsViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        // configure search bar
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "What is your favorite gif?"
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        
        // configure table view
        tableView.register(UINib(nibName: GifTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: GifTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        // upadte ViewModel
        viewModel.handleViewDidLoad()
    }
}

// MARK: - Search bar functions
extension GifsViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            viewModel.fetchGifs(for: text)
        }
        return true
    }
}

// MARK: - TableView functions
extension GifsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gifs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GifTableViewCell.identifier, for: indexPath) as! GifTableViewCell
        
        // update image view
        let gif = viewModel.gifs[indexPath.row].images.original
        let gifURL = URL(string: gif.url)
        cell.configure(gifImageUrl: gifURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let gif = viewModel.gifs[indexPath.row].images.original
        
        guard let height = NumberFormatter().number(from: gif.height),
              let width = NumberFormatter().number(from: gif.width)
        else {
            return 0.0
        }
        
        let ratio = CGFloat(truncating: height) / CGFloat(truncating: width)

        return tableView.frame.width * ratio
    }
}

// MARK: - ViewModel Delegate
extension GifsViewController: GifsViewModelDelegate {
    func didUpdateState() {
        switch self.viewModel.state {
        case .idle:
            self.tableView.setMessageView(title: "Look for some GIFs 🤩", message: "Or don't 😒")
            
        case .success:
            self.tableView.removeMessageView()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), 
                                       at: .top,
                                       animated: true)
            
        case .failure:
            self.tableView.reloadData()
            self.tableView.setMessageView(title: "Something went wrong", message: "Sorry, please try again 🥺")

        case .loading:
            self.tableView.setMessageView(title: "Getting those GIFs 🔍", message: "")

        case .empty:
            self.tableView.reloadData()
            self.tableView.setMessageView(title: "No Gifs 😩", message: "Try searching for something else")

        case .invalidInput:
            let alert = UIAlertController(title: "InvalidInput", 
                                          message: "The search term was too long",
                                          preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", 
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
