//
//  jsonData.swift
//  iOS-Course-App
//
//  Created by grade on 25.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation

let jsonProject = """
    {
        "name": "Eventy App",
        "courseYear": CourseYears().past[0],
        "description": "Мобилно приложение за стриймване на събитие. Потребителите могат да качват интересни моменти от реално събитие (парти, тимбилдинг, концерт) във общо виртуално прострастраноство. Виртуалното пространство е достъпно за всичките членове на събитието.",
        "videoUrl": "",
        "image": "2017-eventy",
        "gitRepository": "https://github.com/SwiftFMI/2017_prj_eventy"
}
""".data(using: .utf8)

    let pr = [Project(name: "Arrow App",
            courseYear: CourseYears().past[0],
            description: "Показва се горска сцена с мишена в близък план. Камерата се отдръпва назад и разкрива елфка. Тя опъва тетива и застава в готовност. До нея са появява анимиран meter bar. При click на старт бутон или на бар-а, метър барът спира на текущата си позиция. Елфката изстрелва стрела и уцелва мишената в определен сектор, на който има user точки (score). Спечелените точки се натрупват в ранг листа.",
            videoUrl: "",
            image: "default-project-image",
            gitRepository: "https://github.com/SwiftFMI"),
    Project(name: "Shushu-mushu App",
            courseYear: CourseYears().past[0],
            description: "Чат услуга за мобилни телефони. Потребителите могат да контактуват един с друг, ако се намират близо един до друг, дори и да нямат връзка с интернет.",
            videoUrl: "",
            image: "2017-shushu-mushu",
            gitRepository: "https://github.com/SwiftFMI/2017_prj_shushu_mushu_2"),
    Project(name: "100 Places App",
            courseYear: CourseYears().past[0],
            description: "Приложение, което показва местата, на които си бил.",
            videoUrl: "",
            image: "default-project-image",
            gitRepository: "https://github.com/SwiftFMI/2017_prj_100_place10s"),
    Project(name: "Mama Weather App",
            courseYear: CourseYears().past[0],
            description: "Mama Weather",
            videoUrl: "",
            image: "default-project-image",
            gitRepository: "https://github.com/SwiftFMI/2017_prj_mama_weather"),
    Project(name: "Shared ride",
            courseYear: CourseYears().past[0],
            description: "Приложение за споделено пътуване",
            videoUrl: "",
            image: "default-project-image",
            gitRepository: "https://github.com/SwiftFMI/2017_prj_shared_ride"),
    Project(name: "Get Local",
            courseYear: CourseYears().past[0],
            description: "Приложение, което ще помага на хората да намират обекти и услуги. Ще има обекти като нощни барове, дискотеки както и аптеки, магазинчета, супермаркети, заведения за хранене, ключари и т.н.",
            videoUrl: "",
            image: "default-project-image",
            gitRepository: "https://github.com/SwiftFMI/2017_prj_get_local")
]

