#language: ru

@tree

Функционал: ПОВ_ОП_Д. Добавление объектов предприятия

Как Технолог я хочу
проверить, что объекты предприятия добавляются корректно 
чтобы не было ошибок в процессе эксплуатации системы

Контекст:
    Я запускаю сценарий открытия TestClient или подключаю уже существующий
	# И Я подключаю клиент тестирования "Технолог" из таблицы клиентов тестирования
	# И я закрываю все окна клиентского приложения

Сценарий: ПОВ_ОП_001. Проверка корректного добавления объекта предприятия
	Я создаю объект предприятия = "Производство N", адрес = "Сортавала, ул. Заводская, 3", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "Павлов Сергей Иванович", телефон = "+7 (8142) 321-654"
    # Позитивный

Сценарий: ПОВ_ОП_002. Проверка добавления объекта с длинным наименованием
    Я создаю объект предприятия = "Муниципальное образовательное учреждение дополнительного образования детей специализированная детско-юношеская спортивная школа олимпийского резерва по боксу", адрес = "Петрозаводск, ул. Лесная, 15", режим работы = "Понед. - Птн. 09:00-18:00", контактное лицо = "Иванов Иван Иванович", телефон = "+7 (8142) 654-321"
    # Позитивный

Сценарий: ПОВ_ОП_003. Проверка добавления объекта с невалидным номером телефона    
    Я создаю объект предприятия = "Производство B", адрес = "Сортавала, ул. Заводская, 7", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "Петров Петр Петрович", телефон = "12345"

Сценарий: ПОВ_ОП_004. Проверка добавления объекта без указания телефона        
    Я создаю объект предприятия = "Производство C", адрес = "Кондопога, ул. Центральная, 2", режим работы = "Ежедневно 08:00-20:00", контактное лицо = "Сидоров Сидор Сидорович"

Сценарий: ПОВ_ОП_005. Проверка добавления объекта с некорректным адресом
    Я создаю объект предприятия = "Производство D", адрес = "Некорректный адрес", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "Григорьев Григорий Григорьевич", телефон = "+7 (8142) 321-654"

Сценарий: ПОВ_ОП_006. Проверка добавления объекта с отсутствием режима работы
    Я создаю объект предприятия = "Производство E", адрес = "Петрозаводск, ул. Заводская, 5", контактное лицо = "Михайлова Мария Михайловна", телефон = "+7 (8142) 123-456"

Сценарий: ПОВ_ОП_007. Проверка добавления объекта с отсутствием контактного лица
    Я создаю объект предприятия = "Производство F", адрес = "Сортавала, ул. Заводская, 8", режим работы = "Ежедневно 10:00-22:00", телефон = "+7 (8142) 987-654"

Сценарий: ПОВ_ОП_008. Проверка добавления объекта с отсутствием наименования
    Я создаю объект предприятия = "", адрес = "Сортавала, ул. Заводская, 9", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "Александров Александр Александрович", телефон = "+7 (8142) 123-654"

Сценарий: ПОВ_ОП_009. Проверка добавления объекта с длинным наименованием
    Я создаю объект предприятия = "Производство с очень длинным названием, которое может вызвать ошибку в процессе ввода", адрес = "Петрозаводск, ул. Лесная, 10", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "Тимофеев Тимофей Тимофеевич", телефон = "+7 (8142) 654-321"

Сценарий: ПОВ_ОП_010. Проверка добавления объекта с пустым режимом работы
    Я создаю объект предприятия = "Производство G", адрес = "Петрозаводск, ул. Лесная, 11", контактное лицо = "Иванов Иван Иванович", телефон = "+7 (8142) 111-222"

Сценарий: ПОВ_ОП_011. Проверка добавления объекта с невалидными символами в контактном лице
    Я создаю объект предприятия = "Производство H", адрес = "Кондопога, ул. Центральная, 3", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "12345", телефон = "+7 (8142) 987-654"

Сценарий: ПОВ_ОП_012. Проверка добавления объекта с некорректным номером телефона (меньше 10 символов)
    Я создаю объект предприятия = "Производство I", адрес = "Сортавала, ул. Заводская, 10", режим работы = "Ежедневно 10:00-22:00", контактное лицо = "Иванов Иван Иванович", телефон = "+7 (8142) 321-65"

Сценарий: ПОВ_ОП_013. Проверка добавления объекта с незаполненными данными
    Я создаю объект предприятия = "", адрес = "", режим работы = "", контактное лицо = "", телефон = ""
