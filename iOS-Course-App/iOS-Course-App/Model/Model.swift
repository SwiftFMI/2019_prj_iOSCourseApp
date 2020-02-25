import Foundation

struct Model: Codable {
    let pastCourses: [Course]
    let presentCourses: [Course]
    let futureCourses: [Course]
}