﻿&НаСервере
&После("ПриСозданииНаСервере")
Процедура А1Емэйл_ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//Интеграция с А1Емэйл.
	Если Параметры.Свойство("ТелоНТМЛ") Тогда
		А1Э_ФорматированныйДокумент.УстановитьНТМЛ(ЭтаФорма.ТелоПисьма, Параметры.ТелоНТМЛ);
	КонецЕсли;
КонецПроцедуры
