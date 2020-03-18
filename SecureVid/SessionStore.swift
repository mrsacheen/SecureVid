import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Combine

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self) }}
    @Published var profile: UserProfile?
    private var profileRepository = UserProfileRepository()
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid,displayName: user.displayName, email: user.email)
            }
            else {
                self.session = nil
                self.profile = nil
            }
        })
    }
    
//    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
//        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
//    }
    
    func signUp(email: String, password: String, firstName: String, lastName: String, city: String, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
      Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print("Error signing up: \(error)")
          completion(nil, error)
          return
        }

        guard let user = result?.user else { return }
        print("User \(user.uid) signed up.")

        let userProfile = UserProfile(uid: user.uid, firstName: firstName, lastName: lastName, city: city)
        self.profileRepository.createProfile(profile: userProfile) { (profile, error) in
          if let error = error {
            print("Error while fetching the user profile: \(error)")
            completion(nil, error)
            return
          }
          self.profile = profile
          completion(profile, nil)
        }
      }
    }
    
//    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
//        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
//    }
    func signIn(email: String, password: String, completion: @escaping (_ profile: UserProfile?, _ error: Error?) -> Void) {
      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print("Error signing in: \(error)")
          completion(nil, error)
          return
        }

        guard let user = result?.user else { return }
        print("User \(user.uid) signed in.")

        self.profileRepository.fetchProfile(userId: user.uid) { (profile, error) in
          if let error = error {
            print("Error while fetching the user profile: \(error)")
            completion(nil, error)
            return
          }

          self.profile = profile
          completion(profile, nil)
        }
      }
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
            self.profile = nil
        } catch {
            print("Error signing out")
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}

struct User {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String,displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
