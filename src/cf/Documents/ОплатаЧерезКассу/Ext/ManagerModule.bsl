﻿Процедура ПечатьЧека(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(ПечатьЧека)
	Макет = Документы.ОплатаЧерезКассу.ПолучитьМакет("ПечатьЧека");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ОплатаЧерезКассу.Дата,
	|	ОплатаЧерезКассу.Клиент,
	|	ОплатаЧерезКассу.Номер,
	|	ОплатаЧерезКассу.Продавец,
	|	ОплатаЧерезКассу.ТорговаяТочка,
	|	ОплатаЧерезКассу.Покупка.(
	|		НомерСтроки,
	|		Номенклатура,
	|		Количество,
	|		Цена,
	|		Себестоимость,
	|		Сумма
	|	)
	|ИЗ
	|	Документ.ОплатаЧерезКассу КАК ОплатаЧерезКассу
	|ГДЕ
	|	ОплатаЧерезКассу.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьПокупкаШапка = Макет.ПолучитьОбласть("ПокупкаШапка");
	ОбластьПокупка = Макет.ПолучитьОбласть("Покупка"); 
	ОбластьИтог=Макет.ПолучитьОбласть("Итого");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьПокупкаШапка);
		ВыборкаПокупка = Выборка.Покупка.Выбрать();
		СуммаИтог=0;
		Пока ВыборкаПокупка.Следующий() Цикл
			ОбластьПокупка.Параметры.Заполнить(ВыборкаПокупка);
			ТабДок.Вывести(ОбластьПокупка, ВыборкаПокупка.Уровень());    
			СуммаИтог=СуммаИтог+ВыборкаПокупка.Сумма;
		КонецЦикла;
        ОбластьИтог.Параметры.ИтогоПоДокументу=СуммаИтог;
		ТабДок.Вывести(ОбластьИтог);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры

                       


