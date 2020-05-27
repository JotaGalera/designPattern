# Observer pattern

### What is? :

Observer pattern is very useful when you need to notificate some entity. 
For example, in order to manage the notifications in an app you can implement: 
    · ___Subject___: it has a list of his observers. 
    · ___Observer___: an interface with "Update" method. This method will be implemented by observers.
    · ___ObserversImplementation___: the different observers will be notified with the changes and they will act in function of the change notified. 

### Example :

~~~~
import UIKit

class Notification {
    private var message: String?
    private lazy var observer = [NotificationObserver]()
    
    func setMessage(message: String){
        self.message = message
    }
    
    func getMessage() -> String?{
        guard let message = self.message else {
            return nil
        }
        return message
    }
    
    func addObserver(observer: NotificationObserver){
        self.observer.append(observer)
    }

    func reportToObserver(){
        observer.forEach({ $0.update(notification: self) })
    }
}

protocol NotificationObserver {
    func update(notification: Notification)
}

class AlertNotificationObserver: NotificationObserver{
    func update(notification: Notification) {
        if  UIApplication.shared.applicationState == .background {
            NotificationCenter.instance.addPendingNotification(notification: notification)
        }
    }
    
    
}

class ShowNotificationObserver: NotificationObserver{
    func update(notification: Notification) {
        if  UIApplication.shared.applicationState != .background {
            print("Display the message: \(notification.getMessage())")
        }
    }
}

class NotificationCenter {
    static let instance = NotificationCenter()
    private var queueNotification: [Notification]
    
    private init(){
        queueNotification = [Notification]()
    }
    
    func addPendingNotification(notification: Notification){
        print("Pending notification: \(notification.getMessage())")
        queueNotification.append(notification)
    }
    
    func getAllPendingNotification() -> [Notification] {
        return queueNotification
    }
}
    
class main{
    var notifications: Notification
    
    init(){
        notifications = Notification()
        notifications.addObserver(observer: AlertNotificationObserver())
        notifications.addObserver(observer: ShowNotificationObserver())
    }
    
    func incomingNotification(message: String){
        notifications.setMessage(message: message)
        notifications.reportToObserver()
    }
    
}

main().incomingNotification(message: "This is an example")
//OUTPUT
Display the message: Optional("This is an example")
~~~~
