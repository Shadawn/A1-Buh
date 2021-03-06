﻿Функция НастройкиМеханизма() Экспорт
	Настройки = А1Э_Механизмы.НовыйНастройкиМеханизма();
	
	Настройки.Обработчики.Вставить("А1Э_ПриПолученииКоманднойПанелиФормы", Истина);
	Настройки.Обработчики.Вставить("А1Емэйл_ПриОпределенииПолучателей", Истина);
	
	Возврат Настройки;
КонецФункции

#Если НЕ Клиент Тогда
	
	Функция А1Емэйл_ПриОпределенииПолучателей(МассивСсылок, Получатели) Экспорт 
		//Здесь осуществляется добавление контактных лиц контрагентов. 
		//Добавление своей контактной информации выполнено универсально через А1БСП.
		КоллекцияСсылок = А1Э_Массивы.РазбитьПоТипам(МассивСсылок); 
		Контрагенты = КоллекцияСсылок[Тип("СправочникСсылка.Контрагенты")];
		Если Контрагенты = Неопределено Тогда Возврат Неопределено; КонецЕсли;
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
		"ВЫБРАТЬ
		|	ТЧКонтактнаяИнформация.Ссылка.Фамилия + "" "" + ТЧКонтактнаяИнформация.Ссылка.Имя + "" "" + ТЧКонтактнаяИнформация.Ссылка.Отчество КАК ПредставлениеАдреса,
		|	ТЧКонтактнаяИнформация.АдресЭП КАК АдресЭП
		|ИЗ
		|	Справочник.КонтактныеЛица.КонтактнаяИнформация КАК ТЧКонтактнаяИнформация
		|ГДЕ
		|	ТЧКонтактнаяИнформация.Ссылка.ОбъектВладелец В(&Контрагенты)
		|	И ТЧКонтактнаяИнформация.Тип = ЗНАЧЕНИЕ(Перечисление.ТипыКонтактнойИнформации.АдресЭлектроннойПочты)";
		Запрос.УстановитьПараметр("Контрагенты", Контрагенты);
		Выборка = Запрос.Выполнить().Выбрать();
		Пока Выборка.Следующий() Цикл
			Получатели.Добавить(Выборка.АдресЭП, Выборка.ПредставлениеАдреса);
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

