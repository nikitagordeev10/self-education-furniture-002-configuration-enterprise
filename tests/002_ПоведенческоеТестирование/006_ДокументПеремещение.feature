﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 
    Я создаю перемещение отправитель = "Ферма 1", получатель = "Производство 1", продукт = "Молоко сырое", количество = "100,000", сценарий = 'Позитивный'

    # Производство → Торговая Точка

    # Ферма → Производство