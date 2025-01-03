﻿Процедура РасчитатьНачисления(НаборЗаписейРегистра, ТребуемыйВидРасчета, СписокСотрудников) Экспорт

  Регистратор=НаборЗаписейРегистра.Отбор.Регистратор.Значение;

  //Рассчитать первичные записи

  Если ТребуемыйВидРасчета=ПланыВИдовРасчета.ВидыНачислений.Оклад Тогда

  Запрос=Новый Запрос;
  Запрос.Текст=
  "ВЫБРАТЬ
  |НачисленияДанныеГрафика.ЗначениеПериодДействия КАК Норма,
  | НачисленияДанныеГрафика.ЗначениеФактическийПериодДействия КАК Факт,
  | НачисленияДанныеГрафика.НомерСтроки КАК НомерСтроки
  |ИЗ
  |РегистрРасчета.Начисления.ДанныеГрафика(Регистратор=&Регистратор И
  |ВидРасчета=&ВидРасчета И Сотрудник В (&СписокСотрудников))
  | КАК НачисленияДанныеГрафика";

  Запрос.УстановитьПараметр("Регистратор",Регистратор);
  Запрос.УстановитьПараметр("ВидРасчета",ТребуемыйВидРасчета);
  Запрос.УстановитьПараметр("СписокСотрудников",СписокСотрудников);

  ВыборкаРезультата=Запрос.Выполнить().Выбрать();
  
  Для Каждого ЗаписьРегистра Из НаборЗаписейРегистра Цикл
  СтруктураНомер=Новый Структура("НомерСтроки");
  СтруктураНомер.НомерСтроки=ЗаписьРегистра.НомерСтроки;
  ВыборкаРезультата.Сбросить();
  Если ВыборкаРезультата.НайтиСледующий(СтруктураНомер) Тогда
  Если ВыборкаРезультата.Норма=0 Тогда
  Сообщить("Вид расчета: Оклад – Нет рабочих дней в заданном периоде",);
  ЗаписьРегистра.Результат=0;
  Иначе
  //Рассчитать оклад по фактическому периоду и исходным данным
  ЗаписьРегистра.Результат=   (ЗаписьРегистра.ИсходныеДанные/ВыборкаРезультата.Норма)*ВыборкаРезультата.Факт;
  Сообщить("Выполнен расчет"+ЗаписьРегистра.Регистратор+"-"+ЗаписьРегистра.ВидРасчета+"-"+ЗаписьРегистра.Сотрудник);
  КонецЕсли;
  КонецЕсли;
  КонецЦикла;

  //Рассчитать вторичные записи

  ИначеЕсли ТребуемыйВидРасчета=ПланыВидовРасчета.ВидыНачислений.Премия Тогда
  Запрос=Новый Запрос;
  Запрос.Текст=
  "ВЫБРАТЬ
  |НачисленияБазаНачисления.РезультатБаза КАК База,
  | НачисленияБазаНачисления.НомерСтроки КАК НомерСтроки
  |ИЗ
  |РегистрРасчета.Начисления.БазаНачисления(&ИзмеренияОсновного, &ИзмеренияБазового, ,Регистратор=&Регистратор И ВидРасчета=&ВидРасчета И Сотрудник В (&СписокСотрудников))
  | КАК НачисленияБазаНачисления";
  
  Измер=Новый Массив(1);
  Измер[0]="Сотрудник";
  Запрос.УстановитьПараметр("ИзмеренияОсновного",Измер);
  Запрос.УстановитьПараметр("ИзмеренияБазового",Измер);
  Запрос.УстановитьПараметр("Регистратор",Регистратор);
  Запрос.УстановитьПараметр("ВидРасчета",ТребуемыйВидРасчета);
  Запрос.УстановитьПараметр("СписокСотрудников",СписокСотрудников);

  ВыборкаРезультата=Запрос.Выполнить().Выбрать();

  Для Каждого ЗаписьРегистра Из НаборЗаписейРегистра Цикл
  СтруктураНомер=Новый Структура("НомерСтроки");
  СтруктураНомер.НомерСтроки=ЗаписьРегистра.НомерСтроки;
  ВыборкаРезультата.Сбросить();
  Если ВыборкаРезультата.НайтиСледующий(СтруктураНомер) Тогда
  ЗаписьРегистра.Результат=ВыборкаРезультата.База*(10/100);
  Сообщить("Выполнен расчет"+ЗаписьРегистра.Регистратор+"-"+ЗаписьРегистра.ВидРасчета+"-"+ЗаписьРегистра.Сотрудник,);
  КонецЕсли;
  КонецЦикла;
  КонецЕсли;

КонецПроцедуры
