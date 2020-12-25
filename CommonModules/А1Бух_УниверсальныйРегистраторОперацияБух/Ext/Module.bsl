﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("ПриУстановкеНовогоНомера", Истина);
	Настройки.Обработчики.Вставить("ФормаСпискаПриСозданииНаСервере", Истина);
	Настройки.Обработчики.Вставить("ФормаПриОткрытии", Истина);
	
	Возврат Настройки;
КонецФункции

Функция ПриУстановкеНовогоНомера(Объект, СтандартнаяОбработка, Префикс) Экспорт
	Если ЗначениеЗаполнено(Объект.А1Бух_Основание) Тогда
		Префикс = "А1УР--";
	КонецЕсли;
КонецФункции

Функция ФормаСпискаПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
	Отбор = Форма.Список.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	Отбор.Использование = Истина;
	Отбор.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("А1Бух_Основание");
	Отбор.ВидСравнения = ВидСравненияКомпоновкиДанных.НеЗаполнено;
КонецФункции 

#Если Клиент Тогда
	
	Функция ФормаПриОткрытии(Форма, Отказ) Экспорт
		Если А1Э_Формы.ТипФормы(Форма) <> "ФормаЭлемента" Тогда Возврат Неопределено; КонецЕсли;
		Если НЕ ЗначениеЗаполнено(Форма.Объект.А1Бух_Основание) Тогда Возврат Неопределено; КонецЕсли;
		
		Значение = А1Э_Метаданные.СсылкаПоИдентификатору(Форма.Объект.А1Бух_Основание);
		Форма.Закрыть();
		ПоказатьЗначение(, Значение);
	КонецФункции 
	
#КонецЕсли
 


