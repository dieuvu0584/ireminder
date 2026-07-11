// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Hoje';

  @override
  String get navCalendar => 'Calendário';

  @override
  String get navLoans => 'Empréstimos';

  @override
  String get navCategories => 'Categorias';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navAssistant => 'Assistente';

  @override
  String get onboardingTitle1 => 'Nunca mais esqueça o que importa';

  @override
  String get onboardingBody1 =>
      'Acompanhe manutenção de aparelhos, revisão do carro, aniversários e muito mais — tudo em um só lugar.';

  @override
  String get onboardingTitle2 => 'Repetição simples';

  @override
  String get onboardingBody2 =>
      'Diário, semanal, mensal, anual ou até pelo calendário lunar — configure uma vez e o iReminder cuida do resto.';

  @override
  String get onboardingTitle3 => '100% privado, 100% offline';

  @override
  String get onboardingBody3 =>
      'Sem conta, sem nuvem, sem login. Tudo fica no seu celular.';

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingNext => 'Avançar';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get notificationPermissionTitle => 'Fique em dia';

  @override
  String get notificationPermissionBody =>
      'O iReminder precisa de permissão para enviar notificações quando algo estiver vencendo.';

  @override
  String get notificationPermissionAllow => 'Permitir notificações';

  @override
  String get notificationPermissionLater => 'Agora não';

  @override
  String get homeSectionOverdue => 'Atrasados';

  @override
  String get homeSectionToday => 'Hoje';

  @override
  String get homeSectionThisWeek => 'Esta semana';

  @override
  String get homeSectionUpcoming => 'Em breve';

  @override
  String get homeEmptyTitle => 'Nada por aqui ainda';

  @override
  String get homeEmptyBody =>
      'Toque em + para adicionar seu primeiro lembrete ou empréstimo parcelado.';

  @override
  String get fabAddReminder => 'Lembrete';

  @override
  String get fabAddLoan => 'Empréstimo parcelado';

  @override
  String get actionDone => 'Concluído';

  @override
  String get actionSnooze => 'Adiar';

  @override
  String get actionEdit => 'Editar';

  @override
  String get actionDelete => 'Excluir';

  @override
  String get actionSave => 'Salvar';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionConfirm => 'Confirmar';

  @override
  String get actionYes => 'Sim';

  @override
  String get actionNo => 'Não';

  @override
  String get actionOk => 'OK';

  @override
  String get actionAdd => 'Adicionar';

  @override
  String get actionClose => 'Fechar';

  @override
  String get reminderFormTitleNew => 'Novo lembrete';

  @override
  String get reminderFormTitleEdit => 'Editar lembrete';

  @override
  String get reminderFieldTitle => 'Título';

  @override
  String get reminderFieldTitleRequired => 'O título é obrigatório';

  @override
  String get reminderFieldDescription => 'Descrição (opcional)';

  @override
  String get reminderFieldCategory => 'Categoria';

  @override
  String get reminderFieldRecurrence => 'Repetição';

  @override
  String get reminderFieldStartDate => 'Data de início';

  @override
  String get reminderFieldTime => 'Horário do lembrete';

  @override
  String get reminderFieldAdvanceNotice => 'Avisar N dias antes';

  @override
  String get reminderFieldRecurrenceDay => 'Dia do mês';

  @override
  String get reminderFieldRecurrenceMonth => 'Mês';

  @override
  String get reminderFieldRecurrenceWeekday => 'Dia da semana';

  @override
  String get reminderFieldIntervalDays => 'A cada N dias';

  @override
  String get reminderFieldLunarDay => 'Dia lunar';

  @override
  String get reminderFieldLunarMonth => 'Mês lunar';

  @override
  String get reminderDeleteConfirmTitle => 'Excluir este lembrete?';

  @override
  String get reminderDeleteConfirmBody => 'Essa ação não pode ser desfeita.';

  @override
  String get recurrenceNone => 'Uma vez';

  @override
  String get recurrenceDaily => 'Diariamente';

  @override
  String get recurrenceWeekly => 'Semanalmente';

  @override
  String get recurrenceMonthly => 'Mensalmente';

  @override
  String get recurrenceYearly => 'Anualmente';

  @override
  String get recurrenceCustomIntervalDays => 'A cada N dias';

  @override
  String get recurrenceLunarYearly => 'Anual (calendário lunar)';

  @override
  String get weekdayMonday => 'Segunda-feira';

  @override
  String get weekdayTuesday => 'Terça-feira';

  @override
  String get weekdayWednesday => 'Quarta-feira';

  @override
  String get weekdayThursday => 'Quinta-feira';

  @override
  String get weekdayFriday => 'Sexta-feira';

  @override
  String get weekdaySaturday => 'Sábado';

  @override
  String get weekdaySunday => 'Domingo';

  @override
  String get loanListTitle => 'Empréstimos e parcelamentos';

  @override
  String get loanFormTitleNew => 'Novo empréstimo parcelado';

  @override
  String get loanFormTitleEdit => 'Editar empréstimo';

  @override
  String get loanFieldName => 'Nome';

  @override
  String get loanFieldCategory => 'Categoria';

  @override
  String get loanFieldTotalAmount => 'Valor total (opcional)';

  @override
  String get loanFieldInstallmentAmount => 'Valor da parcela';

  @override
  String get loanFieldTotalInstallments => 'Número de parcelas';

  @override
  String get loanFieldFrequency => 'Frequência';

  @override
  String get loanFieldDueDayOfMonth => 'Dia de vencimento no mês';

  @override
  String get loanFieldStartDate => 'Data de início';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Avisar N dias antes do vencimento';

  @override
  String get loanFieldNotes => 'Notas (opcional)';

  @override
  String get loanFrequencyMonthly => 'Mensal';

  @override
  String get loanFrequencyWeekly => 'Semanal';

  @override
  String get loanFrequencyBiweekly => 'Quinzenal';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total pagas';
  }

  @override
  String get loanMarkPaid => 'Marcar como pago';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Marcar $count parcelas como pagas';
  }

  @override
  String get loanStatusPending => 'Pendente';

  @override
  String get loanStatusPaid => 'Pago';

  @override
  String get loanStatusOverdue => 'Atrasado';

  @override
  String loanInstallmentNumber(int number) {
    return 'Parcela nº $number';
  }

  @override
  String get loanDeleteConfirmTitle => 'Excluir este empréstimo?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'As $count parcelas também serão removidas.';
  }

  @override
  String get categoryManagerTitle => 'Categorias';

  @override
  String get categoryFormTitleNew => 'Nova categoria';

  @override
  String get categoryFormTitleEdit => 'Editar categoria';

  @override
  String get categoryFieldName => 'Nome';

  @override
  String get categoryFieldNameRequired => 'O nome é obrigatório';

  @override
  String get categoryFieldIcon => 'Ícone';

  @override
  String get categoryFieldColor => 'Cor';

  @override
  String get categoryDeleteSimpleTitle => 'Excluir esta categoria?';

  @override
  String get categoryDeleteSimpleBody => 'Esta categoria não tem lembretes.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Esta categoria ainda tem lembretes';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count lembretes usam esta categoria. Escolha o que fazer com eles.';
  }

  @override
  String get categoryDeleteReassign => 'Mover para outra categoria';

  @override
  String get categoryDeleteReassignTarget => 'Mover para';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Excluir todos os $count lembretes';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Isso excluirá permanentemente $count lembretes. Essa ação não pode ser desfeita.';
  }

  @override
  String get categoryReorderHint => 'Arraste para reordenar';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsDefaultReminderTime => 'Horário padrão do lembrete';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Escuro';

  @override
  String get settingsBackupRestore => 'Backup e restauração';

  @override
  String get settingsExport => 'Exportar backup';

  @override
  String get settingsImport => 'Restaurar backup';

  @override
  String get settingsExportLocationHint =>
      'Salvo em Android/data/com.ireminder.ireminder/files/backups';

  @override
  String get settingsExportSuccess => 'Backup salvo';

  @override
  String get settingsImportNoneFound => 'Nenhum arquivo de backup encontrado';

  @override
  String get settingsImportPickFile => 'Escolher um backup';

  @override
  String get settingsImportSuccess => 'Backup restaurado';

  @override
  String get settingsImportConfirmTitle => 'Restaurar backup?';

  @override
  String get settingsImportConfirmBody =>
      'Isso substitui todos os dados atuais pelo conteúdo do arquivo de backup.';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsBatteryOptimizationTitle =>
      'As notificações não chegam na hora certa?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Alguns fabricantes (Samsung, Xiaomi, Oppo...) restringem bastante os apps em segundo plano. Desative a otimização de bateria do iReminder em Ajustes > Bateria do seu celular para garantir que os lembretes sempre cheguem na hora.';

  @override
  String get errorGeneric => 'Algo deu errado. Tente novamente.';

  @override
  String get errorLoadFailed => 'Não foi possível carregar os dados.';

  @override
  String get settingsAiSectionTitle => 'Assistente de IA';

  @override
  String get settingsAiEnable => 'Ativar Assistente de IA';

  @override
  String get settingsAiProvider => 'Provedor de IA';

  @override
  String get settingsAiModel => 'Modelo';

  @override
  String get settingsAiApiKey => 'Chave de API';

  @override
  String get settingsAiApiKeyHint => 'Cole sua chave de API';

  @override
  String get settingsAiApiKeyHelp => 'Onde consigo uma chave?';

  @override
  String get settingsAiApiKeySaved => 'Chave de API salva';

  @override
  String get settingsAiAllowedCategories =>
      'Categorias que o assistente pode ler';

  @override
  String get settingsAiAllowedCategoriesHint =>
      'Todas as categorias, exceto Finanças, são compartilhadas por padrão — desative as que não quiser que o assistente veja.';

  @override
  String get settingsAiClearHistory => 'Limpar histórico de conversas';

  @override
  String get settingsAiClearHistoryConfirmTitle =>
      'Limpar histórico de conversas?';

  @override
  String get settingsAiClearHistoryConfirmBody =>
      'Isso apaga todas as perguntas e respostas salvas neste aparelho. Essa ação não pode ser desfeita.';

  @override
  String get assistantTitle => 'Assistente';

  @override
  String get assistantEmptyTitle => 'Pergunte qualquer coisa';

  @override
  String get assistantEmptyBody =>
      'Tente \"O que preciso fazer esta semana?\" ou \"Quantas parcelas faltam no meu financiamento da moto?\"';

  @override
  String get assistantInputHint => 'Digite uma pergunta…';

  @override
  String get assistantSend => 'Enviar';

  @override
  String get assistantDisabledTitle => 'O assistente está desativado';

  @override
  String get assistantDisabledBody =>
      'Ative em Ajustes e escolha um provedor de IA para começar a conversar.';

  @override
  String get assistantOpenSettings => 'Abrir Ajustes';

  @override
  String get assistantThinking => 'Pensando…';

  @override
  String get validationRequired => 'Obrigatório';

  @override
  String get validationDayOfMonth => 'Digite um dia de 1 a 31';

  @override
  String get validationMonth => 'Digite um mês de 1 a 12';

  @override
  String get validationPositiveNumber => 'Digite um número maior que 0';

  @override
  String get validationPositiveInteger =>
      'Digite um número inteiro maior que 0';

  @override
  String get settingsPermissionsSectionTitle => 'Notificações e alarmes';

  @override
  String get settingsPermissionsNotificationLabel => 'Permissão de notificação';

  @override
  String get settingsPermissionsExactAlarmLabel => 'Permissão de alarme exato';

  @override
  String get settingsPermissionsGranted => 'Concedida';

  @override
  String get settingsPermissionsDenied =>
      'Não concedida — os lembretes podem não disparar na hora certa';

  @override
  String get settingsPermissionsGrantAction => 'Conceder';

  @override
  String get settingsPermissionsOpenSettingsAction => 'Abrir ajustes';

  @override
  String get onboardingExactAlarmRationaleTitle => 'Mais uma permissão';

  @override
  String get onboardingExactAlarmRationaleBody =>
      'Na próxima tela, permita que o iReminder agende alarmes exatos para que os lembretes disparem na hora certa.';

  @override
  String get loanMarkPaidSuccess => 'Marcado como pago';

  @override
  String get settingsNotificationPrefsTitle => 'Som e vibração';

  @override
  String get settingsNotificationSound => 'Som de notificação';

  @override
  String get settingsNotificationVibration => 'Vibração';

  @override
  String get settingsSnoozeDuration => 'Duração do soneca';

  @override
  String get snoozeDuration5Min => '5 minutos';

  @override
  String get snoozeDuration10Min => '10 minutos';

  @override
  String get snoozeDuration15Min => '15 minutos';

  @override
  String get snoozeDuration30Min => '30 minutos';

  @override
  String get snoozeDuration60Min => '1 hora';

  @override
  String get snoozeDuration120Min => '2 horas';

  @override
  String get defaultCategoryHomeAppliances => 'Casa e eletrodomésticos';

  @override
  String get defaultCategoryVehicles => 'Veículos';

  @override
  String get defaultCategoryFamilyEvents => 'Aniversários e família';

  @override
  String get defaultCategoryFinance => 'Finanças';

  @override
  String get defaultCategoryWork => 'Trabalho';

  @override
  String get defaultCategoryFamily => 'Família';

  @override
  String get defaultCategoryOutdoorEvents => 'Passeios e eventos';

  @override
  String get defaultCategoryHealth => 'Saúde';
}
