class CharacterViewModel {
    func loadHomeData() {
        let service = CharacterService()
        service.fetchHomeData { result in
            switch result {
            case .success(let homeData):
                print(homeData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

