import UIKit

//: Сначала нужно объявить несколько протоколов и алиасов, чтобы избежать ошибок компиляции. Можно пропустить эту часть и сразу перейти к Сопроводительному письму и Резюме. :]
protocol AnalyticalMindProtocol {}
protocol StrongInterpersonalSkilsProtocol {}
protocol CreativeMindProtocol {}
protocol HighPerformerProtocol {}
protocol CompositionOfAllMentionedProtocols: AnalyticalMindProtocol, StrongInterpersonalSkilsProtocol, CreativeMindProtocol, HighPerformerProtocol {}
protocol IOSSkillsProtocol {}

class AllStuff: CompositionOfAllMentionedProtocols & IOSSkillsProtocol {}
class Perfectionist {}

typealias University = String
typealias Specialization = String
typealias WorkIsDone = String
typealias NextStep = String
typealias WorkResult = Result<WorkIsDone, Report>

enum Report: Error {
    case needHelp
    case reportIssue
}

let currentTimeOfDay = Date()
let companyName = ""
var vacancy: String?
let body = { () throws -> String in return ""}
let interviewResult = Result<String, Error>(catching: body)
/*:
 ## Сопроводительное письмо
 */
//TODO: тут вставить своё фото, где я улыбаюсь, чтобы со мной прям хотелось сотруничать :]

print("""
    Добрый \(currentTimeOfDay), уважаемые сотрудники \(companyName)!"
    Пишу вам с целью предложить свою кандидатуру на вакансию \(vacancy ?? "iOS Developer").
""")

//TODO: написать причины, почему я хочу работать в этой компании
//TODO: написать о достоинствах компании, которые я узнал, изучив информацию о ней из интернета
print("""
    Я очень хочу работать у вас потому что...

    В общем, я всё равно буду рвать себя на британский флаг ради той компании, на которую я буду работать, так уж я устроен. Но лучше уж я буду делать это ради компании, которая...
""")
/*:
 ## Резюме
 */
class IOSDeveloper: Perfectionist, AnalyticalMindProtocol, StrongInterpersonalSkilsProtocol,  CreativeMindProtocol, HighPerformerProtocol  {
    
    let name = "Pavel Laukhin"
    let yearOfBirth = 1986
    var location = "Moscow"
    var education: [University: Specialization]  = [
        "Moscow State Technical University. N.E. Bauman (MSTU)" : "Design of laser and optical equipment",
        "Academic International Institute" : "Information Management"]
    let phoneNumber = "+7(903)688-68-34"
    let telegram = "@mainpavel"
    let linkedIn = "mainpavel"
    var goals = [
        "Long-term work in a team of professionals",
        "The development of skills in writing elegant clean code",
        "The career of a top programmer"]
            
    func doMyBest(with task: String, before date: Date, using stack: IOSSkillsProtocol & CompositionOfAllMentionedProtocols, completion: @escaping (WorkResult) -> NextStep) {
        guard date >= Date() else {
            completion(.failure(.reportIssue))
            return
        }
        let result: WorkResult = {
            // do work here...
            let isDone = true
            guard isDone else { return .failure(.needHelp) }
            return .success("Work is done")
        }()
        completion(result)
    }
    
}

enum Skills: String, IOSSkillsProtocol {
    case iOSDevExperience = "About 1 year"
    case professionalTraining = "OEC Netology-group: 1) Swift Basics. 2) Introduction to iOS Development. 3) Git is a version control system. 4) User interface. 5) Multithreading. Podlodka iOS Crew: 1) Week of UI. 2) Week of Multithreading."
    case iOSSDK = "Swift, UIKit, Auto Layout (+ without storyboard), Core Animation, Multithreading (GCD, Operation, etc.), Networking(URLSession, etc.), CoreLocation, Cocoa Pods & Carthage (Kingfisher, Alamofire, SwiftSVG, SnapKit, etc.), Generics, Protocols & Dispatch Methods, MVC, DRY, KISS, SOLID"
    case distributedVersionControlSystems = "Git, GitHub (+ Git Flow approach)"
    case language = "Spoken English & Professional English"
    case others = "Experience of working as a Scrum master, understanding of the Agile approach"
}

switch interviewResult {
case .failure(let error):
    print("Что ж, очень жаль, что я не подошёл вам по причине \(error). Всё равно было приятно помечтать о работе в вашей компании. Не смотря ни на что, желаю вам успехов и процветания. Мир тесен, может в следующий раз получится. Хороших вам кандидатов, поменьше пробок на дорогах и побольше довольных клиентов! Всего доброго! С уважением, Павел Лаухин.")
case .success(_):
    print("Отлично! Вот мой номер телефона и телеграма: +7(903)688-68-34, @mainpavel. Вы можете связаться со мной в любое удобное время (я сразу же доступен во время учёбы или сосредоточенных дел, если перезвонить повторно в течение 5 минут). С нетерпением жду звонка!")
}
/*:
 ### Проверка работы кода
 */
let allStuff = AllStuff()
let pavel = IOSDeveloper()

pavel.doMyBest(with: "Задача", before: Date(timeInterval: 9999, since: Date()), using: allStuff) { (result) -> NextStep in
    print(result)
    switch result {
    case .failure(let error):
        return error.localizedDescription
    case .success(let goodJob):
        return goodJob
    }
}
