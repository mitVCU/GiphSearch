//
//  GifsViewModel.swift
//  GiphSearch
//
//

import Foundation

enum State {
    case idle
    case success
    case failure
    case loading
    case empty
    case invalidInput
}

class GifsViewModel {
    private(set) var gifs: [Gif] = []
    private(set) var state: State {
        didSet {
            delegate?.didUpdateState()
        }
    }
    
    weak var delegate: GifsViewModelDelegate?
    
    init() {
        state = .idle
    }
    
    func handleViewDidLoad() {
        delegate?.didUpdateState()
    }
}

// MARK: - Network Calls
extension GifsViewModel {
    @MainActor 
    func fetchGifs(for term: String) {
        self.state = .loading
        
        guard !term.isEmpty else {
            self.gifs = []
            self.state = .empty
            return
        }
        
        guard term.count <= 50 else {
            self.state = .invalidInput
            return
        }
        
        Task {
            do {
                self.gifs = try await NetworkService.request(type: Gifs.self, .search(term: term)).data
                self.state = .success
                
            } catch {
                print("Request failed with error: \(error)")
                self.gifs = []
                self.state = .failure
            }
        }
    }
}

protocol GifsViewModelDelegate: AnyObject {
    func didUpdateState()
}
