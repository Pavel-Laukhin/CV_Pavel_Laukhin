import UIKit

/*:
 There is at least a need to declare some protocols to avoid compilation errors.

 You can skip this part and go straight to the cover letter and CV. :]
*/
protocol AnalyticalMind {}
protocol StrongInterpersonalSkills {}
protocol CreativeMind {}
protocol HighPerformer {}
protocol AllMentionedTraits: AnalyticalMind, StrongInterpersonalSkills, CreativeMind, HighPerformer {}
protocol IOSDevelopmentSkills {}

class MyPersonalityAndSkills: AllMentionedTraits & IOSDevelopmentSkills {}
class Perfectionist {}

typealias University = String
typealias Specialisation = String
typealias WorkIsDone = String
typealias NextStep = String
typealias WorkResult = Result<WorkIsDone, Report>

enum Report: Error {
    case needToDiscuss
    case reportIssue
}

let companyName = ""
var vacancy: String?
let body = { () throws -> String in return ""}
let interviewResult = Result<String, Error>(catching: body)
/*:
 ## Cover Letter
*/
// TODO: Here I would like to put a photo of myself smiling so that people are willing to work with me :]

print(
    """
    Good day, dear members of the \(companyName)!"
    I am writing to you to submit my application for the vacant position
    of \(vacancy ?? "iOS Developer").
    """
)

// TODO: Write about why I think I'd be a good fit for this company.
// TODO: Write about the advantages of the company that I learned by studying information about it.
print(
    """
    I'd really like to work in your company because...

    In general, I will work my fingers to the bone for the sake of the company
    I'm going to work for, that's how I'm set up. But I'd rather do it for the sake
    of a company that...
    """
)
/*:
 ## CV
*/
class IOSDeveloper: Perfectionist, HighPerformer, StrongInterpersonalSkills, AnalyticalMind, CreativeMind {
    
    let name = "Pavel Laukhin"
    let nationality = "Russian"
    var education: [University: Specialisation]  = [
        "Moscow State Technical University. N.E. Bauman (MSTU)": "Design of laser and optical equipment",
        "Academic International Institute": "Information Management"
    ]
    var professionalSkills = [
        "3+ years of professional experience in iOS application development",
        "Proficiency in developing with Xcode using Swift and UIKit",
        "Excellent coding skills and understanding of the full mobile development lifecycle",
        "Ability to troubleshoot and debug issues efficiently",
        "Familiarity with RESTful concepts",
        "Knowledge of MVC, MVVM and VIPER design patterns",
        "Knowledge of Unit Testing, UI Testing, and Integration Testing",
        "Experience with Storyboard, XIB, and programmatic constraints"
    ]
    var goals = [
        "Long-term work in a team of professionals",
        "The development of skills in writing elegant clean code",
        "The career of a top programmer"
    ]
    let telegram = "@okpavel"
    let linkedIn = "okpavel"
            
    func doMyBest(
        with task: String,
        before date: Date,
        using personality: MyPersonalityAndSkills,
        completion: @escaping (WorkResult) -> NextStep
    ) {
        guard date >= Date() else {
            completion(.failure(.reportIssue))
            return
        }
        let result: WorkResult = {
            // do work here...
            let isDone = Bool.random()
            guard isDone else { return .failure(.needToDiscuss) }
            return .success("Work is done")
        }()
        completion(result)
    }
    
}

enum Skills: String, IOSDevelopmentSkills {
    case iOSDevExperience = "More than 3 years"
    case professionalTraining = """
        OEC Netology-group: 1) Swift Basics. 2) Introduction to iOS Development.
        3) Git is a version control system. 4) User interface. 5) Multithreading.
        Podlodka iOS Crew: 1) Week of UI. 2) Week of Multithreading.
        """
    case iOSSDK = """
        Swift, UIKit, Auto Layout (+ without storyboard), Core Animation,
        Multithreading (GCD, Operation, etc.), Networking(URLSession, etc.),
        CoreLocation, Cocoa Pods & SPM, Generics, Protocols & Dispatch Methods,
        MVC, VIPER, DRY, KISS, SOLID
        """
    case distributedVersionControlSystems = "Git, BitBucket, GitLab, GitHub. (+ Git Flow)"
    case languages = "Russian, Spoken English & Professional English"
    case others = "Experience of working as a Scrum master with the Agile approach"
}

switch interviewResult {
case .failure(let error):
    print(
        """
        Well, it's a pity that I didn't fit your vacant position
        \(vacancy ?? "iOS Developer") because of \(error). Anyway, it was nice
        to meet you. Whatever happens, I wish you success and prosperity.
        The world is a small place, so maybe we will meet again and next time
        you will choose me.
        Best applicants, goodness and more satisfied customers to you.
        Good luck to you!

        Sincerely,
        Pavel Laukhin.
        """
    )
case .success(_):
    print(
        """
        Great! Here is my phone number and telegram: +7(903)688-68-34, @okpavel.
        You can contact me at any time (I am always available during focused
        business if you call back again within 5 minutes).
        I'm looking forward to your call!
        """
    )
}
/*:
 ### Code verification
*/
let allTheStuff = MyPersonalityAndSkills()
let me = IOSDeveloper()

me.doMyBest(
    with: "Task",
    before: Date(timeInterval: 9999, since: Date()),
    using: allTheStuff,
    completion: { (result) -> NextStep in
        switch result {
        case .failure(let error):
            print(result, error.localizedDescription)
            return error.localizedDescription
        case .success(let goodJob):
            print(result, goodJob)
            return goodJob
        }
    }
)
