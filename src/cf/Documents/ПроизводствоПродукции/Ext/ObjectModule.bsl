﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	
	// регистр СебестоимостьПродукции Приход
	Движения.СебестоимостьПродукции.Записывать = Истина;
	Для Каждого ТекСтрокаПроизводство Из Производство Цикл
		Движение = Движения.СебестоимостьПродукции.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Продукция = ТекСтрокаПроизводство.Продукция;
		Движение.Стоимость = ТекСтрокаПроизводство.Сумма;
	КонецЦикла;

	
	// регистр ОстаткиПродукции Приход
	Движения.ОстаткиПродукции.Записывать = Истина;
	Для Каждого ТекСтрокаПроизводство Из Производство Цикл
		Движение = Движения.ОстаткиПродукции.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Продукт = ТекСтрокаПроизводство.Продукция;
		Движение.ТорговаяТочка = МестоПроизводства;
		Движение.НаборСвойств = ТекСтрокаПроизводство.НаборСвойств;
		Движение.Количество = ТекСтрокаПроизводство.Количество;
	КонецЦикла;

КонецПроцедуры
