﻿Функция ДобавитьМеханизмы(СписокМеханизмов) Экспорт

	А1Э_Механизмы.Добавить(СписокМеханизмов,"А1Бух_УниверсальныйРегистратор");
	А1Э_Механизмы.Добавить(СписокМеханизмов,"А1Бух_УниверсальныйРегистраторОперацияБух");
	А1Э_Механизмы.Добавить(СписокМеханизмов,"А1Бух_НастройкиПоискаДублей");
	А1Э_Механизмы.Добавить(СписокМеханизмов,"А1Бух_Общее");

	А1Э_Механизмы.Добавить(СписокМеханизмов, "А1Бух_ОтчетПроизводстваЗаСмену");
	А1Э_Механизмы.Добавить(СписокМеханизмов, "А1Бух_СчетНаОплатуПокупателю");
КонецФункции

Функция ДобавитьОбъекты(СписокОбъектов) Экспорт
	А1Э_Механизмы.Подключить(СписокОбъектов, "Документ.ОперацияБух", "А1Бух_УниверсальныйРегистраторОперацияБух");
	А1Э_Механизмы.Подключить(СписокОбъектов, "Документ.ОперацияБух", "А1Э_ПроверкаУникальностиРеквизитов", "А1Бух_Основание");
	
	А1Э_Механизмы.Подключить(СписокОбъектов, "Документ.ОтчетПроизводстваЗаСмену", "А1Бух_ОтчетПроизводстваЗаСмену");
	А1Э_Механизмы.Подключить(СписокОбъектов, "Документ.СчетНаОплатуПокупателю", "А1Бух_СчетНаОплатуПокупателю");

	А1Э_Механизмы.Подключить(СписокОбъектов, А1Э_Механизмы.Адресация__БезОбъектов(), "А1Бух_НастройкиПоискаДублей");
	А1Э_Механизмы.Подключить(СписокОбъектов, А1Э_Механизмы.Адресация__БезОбъектов(), "А1Бух_Общее");
	
КонецФункции
