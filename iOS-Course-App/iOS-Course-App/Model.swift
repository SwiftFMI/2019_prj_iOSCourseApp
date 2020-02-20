struct CourseYears {
    let past = ["iOS_2017_2018", "iOS_2018_2019"]
    let present = "iOS_2019_2020"
    let future = "iOS_2020_2021"
}

struct Project {
    let name: String
    let courseYear: String
    let description: String
    let videoUrl: String
    let gitRepository: String
}

struct Course {
    let year: String
    let gitRepository: String
    let projects: [Project]
}

struct Model {
    var pastProjects: Array<Array<Project>> = []
    let pastCourses: Array<Course>
    let presentCourses: Array<Course>
    let futureCourses: Array<Course>
    let courses: Array<Course>

    let pastProjectsYearOne = [
        Project(name: "Eventy App",
                courseYear: CourseYears().past[0],
                description: "Мобилно приложение за стриймване на събитие. Потребителите могат да качват интересни моменти от реално събитие (парти, тимбилдинг, концерт) във общо виртуално прострастраноство. Виртуалното пространство е достъпно за всичките членове на събитието.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2017_prj_eventy"),
        Project(name: "Arrow App",
                courseYear: CourseYears().past[0],
                description: "Показва се горска сцена с мишена в близък план. Камерата се отдръпва назад и разкрива елфка. Тя опъва тетива и застава в готовност. До нея са появява анимиран meter bar. При click на старт бутон или на бар-а, метър барът спира на текущата си позиция. Елфката изстрелва стрела и уцелва мишената в определен сектор, на който има user точки (score). Спечелените точки се натрупват в ранг листа.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI"),
        Project(name: "Shushu-muschu App",
                courseYear: CourseYears().past[0],
                description: "Чат услуга за мобилни телефони. Потребителите могат да контактуват един с друг, ако се намират близо един до друг, дори и да нямат връзка с интернет.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2017_prj_shushu_mushu_2"),
        Project(name: "100 Places App",
                courseYear: CourseYears().past[0],
                description: "Приложение, което показва местата, на които си бил.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2017_prj_100_place10s"),
        Project(name: "Mama Weather App",
                courseYear: CourseYears().past[0],
                description: "Mama Weather",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2017_prj_mama_weather"),
    ]
    let pastProjectsYearTwo = [
        Project(name: "E-Shop App",
                courseYear: CourseYears().past[1],
                description: "Мобилно приложение/шаблон (template) за специализиран електронен магазин." ,
                videoUrl: "https://drive.google.com/file/d/1-JrsvTqqZAxGMrxKkDIID2cBY7y2w5JE/view",
                gitRepository: "https://github.com/SwiftFMI/2018_prj_eshop/"),
        Project(name: "Active Citizen App",
                courseYear: CourseYears().past[1],
                description: "Всеки ден ставаме свидетели на разнообразни нередности около местата, където живеем, работим, учим или си почиваме. Повечето хора подминават такива недоразумения, мислейки, че са безсилни или че не могат да получат подкрепа, за да разрешаване на проблема. ActiveCitizen не е приложение за представителите на гореспоменатата част от обществото ни. ActiveCitizen е платформа за споделяне и дискусия на “бъговете” в населеното ни място. Тя спомага разрешаването им, като позволява информацията за проблемите да достигне до най-засегнатите от тях. Публикация в приложението представлява снимка или видео, съпроводено от кратко описание и местоположение на картата. За публикациите може да се гласува единствено от потребители на приложението. Също така потребителите на ActiveCitizen могат да се абонират за дадена нередност и в следствие на това да получават известия при всяка актуализация от страна на създателя ѝ." ,
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2018_prj_activecitizen"),
        Project(name: "Recipes App",
                courseYear: CourseYears().past[1],
                description: "Мобилно приложение, което улеснява всекидневния избор на рецепти за готвене и позволява по лесен, бърз и забавен начин да се търсят нови рецепти. С приложенито може да се създават авторски рецепти като последователност от стъпки, описани с текст, снимки и видео.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2018_prj_recipe"),
        Project(name: "FMI App",
                courseYear: CourseYears().past[1],
                description: "Приложение, което ще предоставя достъп до курсовете и техните лекции, водени във ФМИ. Студентите ще имат достъп до лекциите и другите материали, свързани с курсовете.",
                videoUrl: "https://drive.google.com/file/d/1yPN2mG1SMWj0P2fPtz7xLDN3ZXlxXGlh/view",
                gitRepository: "https://github.com/SwiftFMI/2018_prj_fmi"),
        Project(name: "Nightclub App",
                courseYear: CourseYears().past[1],
                description: "Мобилно приложение/шаблон (template) за промотиране на нощен клуб.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2018_prj_nightclub"),
        Project(name: "Shushu-muschu App",
                courseYear: CourseYears().past[1],
                description: "Чат услуга за мобилни телефони. Потребителите могат да контактуват един с друг, ако се намират близо един до друг, дори и да нямат връзка с интернет.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2018_prj_shushumushu"),
    ]
    let presentProjects = [
        Project(name: "Fitness App",
                courseYear: CourseYears().present,
                description: "Приложение за трениращи манияци, което показва календар на потребителя с неговите посещения в тренировъчната зала. Да бъдат обелязаниминали и бъдещи (само 7 дни напред)тренировки на базата на историята на потребителя.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2019_prj_FitnessApp"),
        Project(name: "Coach Assistant App",
                courseYear: CourseYears().present,
                description: "Когато имат контролна среща (неофициален мач), помощник-треньорите по футбол обръщат специално внимание на някои компоненти от играта, които са упражнявали със своите футболисти. Например искат да знаят колко на брой добри паса е направил даден играч, колко гола е отбелязал, колко пъти е бил фаулиран и т.н. Те разполагат с една пластмасова дъска, предварително разчертана с елементите на футболното игрище.Понеже дъската не е безкрайна, трудно е да се запише всичко, понякога маркерът отказва да пише, а впоследствие е трудно дори да се разчете написаното, трябва да улесним помощник-треньорите.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2019_prj_CoachAssistantApp"),
        Project(name: "iOS Course App",
                courseYear: CourseYears().present,
                description: "Приложение, което ще позволява разглеждането на проектите от минали години разработени по време на iOS курса от студентите. Приложението да показва всички издания на курса (минали, настоящи и бъдеши). Да има възможност да се влиза на git repoto и да се разглеждат лекциите. Да може да се вижда списък на финалните проекти. Всеки проект да има описание, връзка към гит репото и клипче в началото. Това клипче да се зарежда от външем ресурс и да може да се гледа.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2019_prj_iOSCourseApp"),
        Project(name: "News App",
                courseYear: CourseYears().present,
                description: "Приложение, което показва списък с новини. Всяка новина да има картинка. Приложението да може да работи без интернет. Ако има новни заредени в приложението да показва тях. При активиране на новина да може да се отвори реалния адрес на новината. Да се даде възможност за отбелязване на любими новини.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2019_prj_NewsApp"),
        Project(name: "Meme App",
                courseYear: CourseYears().present,
                description: "Приложение за създаване и споделяне на мийм (meme) картинки с текст. Чрез приложението може да се избере от картинка в галерията на приложението или от тази на устройството и да се въведат горен и/или долен текст. Текстът се изрисува върху изображението и то може да се споделя чрез системното меню в други приложения или да бъде запазено в галерията. Запазване на мийм във firebase realtime database, за да се вижда и от други потребители.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI//2019_prj_MemeApp"),
        Project(name: "The Movie DB Viewer App",
                courseYear: CourseYears().present,
                description: "Филмов каталог със собствена рейтинг система.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2019_prj_MovieDBApp"),
        Project(name: "Game Logger App",
                courseYear: CourseYears().present,
                description: "Приложението е насочено към футболни треньори, а както и любители. Чрез приложението може да се заснеме футболен мач и да се отбелязват съответните голове, фалове и подобни по време на мача. Видеата и логовете от мача се изпращат към сървър и могат да бъдат гледани от различни устройства.",
                videoUrl: "",
                gitRepository: "https://github.com/SwiftFMI/2019_prj_GameLoggerApp")
    ]
    let futureProjects = Array<Project>()
    
    init() {
        pastProjects.append(pastProjectsYearOne)
        pastProjects.append(pastProjectsYearTwo)
        pastCourses = [
            Course(year: CourseYears().past[0], gitRepository: "https://github.com/SwiftFMI/iOS_2017_2018", projects: pastProjectsYearOne),
            Course(year: CourseYears().past[1], gitRepository: "https://github.com/SwiftFMI/iOS_2018_2019", projects: pastProjectsYearTwo)]
        presentCourses = [
            Course(year: CourseYears().present, gitRepository: "https://github.com/SwiftFMI/iOS_2019_2020", projects: presentProjects)]
        futureCourses = [
            Course(year: CourseYears().future, gitRepository:"https://github.com/SwiftFMI", projects: futureProjects)
        ]
        courses = pastCourses + presentCourses + futureCourses
    }
}
