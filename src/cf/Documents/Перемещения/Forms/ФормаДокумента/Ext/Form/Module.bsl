﻿
&НаКлиенте
Процедура ПеремещениеКоличествоПриИзменении(Элемент)
    СтрокаТабличнойЧасти=Элементы.Перемещение.ТекущиеДанные;       
	// РассчитатьСумму - процедура из общего модуля РаботаСДокументами 
    РаботаСДокументамиКлиент.РассчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры       


&НаКлиенте
Процедура ПеремещениеЦенаПриИзменении(Элемент)
    СтрокаТабличнойЧасти=Элементы.Перемещение.ТекущиеДанные;
    РаботаСДокументамиКлиент.РассчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры

&НаКлиенте
Процедура ПеремещениеПродукцияПриИзменении(Элемент)
	СтрокаТабличнойЧасти=Элементы.Перемещение.ТекущиеДанные;
	СтрокаТабличнойЧасти.Цена=РаботаСоСправочникамиСервер.РозничнаяЦена(Объект.Дата,СтрокаТабличнойЧасти.Номенклатура);
	РаботаСДокументамиКлиент.РассчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры
