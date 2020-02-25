//
//  jsonData.swift
//  iOS-Course-App
//
//  Created by Demetra Staykova on 25.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation

let json = """
{
        "pastCourses": [
                {
                        "year": "iOS_2017_2018", 
                        "gitRepository": "iOS_2017_2018", 
                        "projects": [ 
                        {
                                "name": "Eventy App",
                                "courseYear": "iOS_2017_2018",
                                "description": "Мобилно приложение за стриймване на събитие. Потребителите могат да качват интересни моменти от реално събитие (парти, тимбилдинг, концерт) във общо виртуално прострастраноство. Виртуалното пространство е достъпно за всичките членове на събитието.",
                                "videoUrl": "",
                                "image": "2017-eventy",
                                "gitRepository": "2017_prj_eventy"
                        },
                        {
                                "name": "Arrow App",
                                "courseYear": "iOS_2017_2018",
                                "description": "Показва се горска сцена с мишена в близък план. Камерата се отдръпва назад и разкрива елфка. Тя опъва тетива и застава в готовност. До нея са появява анимиран meter bar. При click на старт бутон или на бар-а, метър барът спира на текущата си позиция. Елфката изстрелва стрела и уцелва мишената в определен сектор, на който има user точки (score). Спечелените точки се натрупват в ранг листа.",
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": ""
                        },
                        {
                                "name": "Shushu-mushu App",
                                "courseYear": "iOS_2017_2018",
                                "description": "Чат услуга за мобилни телефони. Потребителите могат да контактуват един с друг, ако се намират близо един до друг, дори и да нямат връзка с интернет.",
                                "videoUrl": "",
                                "image": "2017-shushu-mushu",
                                "gitRepository": "2017_prj_shushu_mushu_2"
                        },
                        {
                                "name": "100 Places App",
                                "courseYear": "iOS_2017_2018",
                                "description": "Приложение, което показва местата, на които си бил.",
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": "2017_prj_100_places"
                        }, 
                        {
                                "name": "Mama Weather App",
                                "courseYear": "iOS_2017_2018",
                                "description": "Mama Weather",
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": "2017_prj_mama_weather"        
                        },
                        {
                                "name": "Shared ride",
                                "courseYear": "iOS_2017_2018",
                                "description": "Приложение за споделено пътуване",
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": "2017_prj_shared_ride"
                        },
                        {
                                "name": "Get Local",
                                "courseYear": "iOS_2017_2018",
                                "description": "Приложение, което ще помага на хората да намират обекти и услуги. Ще има обекти като нощни барове, дискотеки както и аптеки, магазинчета, супермаркети, заведения за хранене, ключари и т.н.",
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": "2017_prj_get_local"
                        }]
                },
                {
                        "year": "iOS_2018_2019", 
                        "gitRepository": "iOS_2018_2019", 
                        "projects": [                
                        {
                                "name": "E-Shop App",
                                "courseYear": "iOS_2018_2019",
                                "description": "Мобилно приложение/шаблон (template) за специализиран електронен магазин." ,
                                "videoUrl": "",
                                "image": "2018-eshop",
                                "gitRepository": "2018_prj_eshop"
                        },
                        {
                                "name": "Active Citizen App",
                                "courseYear": "iOS_2018_2019",
                                "description": "Всеки ден ставаме свидетели на разнообразни нередности около местата, където живеем, работим, учим или си почиваме. Повечето хора подминават такива недоразумения, мислейки, че са безсилни или че не могат да получат подкрепа, за да разрешаване на проблема. ActiveCitizen не е приложение за представителите на гореспоменатата част от обществото ни. ActiveCitizen е платформа за споделяне и дискусия на “бъговете” в населеното ни място. Тя спомага разрешаването им, като позволява информацията за проблемите да достигне до най-засегнатите от тях. Публикация в приложението представлява снимка или видео, съпроводено от кратко описание и местоположение на картата. За публикациите може да се гласува единствено от потребители на приложението. Също така потребителите на ActiveCitizen могат да се абонират за дадена нередност и в следствие на това да получават известия при всяка актуализация от страна на създателя ѝ." ,
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": "2018_prj_activecitizen"
                        },
                        {
                                "name": "Recipes App",
                                "courseYear": "iOS_2018_2019",
                                "description": "Мобилно приложение, което улеснява всекидневния избор на рецепти за готвене и позволява по лесен, бърз и забавен начин да се търсят нови рецепти. С приложенито може да се създават авторски рецепти като последователност от стъпки, описани с текст, снимки и видео.",
                                "videoUrl": "",
                                "image": "2018-recipes",
                                "gitRepository": "2018_prj_recipe"
                        },
                        {
                                "name": "FMI App",
                                "courseYear": "iOS_2018_2019",
                                "description": "Приложение, което ще предоставя достъп до курсовете и техните лекции, водени във ФМИ. Студентите ще имат достъп до лекциите и другите материали, свързани с курсовете.",
                                "videoUrl": "",
                                "image": "2018-fmi-courses",
                                "gitRepository": "2018_prj_fmi"
                        },
                        {
                                "name": "Nightclub App",
                                "courseYear": "iOS_2018_2019",
                                "description": "Мобилно приложение/шаблон (template) за промотиране на нощен клуб.",
                                "videoUrl": "",
                                "image": "2018-nightclubs",
                                "gitRepository": "2018_prj_nightclub"
                        },
                        {
                                "name": "Shushu-mushu App",
                                "courseYear": "iOS_2018_2019",
                                "description": "Чат услуга за мобилни телефони. Потребителите могат да контактуват един с друг, ако се намират близо един до друг, дори и да нямат връзка с интернет.",
                                "videoUrl": "",
                                "image": "2018-shushu-mushu",
                                "gitRepository": "2018_prj_shushumushu"
                        }]
                }],
        "presentCourses": [
                {
                        "year": "iOS_2019_2020", 
                        "gitRepository": "iOS_2019_2020", 
                        "projects": [
                        {
                                "name": "Fitness App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Приложение за трениращи манияци, което показва календар на потребителя с неговите посещения в тренировъчната зала. Да бъдат обелязаниминали и бъдещи (само 7 дни напред)тренировки на базата на историята на потребителя.",
                                "videoUrl": "",
                                "image": "2019-fitness",
                                "gitRepository": "2019_prj_FitnessApp"
                        },
                        {
                                "name": "Coach Assistant App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Когато имат контролна среща (неофициален мач), помощник-треньорите по футбол обръщат специално внимание на някои компоненти от играта, които са упражнявали със своите футболисти. Например искат да знаят колко на брой добри паса е направил даден играч, колко гола е отбелязал, колко пъти е бил фаулиран и т.н. Те разполагат с една пластмасова дъска, предварително разчертана с елементите на футболното игрище.Понеже дъската не е безкрайна, трудно е да се запише всичко, понякога маркерът отказва да пише, а впоследствие е трудно дори да се разчете написаното, трябва да улесним помощник-треньорите.",
                                "videoUrl": "",
                                "image": "2019-coach-assistant",
                                "gitRepository": "2019_prj_CoachAssistantApp"
                        },
                        {
                                "name": "iOS Course App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Приложение, което ще позволява разглеждането на проектите от минали години разработени по време на iOS курса от студентите. Приложението да показва всички издания на курса (минали, настоящи и бъдеши). Да има възможност да се влиза на git repoto и да се разглеждат лекциите. Да може да се вижда списък на финалните проекти. Всеки проект да има описание, връзка към гит репото и клипче в началото. Това клипче да се зарежда от външем ресурс и да може да се гледа.",
                                "videoUrl": "",
                                "image": "2019-ios-course",   
                                "gitRepository": "2019_prj_iOSCourseApp"
                        },
                        {
                                "name": "News App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Приложение, което показва списък с новини. Всяка новина да има картинка. Приложението да може да работи без интернет. Ако има новни заредени в приложението да показва тях. При активиране на новина да може да се отвори реалния адрес на новината. Да се даде възможност за отбелязване на любими новини.",
                                "videoUrl": "",
                                "image": "2019-news",
                                "gitRepository": "2019_prj_NewsApp"
                        },
                        {
                                "name": "Meme App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Приложение за създаване и споделяне на мийм (meme) картинки с текст. Чрез приложението може да се избере от картинка в галерията на приложението или от тази на устройството и да се въведат горен и/или долен текст. Текстът се изрисува върху изображението и то може да се споделя чрез системното меню в други приложения или да бъде запазено в галерията. Запазване на мийм във firebase realtime database, за да се вижда и от други потребители.",
                                "videoUrl": "",
                                "image": "2019-meme",
                                "gitRepository": "/2019_prj_MemeApp"
                        },
                        {
                                "name": "The Movie DB Viewer App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Филмов каталог със собствена рейтинг система.",
                                "videoUrl": "",
                                "image": "2019-movie-db",
                                "gitRepository": "2019_prj_MovieDBApp"
                        },
                        {
                                "name": "Game Logger App",
                                "courseYear": "iOS_2019_2020",
                                "description": "Приложението е насочено към футболни треньори, а както и любители. Чрез приложението може да се заснеме футболен мач и да се отбелязват съответните голове, фалове и подобни по време на мача. Видеата и логовете от мача се изпращат към сървър и могат да бъдат гледани от различни устройства.",
                                "videoUrl": "",
                                "image": "default-project-image",
                                "gitRepository": "2019_prj_GameLoggerApp"
                        }]
                }],
        "futureCourses": [
                {
                        "year": "iOS_2020_2021", "gitRepository": "", 
                        "projects": []
                }]
}
""".data(using: .utf8)!
