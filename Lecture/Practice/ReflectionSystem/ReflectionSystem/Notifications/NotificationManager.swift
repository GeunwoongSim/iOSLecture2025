
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
            if granted {
                print("알림 권한 허용됨")
            } else {
                print("알림 권한 거부됨")
            }
        })
    }
    func scheduleDailyReflectionReminder() {
        let content = UNMutableNotificationContent()
        content.title = "오늘의 회고를 작성하세요!"
        content.body = "하루를 돌아보고 간단히 기록해보세요"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 20 // 저녁 8시
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "dailyReflectionReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if let error = error {
                print("알림 예약 실패: \(error) ")
            }else {
                print("알림 예약 성공")
            }
        })
    }
}
