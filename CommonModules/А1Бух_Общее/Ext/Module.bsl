﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("А1Э_ПриПолученииКоманднойПанелиФормы", Истина);
	Настройки.Обработчики.Вставить("А1Емэйл_ПриОпределенииПолучателей", Истина);
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция А1Емэйл_ПриОпределенииПолучателей(МассивСсылок, Получатели) Экспорт 
		СоответствиеТипов = А1Э_Массивы.РазбитьПоТипам(МассивСсылок);
		Для Каждого Пара Из СоответствиеТипов Цикл
			Если Пара.Ключ = Тип("СправочникСсылка.Контрагенты") Тогда
				Контрагенты = Пара.Значение;
			КонецЕсли;
		КонецЦикла;
		Запрос = Новый Запрос;
		Запрос.Текст = 
		"ВЫБРАТЬ
		|	ТЧКонтактнаяИнформация.АдресЭП КАК АдресЭП
		|ИЗ
		|	Справочник.КонтактныеЛица.КонтактнаяИнформация КАК ТЧКонтактнаяИнформация
		|ГДЕ
		|	ТЧКонтактнаяИнформация.Ссылка.ОбъектВладелец В(&Контрагенты)
		|	И ТЧКонтактнаяИнформация.Тип = ЗНАЧЕНИЕ(Перечисление.ТипыКонтактнойИнформации.АдресЭлектроннойПочты)";
		Запрос.УстановитьПараметр("Контрагенты", Контрагенты);
		Выборка = Запрос.Выполнить().Выбрать();
		Пока Выборка.Следующий() Цикл
			Получатели.Добавить(Выборка.АдресЭП);
		КонецЦикла;
	КонецФункции
	
#КонецЕсли
 
Функция А1Э_ПриПолученииКоманднойПанелиФормы(Форма, КоманднаяПанель) Экспорт 
	Если Форма.ПоложениеКоманднойПанели = ПоложениеКоманднойПанелиФормы.Нет И
		Форма.Элементы.Найти("ГруппаКоманднаяПанель") <> Неопределено Тогда
		//В некоторых формах списков (Поступления, Реализации) командная панель сделана как отдельная группа
		КоманднаяПанель = Форма.Элементы.ГруппаКоманднаяПанель;
	КонецЕсли;
КонецФункции

